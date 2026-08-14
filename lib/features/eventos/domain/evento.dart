import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rolla/core/json.dart';
import 'package:rolla/features/eventos/domain/estado_evento.dart';
import 'package:rolla/features/eventos/domain/ubicacion.dart';

part 'evento.freezed.dart';

@Freezed(fromJson: false, toJson: false)
abstract class Evento with _$Evento {
  const factory Evento({
    required String id,
    required String nombre,
    required String descripcion,
    required Ubicacion ubicacion,
    required DateTime fecha,
    required EstadoEvento estado,
    @Default(<String>[]) List<String> inscritos,
  }) = _Evento;

  const Evento._();

  factory Evento.fromJson(Map<String, dynamic> json) => Evento(
    id: leerTexto(json, 'id'),
    nombre: leerTexto(json, 'nombre'),
    descripcion: leerTexto(json, 'descripcion'),
    ubicacion: Ubicacion.fromJson(leerMapa(json, 'ubicacion')),
    fecha: leerFecha(json, 'fecha'),
    estado: EstadoEvento.fromJson(leerMapa(json, 'estado')),
    inscritos: leerTextos(json, 'inscritos'),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nombre': nombre,
    'descripcion': descripcion,
    'ubicacion': ubicacion.toJson(),
    'fecha': fecha.toUtc().toIso8601String(),
    'estado': estado.toJson(),
    'inscritos': inscritos,
  };

  // Reglas de negocio

  bool get puedeInscribirse => estado.sePuedeInscribir;

  bool get tieneInscritos => inscritos.isNotEmpty;

  Duration tiempoDesdeElEvento(DateTime ahora) => ahora.difference(fecha);

  bool yaOcurrio(DateTime ahora) => ahora.isAfter(fecha);

  @override
  String toString() => 'Evento($id, $nombre, ${estado.etiqueta})';
}
