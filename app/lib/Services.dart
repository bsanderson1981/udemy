//
 
//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'Product.dart';


class Services {

  
  //
  static const String url = 'https://organic.towniebread.com/products.json';
 
  static Future<List<Product>> getUsers() async {

//insert delay to test header loading... or product titile

   
    try {
      final response = await http.get(url);
      if (200 == response.statusCode) {
        final List<Product> product = productFromJson(response.body);
        await Future.delayed(const Duration(seconds: 1)); //fake delay for testing Loading...
        return product;
      } else {
        return List<Product>();
      }
    } catch (e) {
      return List<Product>();
    }
  }
}