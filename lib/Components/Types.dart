import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../Get/LockGet.dart';

List<Widget> tyres(BoxConstraints constrains,LockGet controller){
  return [
    Positioned(
        left: constrains.maxWidth*0.2,
        top: constrains.maxHeight*0.22,
        child: SvgPicture.asset("Assets/icons/FL_Tyre.svg")),

    Positioned(
        right: constrains.maxWidth*0.2,
        top: constrains.maxHeight*0.22,
        child: SvgPicture.asset("Assets/icons/FL_Tyre.svg")),

    Positioned(
        left: constrains.maxWidth*0.2,
        top: constrains.maxHeight*0.6,
        child: SvgPicture.asset("Assets/icons/FL_Tyre.svg")),

    Positioned(
        right: constrains.maxWidth*0.2,
        top: constrains.maxHeight*0.6,
        child: SvgPicture.asset("Assets/icons/FL_Tyre.svg")),
  ];
}