import 'package:The_Data_Fintastic_Whizbangerz_Group/base/extensions/string.dart';
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
    return Padding(
      padding: padding,
      child: selected
          ? ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                foregroundColor: Colors.black,
                backgroundColor: Colors.white70,
              ),
              onPressed: onPressed,
              child: Text(path.capitalize()),
            )
          : TextButton(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
              onPressed: onPressed,
              child: Text(path.capitalize()),
            ),
    );
  }

  // Text _text(BuildContext context, Color? textColor) => Text(
  //       "#${color.toHex()}",
  //       style:
  //           Theme.of(context).textTheme.headline6!.copyWith(color: textColor),
  //     );
}
