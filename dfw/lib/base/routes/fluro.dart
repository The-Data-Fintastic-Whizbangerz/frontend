import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../base/utils/authentications/auth_bloc.dart';
import '../app/landing_page.dart';
import '../app/splashscreen.dart';

class Fluro {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashHandler = Handler(
    handlerFunc: (context, params) => SplashScreen(),
  );

  // handlerFunc: (context, params) => SplashScreen());

  static final Handler _mainPageHandler = Handler(
    handlerFunc: (context, params) => BlocProvider(
      create: (context) => AuthBloc(),
      child: LandingPage(
        page: params['page']!.first,
      ),
    ),
  );

  // static final Handler _mainFilterHandler = Handler(
  //   handlerFunc: (context, params) => BlocProvider(
  //     create: (context) => AuthBloc(),
  //     child: LandingPage(
  //       page: params['page']!.first,
  //       type: params['type']!.first,
  //     ),
  //   ),
  // );

  static final Handler _extraPageHandler = Handler(
    handlerFunc: (context, params) => BlocProvider(
      create: (context) => AuthBloc(),
      child: LandingPage(
        page: params['page']!.first,
        extra: params['extra']!.first,
      ),
    ),
  );

  static void setupRouter() {
    // router.define(
    //   '/',
    //   handler: _splashHandler,
    //   // transitionType: TransitionType.fadeIn,
    // );

    // router.define(
    //   '/404',
    //   handler: _splashHandler,
    //   transitionType: TransitionType.fadeIn,
    // );

    router.define(
      '/signout',
      handler: _splashHandler,
      transitionType: TransitionType.fadeIn,
    );

    router.define(
      '/:page',
      handler: _mainPageHandler,
      transitionType: TransitionType.fadeIn,
    );

    // router.define(
    //   '/:page?filter=:type',
    //   handler: _mainFilterHandler,
    //   transitionType: TransitionType.fadeIn,
    // );

    router.define(
      '/:page/:extra',
      handler: _extraPageHandler,
      transitionType: TransitionType.fadeIn,
    );
  }
}
