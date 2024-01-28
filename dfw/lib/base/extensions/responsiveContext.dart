import 'package:flutter/material.dart';

// More Detail Responsive as extenstion
extension Responsive on BuildContext {
  T responsive<T>({
    required T sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1440
        ? (xl ?? lg ?? md ?? sm)
        : wd >= 1100
            ? (lg ?? md ?? sm)
            : wd >= 666
                ? (md ?? sm)
                : sm;
  }
}
