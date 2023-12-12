import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:image_recogention/views/home_view.dart';
import 'package:image_recogention/widgets/custom_button.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});
  static const String id = "/onboarding_view";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 153,
                  height: 35,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFC6F432),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    'Personal AI Buddy',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF010101),
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    "assets/images/svg/robot.svg",
                    height: 400,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  width: 306,
                  child: Text(
                    'How may I help you today !',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  onTap: () {
                    Get.offAllNamed(HomeView.id);
                  },
                  title: 'Get Started',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
