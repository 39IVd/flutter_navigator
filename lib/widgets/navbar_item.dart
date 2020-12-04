import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_navigator/locator.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/extensions/hover_extensions.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final IconData icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        locator<NavigationService>().navigateTo(navigationPath);
      },
      child: Provider.value(
        value: {title, navigationPath},
        child: Text(
          title,
          style: TextStyle(fontSize: 18),
        ).showCursorOnHover.moveUpOnHover,
      ),
    );
  }
}
