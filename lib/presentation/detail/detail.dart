import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';

import '../../colors.dart';
import '../welcome/widget/NeumorphicButton.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        color: AppColors.appBarBackgroundColor,
        title: FadeInDown(child: titleAppBar(context)),
        actions: [personAppBar(context)],
        leading: menueAppBar(context),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2F353A),
              Color(0xff0D0B0D),
            ],
          ),
        ),
        child: FadeInUp(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF2F353A),
                  Color(0xff0D0B0D),
                ],
              ),
              border: Border.all(
                width: 1,
                color: AppColors.neumorphicShadowDarkColorEmboss,
              ),
            ),
            child: ListView(
              children: [
                indicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'A/C is ON',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            'Tap to turn off or swipe up\for a fast setup',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 75,
                      child: buildNeumorphicButton(
                        path: 'assets/images/power.png',
                        onPressed: () {},
                        borerWidth: 2,
                        scale: 0.3,
                        color: AppColors.neumorphicBackgroundColorbtnBlue,
                        borderColor: AppColors.neumorphicBorderColorBtnBlue,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding indicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 190, vertical: 10),
      child: Container(
        width: 2,
        height: 4,
        decoration: ShapeDecoration(
          color: AppColors.neumorphicBorderColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }

  Widget personAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        // width: 90,
        child: FadeInDown(
          child: buildNeumorphicButton(
            path: 'assets/images/person.png',
            onPressed: () {
              //  print('object');
            },
            borerWidth: 0.6,
            scale: 0.5,
            color: AppColors.neumorphicBackgroundColor,
            borderColor: AppColors.neumorphicBorderColor,
          ),
        ),
      ),
    );
  }

  Column titleAppBar(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tesla',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          'Cybertruck',
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }

  Widget menueAppBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: SizedBox(
        // width: 90,
        child: FadeInDown(
          child: buildNeumorphicButton(
            path: 'assets/images/menu.png',
            onPressed: () {
              Navigator.of(context).pop();
            },
            borerWidth: 0.6,
            scale: 0.5,
            color: AppColors.neumorphicBackgroundColor,
            borderColor: AppColors.neumorphicBorderColor,
          ),
        ),
      ),
    );
  }
}
