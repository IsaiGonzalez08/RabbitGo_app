import 'package:flutter/material.dart';
import 'package:rabbit_go/common/extensions/string_extensions.dart';
import 'package:rabbit_go/common/rabbit_go_theme.dart';
import 'package:rabbit_go/common/utils/utilities.dart';
import 'package:rabbit_go/viewmodels/home_tab_bar_user_vm.dart';
import 'package:stacked/stacked.dart';

class HomeTabBarUser extends StatefulWidget {
  const HomeTabBarUser({super.key});

  @override
  State<StatefulWidget> createState() => _StateHomeTabBarUser();
}

class _StateHomeTabBarUser extends State<HomeTabBarUser> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeTabBarUserVM>.reactive(
      viewModelBuilder: () =>
          HomeTabBarUserVM(context: context, errorMessage: _errorMessage),
      onViewModelReady: (viewModel) => viewModel.init(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: PageView(
            controller: viewModel.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: viewModel.bottomBarItems
                .map((bottomBarItem) => bottomBarItem.page)
                .toList(),
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        color: RabbitGoColors.secondaryColor[50] ??
                            Colors.transparent,
                        width: 1)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff0e1d3a).withOpacity(0.05),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: const Offset(0, -0.77),
                  )
                ]),
            child: BottomNavigationBar(
              items: viewModel.bottomBarItems
                  .map(
                    (page) => BottomNavigationBarItem(
                      icon: Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Icon(page.iconData),
                      ),
                      label: page.title.translate(context),
                    ),
                  )
                  .toList(),
              currentIndex: viewModel.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (value) => viewModel.onBottomBarChanged(value),
              backgroundColor: Colors.white,
              selectedItemColor: RabbitGoColors.blueColor[300],
              unselectedItemColor: RabbitGoColors.blueColor[100],
              elevation: 8,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              iconSize: 24,
              selectedLabelStyle:
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: RabbitGoColors.blueColor[300],
                      ),
              unselectedLabelStyle:
                  Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: RabbitGoColors.blueColor[100],
                      ),
            ),
          ),
        );
      },
    );
  }

  _errorMessage(String message) {
    showErrorToast(context, message);
  }
}
