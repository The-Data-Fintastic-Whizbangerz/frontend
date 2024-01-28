import 'package:flutter/material.dart';

extension Neumorphism on Widget {
  addNeumorphism(
    BuildContext context, {
    double borderRadius = 10.0,
    double blurRadius = 10,
    Offset offset = const Offset(8, 8),
  }) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: Theme.of(context).colorScheme.secondary,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dy),
            blurRadius: blurRadius,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
      child: this,
    );
  }
}

extension NeumorphismInner on Widget {
  addNeumorphismInner(
    BuildContext context, {
    double borderRadius = 10.0,
    double blurRadius = 1,
    Offset offset = const Offset(4, 4),
  }) {
    return Ink(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        boxShadow: [
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius,
            color: Theme.of(context).colorScheme.primary,
          ),
          BoxShadow(
            offset: Offset(-offset.dx, -offset.dy),
            blurRadius: blurRadius,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
      child: this,
    );
  }
}
