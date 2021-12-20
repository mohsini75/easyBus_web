import 'package:easybus_web/routing/route_names.dart';
import 'package:easybus_web/services/NavigationService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../locator.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/ParentDashboardbus.png"),
          ),
          DrawerListTile(
            title: "Dashboard",
            svgSrc: "assets/icons/menu_dashbord.svg",
            press: () {
              locator<NavigationService>().navigateTo(DashboardRoute);
            },
          ),
          DrawerListTile(
            title: "Drivers",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              locator<NavigationService>().navigateTo(DriversRoute);
            },
          ),
          DrawerListTile(
            title: "Vehicle",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              locator<NavigationService>().navigateTo(DriversRoute);
            },
          ),
          DrawerListTile(
            title: "Complaints",
            svgSrc: "assets/icons/menu_task.svg",
            press: () {
              locator<NavigationService>().navigateTo(DriversRoute);
            },
          ),
          DrawerListTile(
            title: "Notification",
            svgSrc: "assets/icons/menu_notification.svg",
            press: () {
              locator<NavigationService>().navigateTo(DriversRoute);
            },
          ),
          DrawerListTile(
            title: "Profile",
            svgSrc: "assets/icons/menu_profile.svg",
            press: () {
              locator<NavigationService>().navigateTo(DriversRoute);
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    //required this.navigationPath,
    required this.svgSrc,
    required this.press,
  }) : super(key: key);

  final String title, svgSrc;
  //final String navigationPath;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.white54),
      ),
    );
  }
}
