import 'package:flutter/material.dart';
import '../../Utils/api_helper.dart';
import '../Model/news_model.dart';

class Homeprovider extends ChangeNotifier {
  String Name = "in";

  void ChangeData(String country){
    Name = country;
    notifyListeners();
  }

  Future<HomeModel> newsApiCall(String country) async {
    apihelper ApiHelper = apihelper();
    HomeModel h1 = await ApiHelper.newsapi(country);

    return h1;
  }
}