import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import '../Screen/Model/news_model.dart';

class apihelper {
  Future<HomeModel> newsapi(String country) async {
    String applink =
        "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=8081c5d4778d45bcbf5c89c1c0f0be9c";
    Uri uri = Uri.parse(applink);
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    HomeModel h1 = HomeModel();
    HomeModel homeModel = HomeModel.fromJson(json);
    return homeModel;

  }
}