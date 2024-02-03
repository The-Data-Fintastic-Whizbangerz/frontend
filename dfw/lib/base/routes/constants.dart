import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/guide/guide_page.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/news/news_page.dart';
import 'package:The_Data_Fintastic_Whizbangerz_Group/pages/product/product_page.dart';

import '../../pages/about/about_page.dart';
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
  HOME_PAGE('home', Icons.home_filled, HomePage()),
  ABOUT_PAGE('about', Icons.home_filled, AboutPage()),
  PRODUCT_PAGE('products', Icons.home_filled, ProductPage()),
  CALCULATOR_PAGE('calculator', Icons.calculate, CalculatorPage()),
  GUIDES_PAGE('guides', Icons.home_filled, GuidePage()),
  NEWS_PAGE('news', Icons.person_rounded, NewsPage()),

  DASHBOARD_PAGE('dashboard', Icons.grid_view_rounded, DashboardPage()),
  PROFILE_PAGE('profile', Icons.person_rounded, ProfilePage()),

  // STATISTIC_PAGE('statistic', Icons.analytics, ),

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
