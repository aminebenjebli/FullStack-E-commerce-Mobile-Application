import 'package:ecommerceapp/src/routing/go_router_refresh_stream.dart';
import 'package:ecommerceapp/src/screens/custom_profile_screen.dart';
import 'package:ecommerceapp/src/screens/custom_sign_in_screen.dart';
import 'package:ecommerceapp/src/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  signIn,
  home,
  profile,
}

final firebaseAuthProvider = Provider<FirebaseAuth>((ref) {
  return FirebaseAuth.instance;
}); //provider for firebase auth instead of the default one singleton for better testing

final goRouterProvider = Provider<GoRouter>((ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/sign-in',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if (isLoggedIn) {
        if (state.uri.path == '/sign-in') {
          return '/home';
        }
      } else {
        if (state.uri.path.startsWith('/home')) {
          return '/sign-in';
        }
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth
        .authStateChanges()), //When the auth state changes , GoRouter will redirect to the correct route based on the logic
    routes: [
      GoRoute(
          path: '/sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const CustomSignInScreen()),
      GoRoute(
        path: '/home',
        name: AppRoute.home.name,
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'profile',
            name: AppRoute.profile.name,
            builder: (context, state) => const CustomProfileScreen(),
          ),
        ],
      ),
    ],
  );
});
