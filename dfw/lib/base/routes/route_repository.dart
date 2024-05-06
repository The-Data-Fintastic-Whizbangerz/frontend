import '../../pages/about/about_page.dart';
import '../../pages/contact/contact_page.dart';
import '../../pages/guide/guide_page.dart';
import '../../pages/home_page.dart';
import '../../pages/news/news_page.dart';
import '../../pages/product/product_page.dart';
import '../../pages/signin/signin_page.dart';
import '../../pages/signup/signup_page.dart';
import 'route_initial.dart';
import 'route_type.dart';

class RouteRepository {
  RouteRepository._();

  static List<RouteInitial> routes = [
    RouteInitial(
        type: RouteType(path: 'home'),
        level: RouteLevel.guest,
        widget: HomePage()),
    RouteInitial(
        type: RouteType(path: 'products'),
        level: RouteLevel.guest,
        widget: ProductWidget()),
    // RouteInitial(
    //     type: RouteType(path: 'loan-eligibility-calculator'),
    //     level: RouteLevel(status: RouteStatus.public, floor: RouteFloor.second),
    //     widget: LoanPage()),
    // RouteInitial(
    //     type: RouteType(path: 'result'),
    //     level: RouteLevel(status: RouteStatus.public, floor: RouteFloor.third),
    //     widget: LoanPage()),
    RouteInitial(
        type: RouteType(path: 'guides'),
        level: RouteLevel.guest,
        widget: GuidePage()),
    RouteInitial(
        type: RouteType(path: 'news'),
        level: RouteLevel.guest,
        widget: NewsPage()),
    RouteInitial(
        type: RouteType(path: 'about'),
        level: RouteLevel.guest,
        widget: AboutWidget()),
    RouteInitial(
        type: RouteType(path: 'contact'),
        level: RouteLevel.guest,
        widget: ContactPage()),
    RouteInitial(
        type: RouteType(path: 'login'),
        level: RouteLevel.reglog,
        widget: SignInWidget()),
    RouteInitial(
        type: RouteType(path: 'register'),
        level: RouteLevel.reglog,
        widget: SignUpPage()),
  ];
}
