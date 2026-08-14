import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:rolla/core/json.dart';
import 'package:rolla/features/eventos/data/eventos_locales.dart';

const _json = '''
[
  {
    "id": "eve-001",
    "nombre": "Festival de Patinaje Valledupar",
    "descripcion": "Evento deportivo de patinaje.",
    "ubicacion": {
      "latitud": 10.4631,
      "longitud": -73.2532,
      "lugar": "Patinódromo Municipal de Valledupar"
    },
    "fecha": "2026-08-20T19:00:00Z",
    "estado": {
      "tipo": "programado",
      "publicadoEn": "2026-08-10T15:00:00Z"
    }
  }
]
''';

void main() {
  test('lee la lista completa del archivo', () async {
    final repo = EventosLocales(lector: (_) async => _json);

    expect((await repo.obtenerTodos()).length, 1);
  });

  test('busca por id y devuelve null cuando no está', () async {
    final repo = EventosLocales(lector: (_) async => _json);

    expect(
      (await repo.obtenerPorId('eve-001'))?.nombre,
      'Festival de Patinaje Valledupar',
    );

    expect(await repo.obtenerPorId('no-existe'), isNull);
  });

  test('un archivo que no es una lista se rechaza', () async {
    final repo = EventosLocales(lector: (_) async => '{"a": 1}');

    expect(repo.obtenerTodos(), throwsA(isA<CampoInvalido>()));
  });

  test('obtiene solamente los eventos programados', () async {
    final repo = EventosLocales(lector: (_) async => _json);

    final eventos = await repo.obtenerProgramados();

    expect(eventos.length, 1);
    expect(eventos.first.id, 'eve-001');
  });

  test(
    'el asset declarado en pubspec existe y el modelo lo entiende',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();

      final repo = EventosLocales(lector: rootBundle.loadString);

      expect((await repo.obtenerTodos()).length, greaterThanOrEqualTo(3));
    },
  );
}
