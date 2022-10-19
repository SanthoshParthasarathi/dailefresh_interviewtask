import 'dart:convert';
import 'package:dailefresh_interview/model/product_model.dart';
import 'package:http/http.dart' as http;

class ApiHandler {
  static Future<List<Data>> getProduct() async {
    var apiUrl =
        "https://pg.dailefresh.com/WebApi/ListProductByCategoryorSubCategory_Page?Cat=FNV&Sub=FV&StoreId=1&User_id=1&R_Number=1";

    var uri = Uri.parse(apiUrl);

    var response = await http.get(uri);

    var data = json.decode(response.body);

    // print(data);
    // print("data from api");

    List tempList = [];

    for (var i in data['Data']) {
      tempList.add(i);
    }
    // print("data from templist");

    print(tempList);
    return Data.dataFromSnapshot(tempList);
  }
}
