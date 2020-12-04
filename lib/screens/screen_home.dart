import 'package:flutter/material.dart';
import 'package:flutter_navigator/locator.dart';
import 'package:flutter_navigator/services/api.dart';
import 'package:flutter_navigator/models/guide.dart';
import 'package:flutter_navigator/widgets/guide_item.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/routing/routes.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToGuide(int index) {
    _navigationService
        .navigateTo(Routes.guideDetail, queryParams: {'id': index.toString()});
  }

  List guides = new List();
  @override
  void initState() {
    super.initState();
    (() async {
      List<Guide> guideList = await getEpisodes();
      setState(() {
        guides = guideList;
      });
    })();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        guides.isEmpty
            ? CircularProgressIndicator()
            : Wrap(
                spacing: 30,
                runSpacing: 30,
                children: <Widget>[
                  ...guides
                      .asMap()
                      .map((index, episode) => MapEntry(
                            index,
                            GestureDetector(
                              child: GuideItem(guide: episode),
                              onTap: () => navigateToGuide(index),
                            ),
                          ))
                      .values
                      .toList()
                ],
              ),
      ],
    ));
  }
}
