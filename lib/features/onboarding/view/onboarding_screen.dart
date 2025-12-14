import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newst/core/widgets/custom_button.dart';
import 'package:newst/features/home/view/home_screen.dart';
import 'package:newst/features/onboarding/controller/onboarding_controller.dart';
import 'package:newst/features/onboarding/models/onboarding_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  _onFinish(BuildContext context) async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => OnboardingController(),
      child: Builder(
        builder: (context) {
          final controller = context.read<OnboardingController>();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromRGBO(240, 240, 240, 1),
              actions: [
                Consumer(
                  builder:
                      (
                        BuildContext context,
                        OnboardingController value,
                        Widget? child,
                      ) {
                        return value.isLastPage
                            ? SizedBox()
                            : TextButton(
                                onPressed: () {
                                  if (!value.isLastPage) {
                                    controller.pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text('Skip'),
                              );
                      },
                ),
              ],
            ),
            body: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (int index) {
                context.read<OnboardingController>().onPageChange(index);
              },
              itemCount: OnboardingModel.onboardingList.length,
              itemBuilder: (context, index) {
                final OnboardingModel model =
                    OnboardingModel.onboardingList[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 30,
                  ),
                  child: Column(
                    children: [
                      Image.asset(model.image),
                      SizedBox(height: 24),
                      Text(
                        model.title,
                        style: TextStyle(
                          color: Color.fromRGBO(78, 75, 102, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(
                        model.description,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(110, 113, 145, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20),
                      SmoothPageIndicator(
                        controller: controller.pageController,
                        count: 3,
                        effect: WormEffect(
                          activeDotColor: Color.fromRGBO(197, 48, 48, 1),
                        ),
                      ),
                      Spacer(),
                      Consumer<OnboardingController>(
                        builder:
                            (
                              BuildContext context,
                              OnboardingController value,
                              Widget? child,
                            ) {
                              return CustomButton(
                                onPressed: () {
                                  if (!value.isLastPage) {
                                    controller.pageController.nextPage(
                                      duration: Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  } else
                                    _onFinish(context);
                                },
                                text: value.isLastPage ? 'Get Started' : 'Next',
                              );
                            },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
