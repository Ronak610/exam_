import 'dart:convert';

import 'package:exam/App/Screen/Api/Modal/Api_modal.dart';
import 'package:http/http.dart' as http;

class Api_http
{
  Api_http._();
  static Api_http api_http = Api_http._();
  Future<ApiModal?> news()
   async {
     String Apilink = "https://newsapi.org/v2/everything?q=tesla&from=2023-02-28&sortBy=publishedAt&apiKey=cb8c4aeecbbf464e95d5d740dc293bc1";
     var response =await  http.get(Uri.parse(Apilink));
     if(response.statusCode==200)
       {
         var json = jsonDecode(response.body);
         return ApiModal.fromJson(json);
       }
   }
}