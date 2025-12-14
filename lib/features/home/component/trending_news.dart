import 'package:flutter/material.dart';
import 'package:newst/core/theme/light_color.dart';
import 'package:newst/features/home/controller/home_api.dart';
import 'package:provider/provider.dart';

class TrendingNews extends StatelessWidget {
  const TrendingNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 330,
      child: Stack(
        children: [
          SizedBox(
            height: 280,
            width: double.infinity,
            child: Image.asset('assets/images/homebackground.png', fit: BoxFit.cover),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  Text(
                    'NEWST',
                    style: TextStyle(fontSize: 50, color: LightColor.primaryColor, fontWeight: FontWeight.w600),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Trending News',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 252, 252, 1),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromRGBO(255, 252, 252, 1),
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.solid,
                            decorationColor: Color.fromRGBO(255, 252, 252, 1),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 140,
                    child: Padding(
                      padding: EdgeInsetsGeometry.only(left: 16),
                      child: Consumer<HomeApiController>(
                        builder: (context, controller, child) {
                          return (controller.errorMessage?.isNotEmpty ?? false)
                              ? Center(child: Text(controller.errorMessage!))
                              : controller.everythingLoading
                              ? Center(child: CircularProgressIndicator())
                              : ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: controller.newsEverythingLines.length,
                                  separatorBuilder: (BuildContext context, int index) => SizedBox(width: 8),
                                  itemBuilder: (context, index) {
                                    final newsEverything = controller.newsEverythingLines[index];
                                    return ClipRRect(
                                      borderRadius: BorderRadiusGeometry.circular(12),
                                      child: Stack(
                                        children: [
                                          Image.network(newsEverything.urlToImage.toString()),
                                          Text(newsEverything.title.substring(0, 20)),
                                        ],
                                      ),
                                    );
                                  },
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
