import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class ApiHelper
{
  String urlData="https://fakestoreapi.com/products";
  Future apiCalling()
  async {
    Uri url = Uri.parse(urlData);
    Response response= await http.get(url);
    if(response.statusCode==200)
    {
      final json= jsonDecode(response.body);
      return json;
    }
    else{
      return [];
    }

  }
}