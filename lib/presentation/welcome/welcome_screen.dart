import 'package:animate_do/animate_do.dart';
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
  bool isLocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NeumorphicAppBar(
        color: Color(0xFF2F353A),
        actions: [
          AnimatedContainer(
            curve: Curves.linear,
            duration: const Duration(seconds: 2),
            transform: Matrix4.translationValues(
                0, isLocked ? -MediaQuery.of(context).size.height : 0, 0),
            child: Padding(
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
            if (!isLocked) ...{
              AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(seconds: 2),
                  transform: Matrix4.translationValues(
                      0, isLocked ? -MediaQuery.of(context).size.height : 0, 0),
                  child: topBody(context))
            } else ...{
              AnimatedContainer(
                duration: Duration(seconds: 2),
                transform: Matrix4.translationValues(
                    0, isLocked ? 0 : MediaQuery.of(context).size.height, 0),
                child: redContainer(),
              ),
            },
            const SizedBox(
              height: 40,
            ),
            AnimatedContainer(
                curve: Curves.linear,
                duration: const Duration(seconds: 2),
                transform: Matrix4.translationValues(
                    isLocked ? MediaQuery.of(context).size.height : 0, 0, 0),
                child: centerBody(context)),
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              curve: Curves.linear,
              duration: const Duration(seconds: 2),
              transform: Matrix4.translationValues(
                  0, isLocked ? MediaQuery.of(context).size.height : 0, 0),
              child: endBody(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget redContainer() {
    return FadeInLeft(
      delay: Duration(seconds: 1),
      child: Container(
        height: 200, // Adjust the height as needed
        color: Colors.red, // Color of the red container
        alignment: Alignment.center,
        child: Text(
          'Red Container', // Text or content of the red container
          style: TextStyle(color: Colors.white),
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
              setState(() {
                isLocked = !isLocked; // Toggle the lock state
              });
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
        child: FadeInRightBig(
          child: Image.asset(
            'assets/images/cybertruck-mod-black2 1.png',
            //width: MediaQuery.of(context).size.width * 0.9,
            height: 250,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
