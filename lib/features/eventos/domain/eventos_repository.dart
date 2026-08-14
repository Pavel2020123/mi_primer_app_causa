import 'package:rolla/features/eventos/domain/evento.dart';

abstract interface class EventosRepository {
  Future<List<Evento>> obtenerTodos();

  Future<Evento?> obtenerPorId(String id);

  Future<List<Evento>> obtenerProgramados();
}
