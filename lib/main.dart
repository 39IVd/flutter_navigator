import 'package:flutter/material.dart';
import 'services/navigation_service.dart';
import 'locator.dart';
import 'routing/routes.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/widgets/navigation_bar.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'Open Sans'),
      ),
      builder: (context, child) {
        return ResponsiveBuilder(
          builder: (context, sizingInformation) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: <Widget>[
                  NavigationBar(),
                  Expanded(
                    child: child,
                  )
                ],
              ),
            );
          },
        );
      },
      navigatorKey: locator<NavigationService>().navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: Routes.home,
    );
  }
}
