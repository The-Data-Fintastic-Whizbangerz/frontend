import 'color_extensions.dart';
import 'package:flutter/material.dart';

class NavigationMenuButton extends StatelessWidget {
  final String path;
  final bool selected;
  final EdgeInsets padding;
  final VoidCallback onPressed;

  const NavigationMenuButton({
    Key? key,
    required this.path,
    required this.selected,
    required this.onPressed,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Brightness brightness = ThemeData.estimateBrightnessForColor(path);
    // Color textColor =
    //     brightness == Brightness.light ? Colors.black : Colors.white;
    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              onPressed: () {},
              child: Text(path),
            )
          : TextButton(onPressed: onPressed, child: Text(path)),
    );
  }

  // Text _text(BuildContext context, Color? textColor) => Text(
  //       "#${color.toHex()}",
  //       style:
  //           Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
  //     );
}
