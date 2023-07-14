import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tesla/Get/LockGet.dart';

import '../Utils/AssetsManaget.dart';
import 'Button.dart';

class TempDetails extends StatelessWidget {
  final LockGet controller;
  const TempDetails({super.key,required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
      vertical: 20, horizontal: 40),
        child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 120,
        child: Obx(() => Row(
          children: [
            TempButton(
              controller: controller,
              buttonText: "COOL",
              image: AssetsManager.coolShape,
              isActive: controller.coolTemp.value,
              onTap: () => controller.setCoolTemp(),
            ),
            SizedBox(
              width: 20,
            ),
            TempButton(
              controller: controller,
              buttonText: "HEAT",
              image: AssetsManager.heatShape,
              isActive: controller.heatTemp.value,
              onTap: () => controller.setHeatTemp(),
              color: Colors.red,
            ),
          ],
        )),
      ),
      Spacer(),
      Column(
        children: [
          IconButton(
            onPressed: () {
              controller.incTemp();
            },
            icon: Icon(
              Icons.arrow_drop_up,
              color: Colors.white,
              size: 48,
            ),
          ),
          Obx(() => Text(
            "${controller.temperature.value}\u2103",
            style: TextStyle(
                color: Colors.white,
                fontSize: 86,
                fontWeight: FontWeight.bold),
          ),),
          IconButton(
            onPressed: () {
              controller.decTemp();
            },
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
              size: 48,
            ),

          ),
        ],
      ),
      Spacer(),
      Text("Current Temprature",),

      SizedBox(height: 5,),
      Row(
        children: [
          Column(
            children: [
              Text("INSIDE",),
              Text("20" + "\u2103",style: Theme.of(context).textTheme.headline5,)
            ],
          ),
          SizedBox(width: 10,),
          Column(
            children: [
              Text("OUTSIDE",style: TextStyle(color: Colors.white38)),
              Text("35" + "\u2103",style: Theme.of(context).textTheme.headline5!.
              copyWith(color: Colors.white38)
                ,)
            ],
          )
        ],
      )
    ],
        ),
      );
  }
}
