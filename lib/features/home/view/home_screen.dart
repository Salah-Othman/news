import 'package:flutter/material.dart';
import 'package:newst/features/home/controller/home_api.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => HomeApiController(),
      child: Consumer<HomeApiController>(
        builder: (BuildContext context, controller, Widget? child) {
          return Scaffold(
            body: (controller.errorMessage?.isNotEmpty ?? false)
                ? Center(child: Text(controller.errorMessage!))
                : controller.everythingLoading
                ? Center(child: CircularProgressIndicator())
                : Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.newsEverythingLines.length,
                          itemBuilder: (BuildContext context, int index) {
                            final everyThing =
                                controller.newsEverythingLines[index];
                            return Text(everyThing.title);
                          },
                        ),
                      ),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
