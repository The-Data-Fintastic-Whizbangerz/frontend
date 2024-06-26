import '/pages/guide/guide_page.dart';
import '/pages/news/news_page.dart';
import '/pages/product/loan_page.dart';
import '/pages/product/product_page.dart';
import '/pages/product/repayment_page.dart';
import '/pages/about/about_page.dart';
import '/pages/contact/contact_page.dart';
import '/pages/home_page.dart';
import '/pages/signin/signin_page.dart';
import '/pages/signout/signout_page.dart';
import '/pages/signup/signup_page.dart';
import 'package:flutter/material.dart';

enum RouteConst {
  HOME_PAGE('home', Icons.home_filled, HomePage()),
  ABOUT_PAGE('about', Icons.home_filled, AboutWidget()),
  PRODUCT_PAGE('products', Icons.home_filled, ProductWidget()),
  REPAYMENT_PAGE(
      'products/repayment-calculator', Icons.home_filled, RepaymentPage()),
  LOAN_PAGE(
      'products/loan-eligibility-calculator', Icons.home_filled, LoanPage()),
  GUIDES_PAGE('guides', Icons.home_filled, GuidePage()),
  NEWS_PAGE('news', Icons.person_rounded, NewsPage()),
  CONTACT_PAGE('contact', Icons.mail, ContactPage()),
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
