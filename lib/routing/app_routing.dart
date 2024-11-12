import 'package:go_router/go_router.dart';
import 'package:proxvision/features/auth/features/login/view/login_screen.dart';
import 'package:proxvision/features/introduction/view/introduction_screen.dart';
import 'package:proxvision/features/landing/view/landing_screen.dart';
import 'package:proxvision/features/landing/widget/custom_navigation_bar.dart';
import 'package:proxvision/features/splash/view/splash_screen.dart';
import 'package:proxvision/services/navigator_service.dart';

/// NOTE:
/// * Navigate using path names
/// * To go to auth startup : use NavigatorService.go(AppRouting.authPath)
/// * ---- To go to screens within the auth path, use NavigatorService.push(AppRouting.loginPath)

class AppRouting {
  static const String splashPath = '/';

  /// Auth --------------------------------------
  static const authPath = '/auth';

  static const login = 'login';
  static const loginPath = '$authPath/login';

  /// Intro --------------------------------------
  static const introPath = '/intro';
  static const intro = 'intro';

  /// Bottom Nav --------------------------------
  static const home = 'home';
  static const homePath = '/$home';

  static const search = 'search';
  static const searchPath = '/$search';

  static const profile = 'profile';
  static const profilePath = '/$profile';

  static final GoRouter router = GoRouter(
    navigatorKey: NavigatorService.navigatorKey,
    routes: [
      GoRoute(
        path: splashPath,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: authPath,
        builder: (context, state) => const LoginScreen(),
        routes: [
          GoRoute(
            path: login,
            builder: (context, state) => const LoginScreen(),
          ),
          ]
      ),
      GoRoute(
        path: introPath,
        builder: (context, state) => const IntroductionScreen(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            LandingScreen(navigationShell: navigationShell),

        branches: bottomNavItems
            .map(
              (e) => StatefulShellBranch(
                routes: [
                  GoRoute(
                    path: e.path,
                    name: e.name,
                    builder: (context, state) => e.page,
                  )
                ],
              ),
            )
            .toList(),
      )
    ],
  );
}
