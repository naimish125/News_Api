import 'dart:convert';

import 'package:http/http.dart' as http;

import '../news/model/news_model.dart';

class homeHelper
{

  Future<Welcome> newsApi(String country)
  async {
    String link = "https://newsapi.org/v2/top-headlines?country=$country&category=business&apiKey=b080f300e173423aa5819f8c3e3e2114";

    Uri uri = Uri.parse(link);

    var response = await http.get(uri);

    var json = jsonDecode(response.body);
    Welcome w1 = Welcome.fromJson(json);

    return w1;

  }
}
