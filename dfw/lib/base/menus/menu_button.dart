import 'package:flutter/material.dart';

import '../../base/extensions/string.dart';

class NavigationMenuButton extends StatelessWidget {
  final String path;
  final bool selected;
  final bool hasSubMenu;
  final EdgeInsets padding;
  final VoidCallback onPressed;
  final Function(dynamic)? onSelected;
  final Function(bool)? onHover;
  final List<PopupMenuEntry<dynamic>> Function(BuildContext) itemBuilder;

  const NavigationMenuButton({
    Key? key,
    required this.path,
    required this.selected,
    required this.hasSubMenu,
    this.padding = const EdgeInsets.all(5),
    required this.onPressed,
    this.onSelected,
    this.onHover,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget subMenu = PopupMenuButton(
      elevation: 3,
      color: Colors.white70,
      padding: EdgeInsets.zero,
      shadowColor: Colors.black87,
      surfaceTintColor: Colors.white,
      tooltip: 'Show More Menus',
      offset: Offset(-80, 30),
      position: PopupMenuPosition.under,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      itemBuilder: itemBuilder,
      child: Text(path.toCapitalise()),
    );

    return Padding(
      padding: padding,
      child: selected
          ? TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                backgroundColor: Colors.white70,
              ),
              onPressed: onPressed,
              onHover: onHover,
              child: hasSubMenu ? subMenu : Text(path.toCapitalise()))
          : TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.transparent,
              ),
              onPressed: onPressed,
              onHover: onHover,
              child: hasSubMenu ? subMenu : Text(path.toCapitalise())),
    );
  }
}
