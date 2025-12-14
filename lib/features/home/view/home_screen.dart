import 'package:flutter/material.dart';
import 'package:newst/features/home/component/trending_news.dart';
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
          return Scaffold(body: Column(children: [TrendingNews()]));
        },
      ),
    );
  }
}
