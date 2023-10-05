import 'package:flutter/material.dart';
import 'package:textify/common/widgets/error_screen.dart';
import 'package:textify/features/authentication/screens/otp_screen.dart';
import 'package:textify/screens/contacts_screen.dart';
import 'package:textify/screens/login_screen.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginScreen.routeName:
      return MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      );
    case OTPScreen.routeName:
      final verificationId = settings.arguments as String;
      return MaterialPageRoute(
        builder: (context) => OTPScreen(
          verificationId: verificationId,
        ),
      );
    
    case ContactList.routeName:
      return MaterialPageRoute(
        builder: (context) => const ContactList(),
      );
    
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: ErrorScreen(error: 'This page doesn\'t exist'),
        ),
      );
  }
}