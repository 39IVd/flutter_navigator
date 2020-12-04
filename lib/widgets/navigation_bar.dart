import 'package:flutter/material.dart';
import 'package:flutter_navigator/routing/routes.dart';
import 'package:flutter_navigator/widgets/navbar_item.dart';
import 'package:flutter_navigator/locator.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/extensions/hover_extensions.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
                // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
                locator<NavigationService>().navigateTo(Routes.home);
              },
              child: SizedBox(
                height: 80,
                width: 150,
                child: Image.asset('assets/logo.png'),
              ).showCursorOnHover.moveUpOnHover),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              NavBarItem('Episodes', Routes.episodes),
              SizedBox(
                width: 60,
              ),
              NavBarItem('About', Routes.about),
            ],
          )
        ],
      ),
    );
  }
}
