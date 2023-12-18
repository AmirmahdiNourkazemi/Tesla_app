import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tesla_app/colors.dart';

Widget buildNeumorphicButton({
  required String path,
  required VoidCallback onPressed,
}) {
  return NeumorphicButton(
    duration: const Duration(milliseconds: 300),
    onPressed: onPressed,
    curve: Curves.linear,
    minDistance: 0,
    padding: const EdgeInsets.all(8.0),
    style: const NeumorphicStyle(
      intensity: 0.8,
      shadowDarkColorEmboss: AppColors.neumorphicShadowDarkColorEmboss,
      shadowLightColor: AppColors.neumorphicShadowLightColor,
      surfaceIntensity: 0.1,
      border: NeumorphicBorder(
        isEnabled: true,
        color: AppColors.neumorphicBorderColor,
        width: 0.6,
      ),
      shape: NeumorphicShape.convex,
      boxShape: NeumorphicBoxShape.circle(),
      depth: 20,
      disableDepth: false,
      shadowDarkColor: AppColors.neumorphicShadowDarkColor,
      color: AppColors.neumorphicBackgroundColor,
    ),
    child: Transform.scale(
      scale: 0.5,
      child: Image.asset(
        path,
      ),
    ),
  );
}
