import 'package:http/http.dart';
import 'dart:convert';

class NetworkHelp {
  NetworkHelp(this.url);
  final String url;
  String? decodedData;

  Future getData() async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        String data = response.body;
        var decodedData = jsonDecode(data);
        var exercises = decodedData["data"];
        return exercises;
      } else {
        print(response.statusCode);
      }
      print("it is working");
    } catch (e) {
      print(e);
    }
  }
}
