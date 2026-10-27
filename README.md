# Parcel Receiving

Offline-first Flutter application for warehouse parcel receiving and BLE scale diagnostics.

## Current diagnostic build

- Feature-Sliced Design structure with Riverpod and go_router.
- Russian, English and Simplified Chinese interfaces.
- Persisted light, dark and system themes.
- BLE scale scanning, connection diagnostics and RAW HEX/ASCII log.
- Confirmed Co5 commands on UUIDs FFE0/FFE1/FFE2.
- Parsing of documented `GW`, `NW` and `TW` kilogram responses.

## Development

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

The BLE tester requires a physical Android device. See [TESTER_INSTRUCTIONS_RU.md](TESTER_INSTRUCTIONS_RU.md) for test steps.
