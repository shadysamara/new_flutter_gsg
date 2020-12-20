// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../pages/page1.dart';
import '../pages/page2.dart';
import '../pages/page3.dart';
import '../pages/page4.dart';

class Routes {
  static const String page1 = '/';
  static const String page2 = '/Page2';
  static const String page3 = '/Page3';
  static const String page4 = '/Page4';
  static const all = <String>{
    page1,
    page2,
    page3,
    page4,
  };
}

class MyRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.page1, page: Page1),
    RouteDef(Routes.page2, page: Page2),
    RouteDef(Routes.page3, page: Page3),
    RouteDef(Routes.page4, page: Page4),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    Page1: (data) {
      final args = data.getArgs<Page1Arguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => Page1(args.title),
        settings: data,
      );
    },
    Page2: (data) {
      final args = data.getArgs<Page2Arguments>(nullOk: false);
      return MaterialPageRoute<dynamic>(
        builder: (context) => Page2(
          args.title,
          args.name,
        ),
        settings: data,
      );
    },
    Page3: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Page3(),
        settings: data,
      );
    },
    Page4: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Page4(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension MyRouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushPage1({
    @required String title,
  }) =>
      push<dynamic>(
        Routes.page1,
        arguments: Page1Arguments(title: title),
      );

  Future<dynamic> pushPage2({
    @required String title,
    @required String name,
  }) =>
      push<dynamic>(
        Routes.page2,
        arguments: Page2Arguments(title: title, name: name),
      );

  Future<dynamic> pushPage3() => push<dynamic>(Routes.page3);

  Future<dynamic> pushPage4() => push<dynamic>(Routes.page4);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// Page1 arguments holder class
class Page1Arguments {
  final String title;
  Page1Arguments({@required this.title});
}

/// Page2 arguments holder class
class Page2Arguments {
  final String title;
  final String name;
  Page2Arguments({@required this.title, @required this.name});
}
