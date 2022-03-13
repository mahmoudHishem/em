import 'package:em/model/product_models.dart';
import 'package:em/utilis/my_string.dart';
import 'package:http/http.dart' as http;



class ProductServices{
   static Future <List<Welcome>> getProduct() async{
   var response= await http.get(Uri.parse('$baseUrl/products'));
   if(response.statusCode==200){
      var jsonData =response.body;
      return welcomeFromJson(jsonData);
   }
   else{
     throw Exception('Failed to load product');
   }
  }
}