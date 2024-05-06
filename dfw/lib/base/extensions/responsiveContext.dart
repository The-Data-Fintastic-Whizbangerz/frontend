import 'package:flutter/material.dart';

// More Detail Responsive as extenstion
extension Responsive on BuildContext {
  T responsive<T>({
    required T xs,
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final width = MediaQuery.of(this).size.width;
    final ratio = MediaQuery.of(this).size.aspectRatio;
    return (width >= 1920) // TV
        ? (xl ?? lg ?? md ?? sm ?? xs)
        : (width >= 1440) // Computer
            ? (lg ?? md ?? sm ?? xs)
            : (width >= 1024) // Tablet Landscape
                ? (md ?? sm ?? xs)
                : (width >= 768) // Tablet Portrait
                    ? (sm ?? xs)
                    : xs;
  }
}
