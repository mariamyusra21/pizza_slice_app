import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';

import '../services/splash_service.dart';

class SecondSplash extends StatefulWidget {
  const SecondSplash({Key? key})
      : super(
          key: key,
        );

  @override
  State<SecondSplash> createState() => _SecondSplashState();
}

class _SecondSplashState extends State<SecondSplash> {
  SplashService splash = SplashService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splash.navigateToHome(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.5, 0),
              end: Alignment(0.5, 1),
              colors: [Color(0XFFDB1818), Color(0XFF8E0404)],
            ),
          ),
          child: Container(
            height: 800,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset(
                  "assets/images/img_pngegg_16_2.png",
                  height: 482,
                  width: double.maxFinite,
                ),
                _buildStackSlicceSection(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackSlicceSection(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 206,
        margin: EdgeInsets.only(top: 240),
        padding: EdgeInsets.symmetric(horizontal: 76),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Animate(
              child: Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  height: 206,
                  child: SvgPicture.asset(
                    "assets/images/img_group_68.svg",
                  ).animate(autoPlay: true),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(60),
                topRight: Radius.circular(64),
                bottomLeft: Radius.circular(64),
                bottomRight: Radius.circular(60),
              ),
              child: Image.asset(
                "assets/images/img_slicce_1.png",
                height: 198,
              ),
            )
          ],
        ),
      ),
    );
  }
}
