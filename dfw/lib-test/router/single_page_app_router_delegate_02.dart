import 'package:common/extensions/color_extensions.dart';
import 'package:common/model/shape_border_type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../lib-test/entity/color_code.dart';
import '../../lib-test/widgets/shape_dialog.dart';
import '../../lib-test/widgets/unknown_screen.dart';

import 'home_screen_02.dart';
import 'single_page_app_configuration_02.dart';

class ShapePage extends Page {
  final String colorCode;
  final ShapeBorderType shapeBorderType;

  static const String routeName = "ShapePage";

  @override
  String get name => routeName;

  ShapePage({
    required this.shapeBorderType,
    required this.colorCode,
  }) : super(key: ValueKey("$colorCode$shapeBorderType"));

  @override
  Route createRoute(BuildContext context) {
    return CupertinoDialogRoute(
      settings: this,
      barrierDismissible: true,
      barrierColor: Colors.black87,
      builder: (BuildContext context) => ShapeDialog(
        colorCode: colorCode,
        shapeBorderType: shapeBorderType,
      ),
      context: context,
    );
  }
}

class SinglePageAppRouterDelegate
    extends RouterDelegate<SinglePageAppConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<SinglePageAppConfiguration> {
  final List<MaterialColor> colors;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();
  late Page _homePage;

  // App state fields
  final ValueNotifier<ColorCode?> _colorCodeNotifier = ValueNotifier(null);
  final ValueNotifier<ShapeBorderType?> _shapeBorderTypeNotifier =
      ValueNotifier(null);
  final ValueNotifier<bool?> _unknownStateNotifier = ValueNotifier(null);

  String get defaultColorCode => colors.first.toHex();

  SinglePageAppRouterDelegate({required this.colors}) {
    _homePage = MaterialPage(
      key: ValueKey<String>("HomePage"),
      child: HomeScreen(
        colors: colors,
        colorCodeNotifier: _colorCodeNotifier,
        shapeBorderTypeNotifier: _shapeBorderTypeNotifier,
      ),
    );
    Listenable.merge([
      _shapeBorderTypeNotifier,
      _unknownStateNotifier,
      _colorCodeNotifier,
    ])
      ..addListener(() {
        print("notifying the router widget");
        notifyListeners();
      });
  }

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  @override
  SinglePageAppConfiguration get currentConfiguration {
    if (_unknownStateNotifier.value == true) {
      return SinglePageAppConfiguration.unknown();
    } else if (_shapeBorderTypeNotifier.value != null) {
      return SinglePageAppConfiguration.shapeBorder(
        _colorCodeNotifier.value!.hexColorCode,
        _shapeBorderTypeNotifier.value,
      );
    } else {
      return SinglePageAppConfiguration.home(
        colorCode: _colorCodeNotifier.value?.hexColorCode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorCode = _colorCodeNotifier.value;
    final shapeBorderType = _shapeBorderTypeNotifier.value;
    return Navigator(
      key: navigatorKey,
      pages: _unknownStateNotifier.value == true
          ? [
              MaterialPage(
                key: ValueKey<String>("Unknown"),
                child: UnknownScreen(),
              )
            ]
          : [
              _homePage,
              if (colorCode != null && shapeBorderType != null)
                ShapePage(
                  colorCode: colorCode.hexColorCode,
                  shapeBorderType: shapeBorderType,
                ),
            ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;
        if (route.settings.name == ShapePage.routeName) {
          _shapeBorderTypeNotifier.value = null;
        }
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(SinglePageAppConfiguration configuration) async {
    if (configuration.unknown) {
      _unknownStateNotifier.value = true;
      _colorCodeNotifier.value = null;
      _shapeBorderTypeNotifier.value = null;
    } else if (configuration.isHomePage) {
      _unknownStateNotifier.value = false;
      _colorCodeNotifier.value = ColorCode(
        hexColorCode: configuration.colorCode ?? defaultColorCode,
        source: ColorCodeSelectionSource.fromBrowserAddressBar,
      );
      _shapeBorderTypeNotifier.value = null;
    } else if (configuration.isShapePage) {
      _unknownStateNotifier.value = false;
      _colorCodeNotifier.value = ColorCode(
        hexColorCode: configuration.colorCode!,
        source: ColorCodeSelectionSource.fromBrowserAddressBar,
      );
      _shapeBorderTypeNotifier.value = configuration.shapeBorderType;
    }
  }
}
