import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

/// A utility class for initializing the Flutter application.
///
/// This class ensures Flutter bindings are initialized and sets the
/// device orientation for mobile platforms.
class AppInitializer {
  /// Initializes the application setup.
  ///
  /// Ensures Flutter bindings are initialized and configures device
  /// orientation settings.
  static initialize() async {
    _ensureInitialized();
    await _setupDeviceOrientation();
  }

  /// Ensures that Flutter bindings are initialized.
  static _ensureInitialized() {
    WidgetsFlutterBinding.ensureInitialized();
  }

  /// Configures the device orientation and system UI overlays.
  ///
  /// Locks the device orientation to portrait mode and ensures system
  /// UI overlays are manually configured.
  static _setupDeviceOrientation() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
  }
}
