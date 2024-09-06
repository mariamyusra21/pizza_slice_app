import 'package:flutter/material.dart';

import '../services/splash_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.splash(context);
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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 26),
                child: Image.asset(
                  "assets/images/img_pngegg_16_1.png",
                  height: 484,
                  width: double.maxFinite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
