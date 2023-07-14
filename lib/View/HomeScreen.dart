import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tesla/Components/BatteryStatus.dart';
import 'package:tesla/Components/BottomNavigaton.dart';
import 'package:tesla/Components/Button.dart';
import 'package:tesla/Components/LockWidget.dart';
import 'package:tesla/Components/Types.dart';
import 'package:tesla/Components/tempDetails.dart';
import 'package:tesla/Get/LockGet.dart';
import 'package:tesla/Utils/AssetsManaget.dart';

import '../Components/TyrePsi.dart';
import '../Components/tyre_psi_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  LockGet controller = LockGet();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigation(controller: controller),
          body: AnimatedBuilder(
              animation: controller,
              builder: (context, co) {
                return LayoutBuilder(builder: (context, constrains) {
                  return Obx(() => Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: constrains.maxHeight,
                        width: constrains.maxWidth,
                      ),
                      AnimatedOpacity(
                        opacity: controller.selectedTab.value==3? 1 :0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut,
                        child: GridView.builder(
                          itemCount: 4,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                            childAspectRatio: constrains.maxWidth/constrains.maxHeight,
                          ),
                          itemBuilder: (context, index) {
                            return TyrePsiCard(
                                isBottomTwoTyre: true, tyrePsi: demoPsiList[index]);
                          },),
                      ),
                      Obx(() => AnimatedPositioned(
                        duration: Duration(
                            milliseconds: controller.selectedTab.value == 2
                                ? 500
                                : 200),
                        left: controller.selectedTab.value == 2
                            ? constrains.maxWidth / 2
                            : 0,
                        height: constrains.maxHeight,
                        width: constrains.maxWidth,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: constrains.maxHeight * .1),
                          child: SvgPicture.asset(
                            AssetsManager.Car,
                            height: double.infinity,
                          ),
                        ),
                      )),
                      Obx(() => AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          right: controller.selectedTab.value == 0
                              ? constrains.maxWidth * .05
                              : constrains.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity:
                            controller.selectedTab.value == 0 ? 1.0 : 0.0,
                            child: LockWidget(
                                ontap: controller.setLockedRight,
                                isLocked: controller.isLockedRight.value),
                          ))),
                      Obx(() => AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          left: controller.selectedTab.value == 0
                              ? constrains.maxWidth * .05
                              : constrains.maxWidth / 2,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity:
                            controller.selectedTab.value == 0 ? 1.0 : 0.0,
                            child: LockWidget(
                                ontap: controller.setLockedLeft,
                                isLocked: controller.isLockedLeft.value),
                          ))),
                      Obx(() => AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          top: controller.selectedTab.value == 0
                              ? constrains.maxHeight * .13
                              : constrains.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity:
                            controller.selectedTab.value == 0 ? 1.0 : 0.0,
                            child: LockWidget(
                                ontap: controller.setLockedUp,
                                isLocked: controller.isLockedUp.value),
                          ))),
                      Obx(() => AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          bottom: controller.selectedTab.value == 0
                              ? constrains.maxHeight * .18
                              : constrains.maxHeight / 2,
                          child: AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity:
                            controller.selectedTab.value == 0 ? 1.0 : 0.0,
                            child: LockWidget(
                                ontap: controller.setLockedDown,
                                isLocked: controller.isLockedDown.value),
                          ))),
                      Obx(() => AnimatedOpacity(
                        opacity: controller.selectedTab == 1 ? 1 : 0,
                        duration: Duration(milliseconds: 300),
                        child: SvgPicture.asset(
                          AssetsManager.Battry,
                          width: constrains.maxHeight * .24,
                        ),
                      )),
                      Obx(() => AnimatedPositioned(
                        top: controller.selectedTab.value == 1
                            ? 0
                            : constrains.maxHeight * 0.14,
                        height: constrains.maxHeight,
                        width: constrains.maxWidth,
                        duration: Duration(milliseconds: 300),
                        child: AnimatedOpacity(
                          opacity:
                          controller.selectedTab.value == 1 ? 1 : 0,
                          duration: Duration(milliseconds: 300),
                          child: BatteryStatus(constraints: constrains),
                        ),
                      )),
                      Obx(() => AnimatedPositioned(
                          duration: Duration(milliseconds: 500),
                          top: controller.selectedTab==2 ? 0: 100,
                          height: constrains.maxHeight,
                          width: constrains.maxWidth,
                          child: AnimatedOpacity(
                              duration: Duration(milliseconds: 500),
                              opacity: controller.selectedTab==2? 1: 0,
                              child: TempDetails(controller: controller)))),
                      Obx(() => Positioned(
                        right:controller.selectedTab==2? 0:-200,
                        child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: controller.coolTemp.value?
                          Image.asset("Assets/images/Cool_glow_2.png",
                            width: 200,key: UniqueKey(),
                          ) : Image.asset("Assets/images/Hot_glow_4.png",
                            width: 200,key: UniqueKey(),
                          ),
                        ),
                      )
                      ),
                      if(controller.selectedTab.value!=2) ...tyres(constrains, controller),

                    ],
                  ));
                });
              })),
    );
  }
}
