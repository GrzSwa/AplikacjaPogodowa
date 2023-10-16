import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class WorldDirection extends StatelessWidget {
  final int? windDirection;
  const WorldDirection({ Key? key, this.windDirection }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return SvgPicture.asset(
      "assets/compass.svg",
      color: Colors.white,
      width: double.infinity,
    );
  }
}