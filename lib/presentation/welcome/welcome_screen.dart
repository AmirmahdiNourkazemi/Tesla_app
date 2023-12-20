import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tesla_app/colors.dart';
import 'package:tesla_app/presentation/welcome/widget/NeumorphicButton.dart';

import 'widget/InfoBtn.dart';

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
        color: AppColors.appBarBackgroundColor,
        title: isLocked ? FadeInDown(child: titleAppBar(context)) : null,
        actions: [
          if (!isLocked) ...{
            settingAppBar(context),
          } else ...{
            personAppBar(context)
          }
        ],
        leading: isLocked ? menueAppBar(context) : null,
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
                  0,
                  isLocked ? -MediaQuery.of(context).size.height : 0,
                  0,
                ),
                child: topBody(context),
              )
            } else ...{
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                transform: Matrix4.translationValues(
                    0, isLocked ? 0 : MediaQuery.of(context).size.height, 0),
                child: carFront(),
              ),
            },
            const SizedBox(
              height: 20,
            ),
            if (!isLocked) ...{
              AnimatedContainer(
                  curve: Curves.linear,
                  duration: const Duration(seconds: 3),
                  transform: Matrix4.translationValues(
                      isLocked ? MediaQuery.of(context).size.height : 0, 0, 0),
                  child: centerBody(context))
            } else ...{
              statusCenter(context)
            },
            const SizedBox(
              height: 20,
            ),
            AnimatedContainer(
              curve: Curves.linear,
              duration: const Duration(seconds: 3),
              transform: Matrix4.translationValues(
                  0, isLocked ? MediaQuery.of(context).size.height : 0, 0),
              child: endBody(context),
            ),
          ],
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

  AnimatedContainer settingAppBar(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(seconds: 3),
      transform: Matrix4.translationValues(
          0, isLocked ? -MediaQuery.of(context).size.height : 0, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SizedBox(
          // width: 90,
          child: FadeInDown(
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
    );
  }

  AnimatedContainer menueAppBar(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(seconds: 3),
      transform: Matrix4.translationValues(
          0, isLocked ? 0 : -MediaQuery.of(context).size.height, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SizedBox(
          // width: 90,
          child: FadeInDown(
            child: buildNeumorphicButton(
              path: 'assets/images/menu.png',
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
    );
  }

  AnimatedContainer personAppBar(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.linear,
      duration: const Duration(seconds: 1),
      transform: Matrix4.translationValues(
          0, isLocked ? 0 : -MediaQuery.of(context).size.height, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: SizedBox(
          // width: 90,
          child: FadeInDownBig(
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
      ),
    );
  }

  Widget carFront() {
    return FadeInRightBig(
      delay: const Duration(seconds: 1),
      child: Image.asset('assets/images/car-front.png'),
    );
  }

  Widget statusCenter(BuildContext context) {
    return FadeInLeft(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              'Status',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/battery.png',
                        width: 8,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Battery',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '54%',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/range.png',
                        width: 11,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Range',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '297 km',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/tempreture.png',
                        width: 8,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Range',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '297 km',
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(
              'Information',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 200,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              scrollDirection: Axis.horizontal,
              children: [
                infoButton(
                    context: context,
                    onPressed: () {},
                    borderRaduis: 5,
                    info: 'Engine',
                    subtitle: 'Sleeping mode',
                    borerWidth: 1),
                SizedBox(
                  width: 20,
                ),
                infoButton(
                    context: context,
                    onPressed: () {},
                    borderRaduis: 5,
                    info: 'Climate',
                    subtitle: 'A/C is ON',
                    borerWidth: 1),
              ],
            ),
          )
        ],
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
