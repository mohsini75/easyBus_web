import 'package:easybus_web/routing/route_names.dart';
import 'package:easybus_web/screens/dashboard/dashboard_screen.dart';
import 'package:easybus_web/screens/driver_manage/assign_driver.dart';
import 'package:easybus_web/screens/notifications/all_complains.dart';
import 'package:easybus_web/screens/notifications/all_notification.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case DashboardRoute:
      return _getPageRoute(DashboardScreen());
    case DriversRoute:
      return _getPageRoute(AssignDriverScreen());
    case VehicleRoute:
      return _getPageRoute(AssignDriverScreen());
    case ComplaintRoute:
      return _getPageRoute(ComplainScreen());
    case NotificationRoute:
      return _getPageRoute(AllNotificationScreen());
    case ProfileRoute:
      return _getPageRoute(AssignDriverScreen());
    case MaintenanceRoute:
      return _getPageRoute(AssignDriverScreen());
    case RouteRoute:
      return _getPageRoute(AssignDriverScreen());
    case StudentRoute:
      return _getPageRoute(AssignDriverScreen());

    default:
      return _getPageRoute(DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
