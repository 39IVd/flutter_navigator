import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_navigator/screens/screen_home.dart';
import 'package:flutter_navigator/screens/screen_about.dart';
import 'package:flutter_navigator/screens/screen_guide_detail.dart';
import 'package:flutter_navigator/extensions/string_extensions.dart';

class Routes {
  static const String home = '/';
  static const String about = 'about';
  static const String episodes = 'episodes';
  static const String guideDetail = 'guideDetail';
}

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData; // Get the routing Data
  switch (routingData.route) {
    // Switch on the path from the data
    case Routes.home:
      return _getPageRoute(HomeScreen(), settings);
    case Routes.about:
      return _getPageRoute(AboutScreen(), settings);
    case Routes.episodes:
      return _getPageRoute(HomeScreen(), settings);
    case Routes.guideDetail:
      var id = int.tryParse(routingData['id']); // Get the id from the data.
      return _getPageRoute(GuideDetailScreen(id: id), settings);
    default:
      return _getPageRoute(HomeScreen(), settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
