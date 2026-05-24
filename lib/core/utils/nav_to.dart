import 'package:flutter/material.dart';

class NavTo {
  static Future<T?> push<T>({
    required BuildContext context,
    required Widget nextPage,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    return Navigator.push<T>(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  static void pushReplacement({
    required BuildContext context,
    required Widget nextPage,
  }) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => nextPage,
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1, 0), // Start from right
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },
      ),
    );
  }

  static void pop(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.pop(context);
  }
}
