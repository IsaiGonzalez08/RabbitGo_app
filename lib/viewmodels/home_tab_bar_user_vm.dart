import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:rabbit_go/common/safe_change_notifier.dart';
import 'package:rabbit_go/models/bottom_bar_item.dart';
import 'package:rabbit_go/ui/screens/home_view.dart';
import 'package:rabbit_go/ui/screens/profile_view.dart';
import 'package:rabbit_go/ui/screens/search_view.dart';

class HomeTabBarUserVM extends SafeChangeNotifier {
  final BuildContext context;
  final Function(String) errorMessage;

  HomeTabBarUserVM({required this.context, required this.errorMessage});

  final PageController _pageController = PageController();
  List<BottomBarItem> _bottomBarItems = [];
  int _currentIndex = 0;

  PageController get pageController => _pageController;
  List<BottomBarItem> get bottomBarItems => _bottomBarItems;
  int get currentIndex => _currentIndex;

  init() {
    _loadBottomBarItems();
  }

  _loadBottomBarItems() {
    _bottomBarItems = [
      BottomBarItem("init", LucideIcons.house, const HomeView()),
      BottomBarItem("search", LucideIcons.search, const SearchView()),
      BottomBarItem("favorites", LucideIcons.heart, const ConfigurationView()),
      BottomBarItem("configuration", LucideIcons.cog, const ConfigurationView()),
    ];
    notifyListeners();
  }

  onBottomBarChanged(int value) {
    _pageController.jumpToPage(value);
    _currentIndex = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
