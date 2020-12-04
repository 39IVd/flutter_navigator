import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_navigator/locator.dart';
import 'package:flutter_navigator/routing/route_names.dart';
import 'package:flutter_navigator/routing/router.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/widgets/centered_view/centered_view.dart';
import 'package:flutter_navigator/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_navigator/widgets/navigation_drawer/navigation_drawer.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: Colors.white,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
