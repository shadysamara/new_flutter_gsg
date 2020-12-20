import 'package:auto_route/auto_route_annotations.dart';
import 'package:gsg_flutter/pages/page1.dart';
import 'package:gsg_flutter/pages/page2.dart';
import 'package:gsg_flutter/pages/page3.dart';
import 'package:gsg_flutter/pages/page4.dart';

@MaterialAutoRouter(
  generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: Page1, initial: true),
    MaterialRoute(page: Page2), MaterialRoute(page: Page3),
    MaterialRoute(page: Page4),
  ],
)
class $MyRouter {}
