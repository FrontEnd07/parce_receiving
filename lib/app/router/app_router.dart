import 'package:go_router/go_router.dart';

import '../../pages/authentication/login_page.dart';
import '../../pages/authentication/registration_page.dart';
import '../../pages/barcode_scan/barcode_scan_page.dart';
import '../../pages/capture_photo/capture_photo_page.dart';
import '../../pages/receiving/receiving_page.dart';
import '../../pages/export/export_page.dart';
import '../../pages/scale_diagnostics/scale_diagnostics_page.dart';
import '../../pages/settings/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/login',
  routes: [
    GoRoute(path: '/login', builder: (_, _) => const LoginPage()),
    GoRoute(path: '/register', builder: (_, _) => const RegistrationPage()),
    GoRoute(path: '/receiving', builder: (_, _) => const ReceivingPage()),
    GoRoute(path: '/export', builder: (_, _) => const ExportPage()),
    GoRoute(path: '/scan', builder: (_, _) => const BarcodeScanPage()),
    GoRoute(
      path: '/photo',
      builder: (_, state) =>
          CapturePhotoPage(fallbackBarcode: state.extra as String?),
    ),
    GoRoute(
      path: '/diagnostics',
      builder: (_, _) => const ScaleDiagnosticsPage(),
    ),
    GoRoute(path: '/settings', builder: (_, _) => const SettingsPage()),
  ],
);
