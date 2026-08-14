# Rolla — Dominio de Eventos

Proyecto desarrollado para el laboratorio E02 de modelado del dominio.

El proyecto modela el dominio de **eventos deportivos de Rolla**, una plataforma 
orientada a la gestión e información de eventos de patinaje. El objetivo de este 
laboratorio es construir un dominio independiente de Flutter, con validación de 
datos JSON, estados sellados, reglas de negocio, pruebas automatizadas y una 
implementación de datos local.

## El dominio

- `Evento` — entidad principal. Su identidad está determinada por `id`.
- `Ubicacion` — objeto de valor que representa el lugar del evento.
- `EstadoEvento` — jerarquía sellada que representa los diferentes estados de un evento.
- `EventosRepository` — contrato que define cómo se obtienen los eventos.
- `EventosLocales` — implementación que obtiene los eventos desde un archivo JSON local.

## Decisión de modelado

El modelo usa `freezed` para generar igualdad, copyWith, hashCode y toString,
pero mantiene el `fromJson` escrito a mano con `CampoInvalido` para conservar
mensajes de error que nombran el campo exacto que falla.

## Estructura

```text
lib/
├── core/
│   ├── comparaciones.dart
│   └── json.dart
│
├── features/
│   └── eventos/
│       ├── domain/
│       │   ├── estado_evento.dart
│       │   ├── evento.dart
│       │   ├── eventos_repository.dart
│       │   └── ubicacion.dart
│       │
│       ├── data/
│       │   └── eventos_locales.dart
│       │
│       └── presentation/
│
└── main.dart

assets/
└── data/
    └── eventos.json

test/
├── data/
└── domain/


## Cómo correrlo

```bash
flutter pub get
flutter test
flutter run