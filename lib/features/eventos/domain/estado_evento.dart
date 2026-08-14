import 'package:rolla/core/json.dart';

sealed class EstadoEvento {
  const EstadoEvento();

  factory EstadoEvento.fromJson(Map<String, dynamic> json) {
    final tipo = leerTexto(json, 'tipo');

    return switch (tipo) {
      'programado' => Programado(leerFecha(json, 'publicadoEn')),
      'en_curso' => EnCurso(leerFecha(json, 'iniciadoEn')),
      'finalizado' => Finalizado(leerFecha(json, 'finalizadoEn')),
      'cancelado' => Cancelado(leerTexto(json, 'motivo')),
      _ => throw CampoInvalido('estado.tipo', 'no es un estado conocido', tipo),
    };
  }

  Map<String, dynamic> toJson() => switch (this) {
    Programado(:final publicadoEn) => {
      'tipo': 'programado',
      'publicadoEn': publicadoEn.toIso8601String(),
    },
    EnCurso(:final iniciadoEn) => {
      'tipo': 'en_curso',
      'iniciadoEn': iniciadoEn.toIso8601String(),
    },
    Finalizado(:final finalizadoEn) => {
      'tipo': 'finalizado',
      'finalizadoEn': finalizadoEn.toIso8601String(),
    },
    Cancelado(:final motivo) => {'tipo': 'cancelado', 'motivo': motivo},
  };

  bool get sePuedeInscribir => switch (this) {
    Programado() => true,
    EnCurso() || Finalizado() || Cancelado() => false,
  };

  String get etiqueta => switch (this) {
    Programado() => 'Programado',
    EnCurso() => 'En curso',
    Finalizado() => 'Finalizado',
    Cancelado(:final motivo) => 'Cancelado: $motivo',
  };
}

final class Programado extends EstadoEvento {
  const Programado(this.publicadoEn);

  final DateTime publicadoEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Programado && other.publicadoEn == publicadoEn;

  @override
  int get hashCode => Object.hash(runtimeType, publicadoEn);

  @override
  String toString() => 'Programado($publicadoEn)';
}

final class EnCurso extends EstadoEvento {
  const EnCurso(this.iniciadoEn);

  final DateTime iniciadoEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EnCurso && other.iniciadoEn == iniciadoEn;

  @override
  int get hashCode => Object.hash(runtimeType, iniciadoEn);

  @override
  String toString() => 'EnCurso($iniciadoEn)';
}

final class Finalizado extends EstadoEvento {
  const Finalizado(this.finalizadoEn);

  final DateTime finalizadoEn;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Finalizado && other.finalizadoEn == finalizadoEn;

  @override
  int get hashCode => Object.hash(runtimeType, finalizadoEn);

  @override
  String toString() => 'Finalizado($finalizadoEn)';
}

final class Cancelado extends EstadoEvento {
  const Cancelado(this.motivo) : assert(motivo != '', 'cancelar exige motivo');

  final String motivo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Cancelado && other.motivo == motivo;

  @override
  int get hashCode => Object.hash(runtimeType, motivo);

  @override
  String toString() => 'Cancelado($motivo)';
}
