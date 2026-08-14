# Rolla — Dominio de Eventos

Plataforma para la gestión e información de eventos deportivos de patinaje. 
Resuelve la falta de un lugar centralizado donde organizar, consultar y filtrar eventos de Rolla por ubicación y estado.

## El dominio

- `Evento` — entidad principal. Identidad: `id`.
- `Ubicacion` — objeto de valor.
- `EstadoEvento` — sellada: Borrador · Publicado · EnCurso · Finalizado · Cancelado.

Decisión: modelo con freezed, porque genera automáticamente igualdad, hashCode y copyWith sin código repetitivo.

## Cómo correrlo

    flutter pub get
    flutter test
    flutter run
