import '/pages/calculator/calculator_page.dart';
import '/pages/contact/contact_page.dart';
import '/pages/dashboard/dashboard_page.dart';
import '/pages/home_page.dart';
import '/pages/profile/profile_page.dart';
import '/pages/settings/settings_page.dart';
import '/pages/signin/signin_page.dart';
import '/pages/signout/signout_page.dart';
import '/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';

enum RouteConst {
  // LANDING_PAGE('', Icons.pages_rounded, 0),
  DASHBOARD_PAGE('dashboard', Icons.grid_view_rounded, DashboardPage()),
  HOME_PAGE('home', Icons.home_filled, HomePage()),
  PROFILE_PAGE('profile', Icons.person_rounded, ProfilePage()),
  // STATISTIC_PAGE('statistic', Icons.analytics, ),
  CALCULATOR_PAGE('calculator', Icons.calculate, CalculatorPage()),
  CONTACT_PAGE('contact', Icons.mail, ContactPage()),
  SETTING_PAGE('settings', Icons.settings, SettingsPage()),
  SIGNIN_PAGE('signin', Icons.input_rounded, SignInPage()),
  SIGNUP_PAGE('signup', Icons.rectangle_rounded, SignUpPage()),
  SIGNOUT_PAGE('signout', Icons.output_rounded, SignOutPage());

  final String path;
  final IconData icon;
  final Widget widget;

  const RouteConst(
    this.path,
    this.icon,
    this.widget,
  );
}
