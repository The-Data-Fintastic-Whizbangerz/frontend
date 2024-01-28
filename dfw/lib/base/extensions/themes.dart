import 'package:flutter/material.dart';

class BasicTheme {
  //light
  static Color lightBackground = Color(0xFFF0F0F3);
  static Color lightPrimary = Colors.white;
  static Color lightSecondary = Color(0xFFAEAEC0);

  //dark
  static Color darkBackground = Colors.grey.shade900;
  static Color darkPrimary = Color(0xFF2D2D2D);
  static Color darkSecondary = Colors.black;

  //test
  static Color aaa = Colors.red;
  static Color bbb = Colors.amber;
}

class NeumorphismTheme {
  static ThemeData lightTheme() {
    final ThemeData baseLight = ThemeData.light();

    return baseLight.copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: BasicTheme.lightBackground,
      colorScheme: ColorScheme.light(
        background: BasicTheme.lightBackground,
        primary: BasicTheme.lightPrimary,
        secondary: BasicTheme.lightSecondary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: BasicTheme.lightPrimary,
        centerTitle: true,
        iconTheme: const IconThemeData(size: 40),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: BasicTheme.lightPrimary,
        shadowColor: BasicTheme.lightSecondary,
        elevation: 10,
        width: 200,
      ),
      listTileTheme: ListTileThemeData(
        selectedTileColor: BasicTheme.darkBackground,
        textColor: BasicTheme.darkSecondary,
        iconColor: BasicTheme.darkSecondary,
        contentPadding: EdgeInsets.symmetric(horizontal: 15),
        horizontalTitleGap: 0,
        minVerticalPadding: 20,
        dense: true,
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: BasicTheme.lightPrimary,
        height: 65,
      ),
    );
  }

  static ThemeData darkTheme() {
    final ThemeData baseDark = ThemeData.dark();

    return baseDark.copyWith(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: BasicTheme.darkBackground,
        colorScheme: ColorScheme.dark(
          background: BasicTheme.darkBackground,
          primary: BasicTheme.darkPrimary,
          secondary: BasicTheme.darkSecondary,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: BasicTheme.darkSecondary,
          centerTitle: true,
          iconTheme: const IconThemeData(size: 40),
        ),
        drawerTheme: DrawerThemeData(
          backgroundColor: BasicTheme.darkSecondary,
          shadowColor: BasicTheme.darkPrimary,
          width: 200,
        ),
        listTileTheme: ListTileThemeData(
          selectedTileColor: BasicTheme.lightBackground,
          textColor: BasicTheme.lightPrimary,
          iconColor: BasicTheme.lightPrimary,
          contentPadding: EdgeInsets.symmetric(horizontal: 15),
          horizontalTitleGap: 0,
          minVerticalPadding: 20,
          dense: true,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: BasicTheme.darkSecondary,
          height: 65,
        ));
  }
}
