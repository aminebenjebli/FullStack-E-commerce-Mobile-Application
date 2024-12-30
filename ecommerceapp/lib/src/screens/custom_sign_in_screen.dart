import 'package:ecommerceapp/src/routing/app_route.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CustomSignInScreen extends ConsumerWidget {
  const CustomSignInScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = <AuthProvider>[
      EmailAuthProvider(),
      PhoneAuthProvider(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: SignInScreen(
        providers: authProviders,
      ),
    );
  }
}
