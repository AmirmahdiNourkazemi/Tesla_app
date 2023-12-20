import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:tesla_app/colors.dart';

Widget infoButton({
  required BuildContext context,
  required VoidCallback onPressed,
  required double borerWidth,
  required double borderRaduis,
  required String info,
  required String subtitle,
}) {
  return NeumorphicButton(
    duration: const Duration(milliseconds: 300),
    onPressed: onPressed,
    curve: Curves.linear,
    minDistance: 0.0,
    padding: const EdgeInsets.all(8.0),
    style: NeumorphicStyle(
      intensity: 0.5,
      shadowDarkColorEmboss: AppColors.neumorphicShadowDarkColorEmboss,
      shadowLightColor: AppColors.neumorphicShadowLightColor,
      border: NeumorphicBorder(
        isEnabled: true,
        color: AppColors.infoBackgroundColor,
        width: borerWidth,
      ),
      shape: NeumorphicShape.convex,
      boxShape: NeumorphicBoxShape.beveled(
        BorderRadius.all(
          Radius.circular(borderRaduis),
        ),
      ),
      depth: 2,
      disableDepth: false,
      shadowDarkColor: AppColors.neumorphicShadowDarkColor,
      color: AppColors.infoBackgroundColor,
    ),
    child: Stack(
      children: [
        Image.asset('assets/images/mask.png'),
        Positioned(
            bottom: 20,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  info,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ],
            ))
      ],
    ),
  );
}
