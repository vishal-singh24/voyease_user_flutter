

import 'package:dio/dio.dart';

class Demo {
  final Dio dio;

  Demo(this.dio);

  List<dynamic> fetchResults() {
    List<dynamic> result = [];
    var params = {
      "category": "technology",
      "apiKey": "6b5f0f5ffb494735825df1f7da469c8a",
      "country": "in"
    };
    dio.get("https://newsapi.org/v2/top-headlines", queryParameters: params)
      .then((value) {
        print(value.data);
      }, onError: (err) {
        print(err);
    });
    return result;
  }
}

void main() {
  final dio = Dio();
  final d = Demo(dio);
  d.fetchResults();
}

