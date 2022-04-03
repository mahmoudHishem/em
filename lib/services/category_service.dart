
import 'package:em/utilis/my_string.dart';
import 'package:http/http.dart'as http;

import '../model/categorymodel.dart';
import '../model/product_models.dart';

class CategoryServices{
  static Future<List<String>>getCategory()async{
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if(response.statusCode==200){
      var jsonData= response.body;
      return categoryModelFromJson(jsonData);
    }
    else{return throw Exception("Failed to load product");}
  }
}
class AllCategoryServices{
  static Future<List<Welcome>>getAllCategory(String namecategory)async{
    var response = await http.get(Uri.parse("$baseUrl/products/category/$namecategory"));
    if(response.statusCode==200){
      var jsonData= response.body;
      return welcomeFromJson(jsonData);
    }
    else{return throw Exception("Failed to load product");}
  }
}
