import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:rolla/core/json.dart';
import 'package:rolla/features/eventos/domain/estado_evento.dart';
import 'package:rolla/features/eventos/domain/evento.dart';
import 'package:rolla/features/eventos/domain/ubicacion.dart';

Evento ejemplo({EstadoEvento? estado, List<String>? inscritos}) => Evento(
  id: 'eve-001',
  nombre: 'Festival de Patinaje Valledupar',
  descripcion: 'Evento deportivo de patinaje.',
  ubicacion: const Ubicacion(
    latitud: 10.4631,
    longitud: -73.2532,
    lugar: 'Patinódromo Municipal de Valledupar',
  ),
  fecha: DateTime.utc(2026, 8, 20, 19),
  estado: estado ?? Programado(DateTime.utc(2026, 8, 10, 15)),
  inscritos: inscritos ?? const <String>[],
);

void main() {
  group('serialización', () {
    test('un evento sobrevive la ida y vuelta a JSON sin perder nada', () {
      final original = ejemplo(
        estado: EnCurso(DateTime.utc(2026, 8, 20, 19)),
        inscritos: const ['dep-001', 'dep-002'],
      );

      final texto = jsonEncode(original.toJson());
      final vuelta = Evento.fromJson(jsonDecode(texto) as Map<String, dynamic>);

      expect(vuelta, equals(original));
    });

    test('un evento sin la clave inscritos se lee con la lista vacía', () {
      final json = ejemplo().toJson()..remove('inscritos');

      expect(Evento.fromJson(json).inscritos, isEmpty);
    });

    test('un evento sin nombre dice qué campo falló', () {
      final json = ejemplo().toJson()..remove('nombre');

      expect(
        () => Evento.fromJson(json),
        throwsA(isA<CampoInvalido>().having((e) => e.campo, 'campo', 'nombre')),
      );
    });

    test('una fecha que no es ISO 8601 se rechaza', () {
      final json = ejemplo().toJson()..['fecha'] = '20 de agosto';

      expect(() => Evento.fromJson(json), throwsA(isA<CampoInvalido>()));
    });

    test('la fecha se conserva en UTC', () {
      final json = ejemplo().toJson();

      expect(json['fecha'], '2026-08-20T19:00:00.000Z');
    });
  });

  group('igualdad y copia', () {
    test('dos eventos con los mismos datos son iguales', () {
      expect(ejemplo(), equals(ejemplo()));
    });

    test('dos eventos con los mismos datos comparten hashCode', () {
      expect(ejemplo().hashCode, equals(ejemplo().hashCode));

      expect({ejemplo(), ejemplo()}.length, 1);
    });

    test('dos eventos con inscritos distintos no son iguales', () {
      expect(
        ejemplo(inscritos: const ['dep-001']),
        isNot(equals(ejemplo(inscritos: const ['dep-002']))),
      );
    });

    test('copyWith cambia solo lo que se le pasa', () {
      final original = ejemplo();
      final copia = original.copyWith(nombre: 'Nuevo evento');

      expect(copia.nombre, 'Nuevo evento');
      expect(copia.id, original.id);
      expect(copia.fecha, original.fecha);
    });
  });

  group('reglas de negocio', () {
    test('un evento programado permite inscripción', () {
      expect(
        ejemplo(
          estado: Programado(DateTime.utc(2026, 8, 10, 15)),
        ).puedeInscribirse,
        isTrue,
      );
    });

    test('un evento cancelado no permite inscripción', () {
      expect(
        ejemplo(
          estado: const Cancelado('Condiciones climáticas desfavorables.'),
        ).puedeInscribirse,
        isFalse,
      );
    });

    test('un evento cuya fecha ya pasó ya ocurrió', () {
      final ahora = DateTime.utc(2026, 8, 21);

      expect(ejemplo().yaOcurrio(ahora), isTrue);
    });
  });
}
