import 'package:easybus_web/controllers/MenuController.dart';
import 'package:easybus_web/routing/route_names.dart';
import 'package:easybus_web/routing/router.dart';
import 'package:easybus_web/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../../responsive.dart';
import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (Responsive.isDesktop(context))
              Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: Navigator(
                key: locator<NavigationService>().navigatorKey,
                onGenerateRoute: generateRoute,
                initialRoute: DashboardRoute,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
