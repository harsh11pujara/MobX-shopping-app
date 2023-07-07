import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:hyperlink_task/model/product_model.dart';

class ProductApi{

  String url = "https://dummyjson.com/products";
  Future<ProductModel?> fetchData() async{

    var response = await http.get(Uri.parse(url));
    if(response.statusCode == 200){
      Map<String, dynamic> json = jsonDecode(response.body) as Map<String, dynamic>;
      ProductModel data = ProductModel.fromJson(json);
      return data;
    }else{
      log("Error in api calling");
      return null;
    }

  }
}