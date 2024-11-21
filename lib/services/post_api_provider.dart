import 'dart:convert';
import 'package:http/http.dart' as http;

abstract class PostApiProvider {
  String baseUrl = 'https://jsonplaceholder.typicode.com/';
  String get endpoint;
  String get url => baseUrl + endpoint;
  dynamic fetch({String endPoint = ""}) async {
    var response = await  http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      return null;
    }
  }
}
