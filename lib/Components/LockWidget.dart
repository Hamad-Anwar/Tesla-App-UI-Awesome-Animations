import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Utils/AssetsManaget.dart';

class LockWidget extends StatefulWidget {
  VoidCallback ontap;
  bool isLocked;
  LockWidget({super.key,required this.ontap,required this.isLocked});

  @override
  State<LockWidget> createState() => _LockWidgetState();
}

class _LockWidgetState extends State<LockWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: AnimatedSwitcher(
        switchInCurve: Curves.easeInOutBack,
        transitionBuilder: (child, animation) {
          return ScaleTransition(scale: animation,child: child,);
        },
        duration: const Duration(milliseconds: 300),
        child: !widget.isLocked ?
        SvgPicture.asset(AssetsManager.Lock,key: const ValueKey("value"),) : SvgPicture.asset(AssetsManager.UnLock,key: const ValueKey("1"),)
        ,
      ),
    );
  }
}
