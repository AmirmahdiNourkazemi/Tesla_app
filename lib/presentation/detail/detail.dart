import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

import '../../colors.dart';
import '../welcome/widget/NeumorphicButton.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

double _gaugeValue = 40;
double _sliderValue = 10;

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
                acButton(context),
                sfRadialGaugeContainer(context),
                const SizedBox(
                  height: 20,
                ),
                fanSpeed(),
                const SizedBox(
                  height: 20,
                ),
                modes(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column modes(BuildContext context) {
    return Column(
      children: [
        const Text('Mode'),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FadeInUp(
              child: Column(
                children: [
                  Text(
                    'Auto',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 65,
                    child: buildNeumorphicButton(
                      depth: 0,
                      path: 'assets/images/A.png',
                      onPressed: () {},
                      borerWidth: 2,
                      scale: 1,
                      color: AppColors.neumorphicBackgroundColorbtnBlue,
                      borderColor: AppColors.neumorphicBorderColorBtnBlue,
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              child: Column(
                children: [
                  Text(
                    'Dry',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 65,
                    child: buildNeumorphicButton(
                      depth: 0,
                      path: 'assets/images/dry.png',
                      onPressed: () {},
                      borerWidth: 2,
                      scale: 0.3,
                      color: AppColors.neumorphicBackgroundColor,
                      borderColor: AppColors.neumorphicBorderColor,
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              child: Column(
                children: [
                  Text(
                    'Cool',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 65,
                    child: buildNeumorphicButton(
                      depth: 0,
                      path: 'assets/images/cool.png',
                      onPressed: () {},
                      borerWidth: 2,
                      scale: 0.3,
                      color: AppColors.neumorphicBackgroundColor,
                      borderColor: AppColors.neumorphicBorderColor,
                    ),
                  ),
                ],
              ),
            ),
            FadeInUp(
              child: Column(
                children: [
                  Text(
                    'Program',
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: 65,
                    child: buildNeumorphicButton(
                      depth: 0,
                      path: 'assets/images/program.png',
                      onPressed: () {},
                      borerWidth: 2,
                      scale: 0.3,
                      color: AppColors.neumorphicBackgroundColor,
                      borderColor: AppColors.neumorphicBorderColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Column fanSpeed() {
    return Column(
      children: [
        const Text('Fan speed'),
        const SizedBox(
          height: 25,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: NeumorphicSlider(
            thumb: Container(
              width: 28,
              height: 28,
              decoration: const ShapeDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.63, 0.77),
                  end: Alignment(0.63, -0.77),
                  colors: [Color(0xFF141415), Color(0xFF2E3236)],
                ),
                shape: OvalBorder(
                  side: BorderSide(width: 1, color: Color(0xFF282B2E)),
                ),
                shadows: [
                  BoxShadow(
                    color: Color(0x59000000),
                    blurRadius: 20,
                    offset: Offset(4, 6),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
            height: 10,
            style: const SliderStyle(
              accent: Color(0xFF0172BE),
              depth: 1,
              border: NeumorphicBorder(
                color: AppColors.neumorphicBorderColor,
                width: 2,
              ),
            ),
            value: _sliderValue,
            onChangeStart: (percent) {
              setState(() {
                _sliderValue = percent;
              });
            },
            onChanged: (percent) {
              setState(() {
                _sliderValue = percent;
              });
            },
          ),
        ),
      ],
    );
  }

  SizedBox sfRadialGaugeContainer(BuildContext context) {
    return SizedBox(
      height: 330,
      child: NeumorphicButton(
        style: const NeumorphicStyle(
            intensity: 0.2,
            shadowDarkColorEmboss: AppColors.neumorphicShadowDarkColorEmboss,
            shadowLightColor: AppColors.neumorphicShadowLightColor,
            surfaceIntensity: 0.1,
            border: NeumorphicBorder(
              isEnabled: true,
              color: AppColors.neumorphicBorderColor,
              width: 0.2,
            ),
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.circle(),
            depth: 20,
            disableDepth: false,
            shadowDarkColor: AppColors.neumorphicShadowDarkColor,
            color: AppColors.neumorphicBackgroundColor),
        child: Stack(
          children: [
            SfRadialGauge(
              animationDuration: 2000,
              enableLoadingAnimation: true,
              axes: <RadialAxis>[
                RadialAxis(
                  showTicks: true,
                  showFirstLabel: false,
                  showLastLabel: false,
                  showLabels: false,
                  radiusFactor: 0.9,
                  majorTickStyle: const MajorTickStyle(
                    length: 0,
                    color: AppColors.neumorphicShadowDarkColorEmboss,
                  ),
                  ticksPosition: ElementsPosition.outside,
                  pointers: <GaugePointer>[
                    RangePointer(
                      cornerStyle: CornerStyle.bothCurve,
                      width: 0.2,
                      enableAnimation: true,
                      sizeUnit: GaugeSizeUnit.factor,
                      value: _gaugeValue,
                      gradient: const SweepGradient(
                        colors: [
                          Color(0xFF0172BE),
                          Color(0xFF0F9BEE),
                        ],
                      ),
                      enableDragging: true,
                      onValueChanged: (value) {
                        setState(() {
                          _gaugeValue = value;
                        });
                      },
                      animationDuration: 1800,
                    ),
                  ],
                  axisLineStyle: const AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.bothCurve,
                    gradient: SweepGradient(
                      colors: [
                        Color(0xFF202428),
                        Colors.black,
                      ],
                    ),
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                )
              ],
            ),
            Positioned(
              top: 130,
              left: 215,
              child: Container(
                width: 10,
                height: 10,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(
                    side: BorderSide(
                        width: 3, color: TextColors.textBodySmallColor),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 130,
              left: 160,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        _gaugeValue.toStringAsFixed(0),
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'C',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Cooling...',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row acButton(BuildContext context) {
    return Row(
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
