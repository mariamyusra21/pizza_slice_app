import 'package:flutter/material.dart';
import 'package:pizza_slice_app/screens/home_screen_tab_view.dart';

import '../screens/second_splash_screen.dart';

class SplashService {
  Future splash(BuildContext context) async {
    Future.delayed(Duration(seconds: 2), () async {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SecondSplash()));
    });
  }

  Future navigateToHome(BuildContext context) async {
    Future.delayed(Duration(seconds: 2), () async {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreenTabView()));
    });
  }
}
