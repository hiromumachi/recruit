import 'package:flutter/material.dart';

extension BuildContextExtension on BuildContext {
  Size get screen => MediaQuery.of(this).size;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
  EdgeInsets get padding => MediaQuery.of(this).padding;
  Orientation get orientation => MediaQuery.of(this).orientation;

  MediaQueryData get resetTextScaleFactor =>
      MediaQuery.of(this).copyWith(textScaler: const TextScaler.linear(1));

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop(result);
  }

  void popUntilFirst() {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}
