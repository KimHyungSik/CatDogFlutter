import 'dart:convert';

import 'package:cat_dog/data/model/remote/Cat.dart';
import 'package:http/http.dart' as http;

class CatService {
  Future<List<CatResponse>> getCatList() async {
    final url =
        Uri.https("api.thecatapi.com", "/v1/images/search", {"limit": "10"});
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonToCatResponseList(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }
}
