import 'package:ecommerceapp/src/routing/go_router_refresh_stream.dart';
import 'package:ecommerceapp/src/screens/custom_profile_screen.dart';
import 'package:ecommerceapp/src/screens/custom_sign_in_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  signIn,
  profile,
}

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = FirebaseAuth.instance.currentUser != null;
      if (isLoggedIn) {
        if (state.uri.path == '/sign-in') {
          return '/profile';
        }
      } else {
        if (state.uri.path == '/profile') {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable:
        GoRouterRefreshStream(FirebaseAuth.instance.authStateChanges()), //When the auth state changes , GoRouter will redirect to the correct route based on the logic 
    routes: [
      GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen()),
      GoRoute(
        path: '/profile',
        name: AppRoute.profile.name,
        builder: (context, state) => const CustomProfileScreen(),
      ),
    ],
  );
});
