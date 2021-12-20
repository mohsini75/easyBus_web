import 'package:flutter/material.dart';

import '../constants.dart';

class CloudStorageInfo {
  final String? svgSrc, title, totalCapacity;
  final int? PresentActor, percentage;
  final Color? color;

  CloudStorageInfo({
    this.svgSrc,
    this.title,
    this.totalCapacity,
    this.PresentActor,
    this.percentage,
    this.color,
  });
}

List demoMyFiles = [
  CloudStorageInfo(
    title: "Reg. Students",
    PresentActor: 1328,
    svgSrc: "assets/images/student.svg",
    totalCapacity: "1.9GB",
    color: primaryColor,
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Employees",
    PresentActor: 1328,
    svgSrc: "assets/images/driver.svg",
    totalCapacity: "2.9GB",
    color: Color(0xFFFFA113),
    percentage: 35,
  ),
  CloudStorageInfo(
    title: "Total Vehicles",
    PresentActor: 1328,
    svgSrc: "assets/images/bus.svg",
    totalCapacity: "1GB",
    color: Color(0xFFA4CDFF),
    percentage: 10,
  ),
  CloudStorageInfo(
    title: "Total Complaints",
    PresentActor: 5328,
    svgSrc: "assets/images/complaint.svg",
    totalCapacity: "7.3GB",
    color: Color(0xFF007EE5),
    percentage: 78,
  ),
];
