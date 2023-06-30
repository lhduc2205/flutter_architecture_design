import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

class AppSnackBar {
  const AppSnackBar._();

  static void show(
    String message, {
    Color? backgroundColor,
    Duration? duration,
  }) {
    scaffoldMessengerKey.currentState!
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          key: GlobalKey(),
          elevation: 0.0,
          //behavior: SnackBarBehavior.floating,
          content: Text(message),
          duration: duration ?? const Duration(seconds: 1),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(16.0), topRight: Radius.circular(16.0)),
          // ),
          backgroundColor: backgroundColor ?? Colors.blueAccent,
        ),
      );
  }

  static void hide() {
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
  }
}
