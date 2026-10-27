import 'package:go_router/go_router.dart';

import '../../pages/scale_diagnostics/scale_diagnostics_page.dart';
import '../../pages/settings/settings_page.dart';

final appRouter = GoRouter(
  initialLocation: '/diagnostics',
  routes: [
    GoRoute(
      path: '/diagnostics',
      builder: (_, _) => const ScaleDiagnosticsPage(),
    ),
    GoRoute(path: '/settings', builder: (_, _) => const SettingsPage()),
  ],
);
