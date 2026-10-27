import 'package:android_intent_plus/android_intent.dart';

abstract final class BluetoothSettingsLauncher {
  static Future<void> open() =>
      const AndroidIntent(action: 'android.settings.BLUETOOTH_SETTINGS')
          .launch();
}
