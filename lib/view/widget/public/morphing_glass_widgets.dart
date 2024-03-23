import 'dart:ui';
import 'package:connectify/constant/simple_constants.dart';
import 'package:connectify/library.dart';
import 'package:flutter/material.dart';

Container morphingGlassContainer({
  required double roundedValue,
  required double opacity,
  required Color borderColor,
  required Widget child,
  required List<Color> gradientColors,
}) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(roundedValue),
      border: Border.all(color: borderColor),
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(roundedValue),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(roundedValue),
            border: Border.all(color: borderColor),
          ),
          child: child,
        ),
      ),
    ),
  );
}

Container morphingGlassContainerHW({
  required double roundedValue,
  required double opacity,
  required Color borderColor,
  required Widget child,
  required List<Color> gradientColors,
  required double height,
  required double width,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(roundedValue),
      border: Border.all(color: borderColor),
      gradient: LinearGradient(
        colors: gradientColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(roundedValue),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(roundedValue),
            border: Border.all(color: borderColor),
          ),
          child: child,
        ),
      ),
    ),
  );
}

Widget morphingGlassButton({
  required double roundedValue,
  required double opacity,
  required Color borderColor,
  required List<Color> gradientColors,
  required VoidCallback onPressed,
  required Widget child,
}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(roundedValue),
      onTap: onPressed,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(roundedValue),
          border: Border.all(color: borderColor),
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: child,
        ),
      ),
    ),
  );
}

Widget morphingGlasslistTile({
  required double roundedValue,
  required double opacity,
  required Color borderColor,
  required Widget text,
  required Widget leading,
  required Widget subtitle,
  required List<Color> gradientColors,
  //required double height,
  //required double width,
}) {
  return morphingGlassContainer(
      //height: height,
      //width: width,
      roundedValue: roundedValue,
      opacity: opacity,
      borderColor: borderColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: SimpleConstants.horizontalSpace,
            vertical: SimpleConstants.vertiacalSpace),
        child: Row(
          children: [
            leading,
            const CustomGap(),
            Column(
              children: [
                text,
                const CustomGap(),
                subtitle,
              ],
            )
          ],
        ),
      ),
      gradientColors: gradientColors);
}
