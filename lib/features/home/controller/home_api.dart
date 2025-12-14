import 'package:flutter/material.dart';
import 'package:newst/core/data/remote_data/api/api_config.dart';
import 'package:newst/core/data/remote_data/api/api_service.dart';
import 'package:newst/features/home/model/news_artical_model.dart';

class HomeApiController extends ChangeNotifier {
  HomeApiController() {
    getHeadlines();
    getEverything();
  }
  ApiService apiService = ApiService();
  bool topHeadLoading = false;
  bool everythingLoading = false;
  String? errorMessage;
  List<NewsArticalModel> newsTopHeadLines = [];
  List<NewsArticalModel> newsEverythingLines = [];
  getHeadlines() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.topHeadlines,
        params: {"country": "us"},
      );
      newsTopHeadLines = (result['articles'] as List)
          .map((article) => NewsArticalModel.fromJson(article))
          .toList();
      topHeadLoading = false;
      errorMessage = 'Field To Load Data';
    } catch (e) {
      errorMessage = e.toString();
      topHeadLoading = false;
    }
  }

  getEverything() async {
    try {
      Map<String, dynamic> result = await apiService.get(
        ApiConfig.everything,
        params: {"q": "news"},
      );
      newsEverythingLines = (result['articles'] as List)
          .map((article) => NewsArticalModel.fromJson(article))
          .toList();
      everythingLoading = false;
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString();
      everythingLoading = false;
    }
    notifyListeners();
  }
}
