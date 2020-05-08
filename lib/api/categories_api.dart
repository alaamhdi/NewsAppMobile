import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutterappparctice/models/category.dart';
import 'dart:convert';
import 'package:flutterappparctice/utilities/api_Utilities.dart';

class CategoriesAPI {

  Future<List<Category>> fetchAllCategories() async {
    List<Category> categories = List<Category>();
    String allcategories =base_api+ all_categories_api;

    var response = await http.get(allcategories);
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      var data = jsonData["data"];

      for (var item in data) {
        Category category = Category(item['id'].toString(),
            item['title'].toString());
        categories.add(category);
        print(category.title );
      }
    }
    return categories;
  }
}


