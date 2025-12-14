import 'package:flutter/material.dart';
import 'package:newst/core/data/local_data/preferences_manager.dart';
import 'package:newst/features/home/view/home_screen.dart';
import 'package:newst/features/login/view/login_screen.dart';
import 'package:newst/features/onboarding/view/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _navigateAfterSplash();
  }

  void _navigateAfterSplash() async {
    await Future.delayed(Duration(seconds: 3));
    //On Boarding Complete
    final bool onBoardingComplete =
        PreferencesManager().getBool('on_boarding_complete') ?? false;
    final bool isLoggedIn =
        PreferencesManager().getBool('is_logged_in') ?? false;
    if (!mounted) return;
    if (!onBoardingComplete) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    } else if (!isLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'assets/images/splash.png',
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
