import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla_app/colors.dart';
import 'package:tesla_app/presentation/welcome/widget/NeumorphicButton.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        color: Color(0xFF2F353A),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: SizedBox(
              // width: 90,
              child: buildNeumorphicButton(
                path: 'assets/images/setting.png',
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
        ],
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
        child: ListView(
          children: [
            topBody(context),
            const SizedBox(
              height: 40,
            ),
            centerBody(context),
            const SizedBox(
              height: 20,
            ),
            endBody(context)
          ],
        ),
      ),
    );
  }

  Column endBody(BuildContext context) {
    return Column(
      children: [
        Text(
          'A/C is turned on',
          style: Theme.of(context).textTheme.displaySmall,
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: 90,
          child: buildNeumorphicButton(
            path: 'assets/images/lock.png',
            onPressed: () {
              //  print('object');
            },
            borerWidth: 2,
            scale: 0.9,
            color: AppColors.neumorphicBackgroundColorbtnBlue,
            borderColor: AppColors.neumorphicBorderColorBtnBlue,
          ),
        )
      ],
    );
  }

  Column topBody(BuildContext context) {
    return Column(
      children: [
        Text(
          'Tesla',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          'Cybertruck',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

Stack centerBody(BuildContext context) {
  return Stack(
    alignment: Alignment.centerRight,
    children: [
      SizedBox(
        height: 450,
        width: MediaQuery.of(context).size.width,
      ),
      Positioned(
        top: 0,
        right: 80,
        child: Text(
          '297',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      Positioned(
        right: 40,
        top: 30,
        child: Text(
          'km',
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      Positioned(
        child: Image.asset(
          'assets/images/cybertruck-mod-black2 1.png',
          //width: MediaQuery.of(context).size.width * 0.9,
          height: 250,
          fit: BoxFit.cover,
        ),
      ),
    ],
  );
}
