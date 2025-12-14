import 'package:flutter/material.dart';
import 'package:newst/core/data/local_data/preferences_manager.dart';
import 'package:newst/features/login/view/login_screen.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();

  int currentIndex = 0;
  bool isLastPage = false;

  void onPageChange(int index) {
    if (index == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
    currentIndex = index;
    notifyListeners();
  }
  onFinish(BuildContext context) async {
    PreferencesManager().setBool('on_boarding_complete', true);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }
}
