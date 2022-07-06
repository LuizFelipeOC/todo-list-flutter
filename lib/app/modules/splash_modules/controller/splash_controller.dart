import 'package:flutter/cupertino.dart';

class SplashController {
  redirectFromHomePage(context) async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
      () => {
        Navigator.pushNamed(context, '/home'),
      },
    );
  }
}
