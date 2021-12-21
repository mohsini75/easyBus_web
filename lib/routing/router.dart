import 'package:easybus_web/routing/route_names.dart';
import 'package:easybus_web/screens/dashboard/dashboard_screen.dart';
import 'package:easybus_web/screens/driver_manage/assign_driver.dart';
import 'package:easybus_web/screens/main/maintenance_report.dart';
import 'package:easybus_web/screens/notifications/all_complains.dart';
import 'package:easybus_web/screens/notifications/all_notification.dart';
import 'package:easybus_web/screens/routes/routes_screen.dart';
import 'package:easybus_web/screens/student_screen.dart';
import 'package:easybus_web/screens/vehicle-manage/vehicle_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  print('generateRoute: ${settings.name}');
  switch (settings.name) {
    case DashboardRoute:
      return _getPageRoute(DashboardScreen());
    case DriversRoute:
      return _getPageRoute(AssignDriverScreen());
    case VehicleRoute:
      return _getPageRoute(VehicleScreen());
    case ComplaintRoute:
      return _getPageRoute(ComplainScreen());
    case NotificationRoute:
      return _getPageRoute(AllNotificationScreen());
    case ProfileRoute:
      return _getPageRoute(AssignDriverScreen());
    case MaintenanceRoute:
      return _getPageRoute(MaintenanceReport());
    case RouteRoute:
      return _getPageRoute(RoutesScreen());
    case StudentRoute:
      return _getPageRoute(StudentScreen());

    default:
      return _getPageRoute(DashboardScreen());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(
    builder: (context) => child,
  );
}
