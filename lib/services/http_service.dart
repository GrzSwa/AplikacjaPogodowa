import 'dart:convert';

import 'package:http/http.dart' as http;

Future<http.Response?> responseBody(String urlAddress,[String unencodedPath = '',Map<String,dynamic>? queryParams]) async {
  var url = Uri.https(urlAddress,unencodedPath);
  if(queryParams != null){
    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json", "charset":"utf-8"},
      body: json.encode(queryParams)
    );
    if(response.statusCode == 200){
      return response;
    }
  }else{
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response;
    }
  }
  return null;
    
}



