
import 'package:flutter/material.dart';
class BatteryStatus extends StatelessWidget {
  final BoxConstraints constraints;
  const BatteryStatus({super.key,required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("220 mi",style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.white),),
        Text("62 %",style: TextStyle(color: Colors.white,fontSize: 24),),
        Spacer(),
        Text("Charging",style: TextStyle(color: Colors.white,fontSize: 20),),
        Text("18 min remaining",style: TextStyle(color: Colors.white,fontSize: 20),),
        SizedBox(height: constraints.maxHeight * 0.14),
        DefaultTextStyle(
          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("22 mi/hr"),
                Text("220 v"),
              ],
            ),
          ),
        ),

      ],
    );
  }
}
