import '/pages/guide/guide_page.dart';
import '/pages/news/news_page.dart';
import '/pages/product/borrowing_page.dart';
import '/pages/product/loan_page.dart';
import '/pages/product/product_page.dart';
import '/pages/product/repayment_page.dart';
import '/pages/about/about_page.dart';
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
  ABOUT_PAGE('about', Icons.home_filled, AboutWidget()),
  PRODUCT_PAGE('products', Icons.home_filled, ProductWidget()),
  // BORROWING_PAGE('products/loan-eligibility-calculator', Icons.home_filled,
  //     BorrowingPage()),
  REPAYMENT_PAGE(
      'products/repayment-calculator', Icons.home_filled, RepaymentPage()),
  LOAN_PAGE(
      'products/loan-eligibility-calculator', Icons.home_filled, LoanPage()),
  CALCULATOR_PAGE('calculator', Icons.calculate, CalculatorPage()),
  GUIDES_PAGE('guides', Icons.home_filled, GuidePage()),
  NEWS_PAGE('news', Icons.person_rounded, NewsPage()),

  DASHBOARD_PAGE('dashboard', Icons.grid_view_rounded, DashboardPage()),
  PROFILE_PAGE('profile', Icons.person_rounded, ProfilePage()),

  // STATISTIC_PAGE('statistic', Icons.analytics, ),

  CONTACT_PAGE('contact', Icons.mail, ContactPage()),
  SETTING_PAGE('settings', Icons.settings, SettingsPage()),
  SIGNIN_PAGE('signin', Icons.input_rounded, SignInWidget()),
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
