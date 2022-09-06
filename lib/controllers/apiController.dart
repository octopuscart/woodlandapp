import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class ApiController {
  final String apiendpoint =
      "https://admin.woodlandshk.com/index.php/LocalApi2/";
  Future getDataFromServerList(url_sufix) async {
    try {
      final http.Response response =
          await http.get(Uri.parse('${this.apiendpoint}/$url_sufix'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        return (parsed);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } on Exception catch (_) {
      print('never reached');
    }
  }

  Future getDataFromServerMap(url_sufix) async {
    try {
      final http.Response response =
          await http.get(Uri.parse('${this.apiendpoint}/$url_sufix'));
      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        final parsed = jsonDecode(response.body);
        return (parsed);
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data');
      }
    } on Exception catch (_) {
      print('never reached');
    }
  }
}
