import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tesla_app/colors.dart';

Widget buildNeumorphicButton({
  required String path,
  required VoidCallback onPressed,
  required Color color,
  required Color borderColor,
  required double borerWidth,
  required double scale,
}) {
  return NeumorphicButton(
    duration: const Duration(milliseconds: 300),
    onPressed: onPressed,
    curve: Curves.linear,
    minDistance: 0,
    padding: const EdgeInsets.all(8.0),
    style: NeumorphicStyle(
      intensity: 0.8,
      shadowDarkColorEmboss: AppColors.neumorphicShadowDarkColorEmboss,
      shadowLightColor: AppColors.neumorphicShadowLightColor,
      surfaceIntensity: 0.1,
      border: NeumorphicBorder(
        isEnabled: true,
        color: borderColor,
        width: borerWidth,
      ),
      shape: NeumorphicShape.convex,
      boxShape: const NeumorphicBoxShape.circle(),
      depth: 15,
      disableDepth: false,
      shadowDarkColor: AppColors.neumorphicShadowDarkColor,
      color: color,
    ),
    child: Transform.scale(
      scale: scale,
      child: Image.asset(
        path,
      ),
    ),
  );
}
