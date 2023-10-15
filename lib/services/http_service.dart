import 'package:http/http.dart' as http;

Future<http.Response?> responseBody(String urlAddress,[String unencodedPath = '',Map<String,dynamic>? queryParams]) async {
  var url = Uri.https(urlAddress,unencodedPath,queryParams);
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response;
    }
    return null;
}

