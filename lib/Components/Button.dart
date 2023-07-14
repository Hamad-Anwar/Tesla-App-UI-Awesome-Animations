import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tesla/Get/LockGet.dart';

class TempButton extends StatelessWidget {
  final VoidCallback onTap;
  final LockGet controller;
  final image;
  final buttonText;
  final bool isActive;
  Color color ;

  TempButton(
      {super.key,
      required this.isActive,
      required this.controller,
      required this.onTap,
      required this.image,
      required this.buttonText,
      this.color=const Color(0xFF53F9FF)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          AnimatedContainer(
            curve: Curves.easeInOutBack,
            duration: Duration(milliseconds: 200),
            height: isActive ? 70 : 50,
            width: isActive ? 70 : 50,
            child: SvgPicture.asset(
              image,
              color: isActive ? color : Colors.white38,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          AnimatedDefaultTextStyle(
              curve: Curves.easeInOutBack,
              duration: Duration(milliseconds: 200),
              style: TextStyle(
                  color: isActive ?color: Colors.white38,
                  fontWeight: FontWeight.bold),
              child: Text(
                buttonText,
              ))
        ],
      ),
    );
  }
}
