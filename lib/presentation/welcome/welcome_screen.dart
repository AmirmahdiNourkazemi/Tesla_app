import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  path: 'assets/images/setting.png', onPressed: () {}),
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
        child: ListView(children: [
          Column(
            children: [
              Text(
                'Tesla',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Text(
                'Cybertruck',
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          )
        ]),
      ),
    );
  }
}
