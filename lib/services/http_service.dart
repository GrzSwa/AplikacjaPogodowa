import 'package:http/http.dart' as http;

Future<http.Response?> responseBody(String latitude, String longitude) async {
  var url = Uri.https("geocode.maps.co","/reverse",{"lat":latitude, "lon":longitude});
    var response = await http.get(url);
    if(response.statusCode == 200){
      return response;
    }
    return null;
}