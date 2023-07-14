import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tesla/Utils/AssetsManaget.dart';

import '../Get/LockGet.dart';

class BottomNavigation extends StatelessWidget {
  LockGet controller;
  BottomNavigation({super.key,required this.controller});
  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
        onTap:  (value) {
          controller.setTab(value);
        },
        currentIndex: controller.selectedTab.value,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: List.generate(list.length, (index) {
          return BottomNavigationBarItem(
              icon: SvgPicture.asset(list[index],
              color: index==controller.selectedTab.value ?const Color(0xFF53F9FF) : Colors.white54,
              ),
              label: ""
          );
        })
    ));
  }

  List<String> list =[
    AssetsManager.BarLock,
    AssetsManager.Charge,
    AssetsManager.Temp,
    AssetsManager.Tyre,

  ];
}
