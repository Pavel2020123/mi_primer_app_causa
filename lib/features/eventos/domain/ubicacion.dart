import 'package:rolla/core/json.dart';

class Ubicacion {
  const Ubicacion({
    required this.latitud,
    required this.longitud,
    required this.lugar,
  });

  factory Ubicacion.fromJson(Map<String, dynamic> json) => Ubicacion(
    latitud: leerDecimal(json, 'latitud'),
    longitud: leerDecimal(json, 'longitud'),
    lugar: leerTexto(json, 'lugar'),
  );

  final double latitud;
  final double longitud;
  final String lugar;

  Map<String, dynamic> toJson() => {
    'latitud': latitud,
    'longitud': longitud,
    'lugar': lugar,
  };

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Ubicacion &&
          other.latitud == latitud &&
          other.longitud == longitud &&
          other.lugar == lugar;

  @override
  int get hashCode => Object.hash(latitud, longitud, lugar);

  @override
  String toString() => 'Ubicacion($lugar, $latitud, $longitud)';
}
