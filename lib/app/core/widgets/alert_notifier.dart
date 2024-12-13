import 'package:flutter/material.dart';

class AlertNotifier {
  static ScaffoldMessengerState? _messenger;

  static void init(BuildContext context) {
    _messenger = ScaffoldMessenger.of(context);
  }

  static void showSnackbar({
    required String message,
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 2),
  }) {
    _messenger?.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: duration,
      ),
    );
  }
}
