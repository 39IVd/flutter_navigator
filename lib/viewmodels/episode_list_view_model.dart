import 'package:flutter/cupertino.dart';
import 'package:flutter_navigator/routing/route_names.dart';
import 'package:flutter_navigator/services/navigation_service.dart';
import 'package:flutter_navigator/locator.dart';

class EpisodeListViewModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToEpisode(int index) {
    _navigationService
        .navigateTo(EpisodeDetailsRoute, queryParams: {'id': index.toString()});
  }
}
