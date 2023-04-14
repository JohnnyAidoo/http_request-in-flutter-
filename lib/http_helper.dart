import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpHelper {
  Future<List<Map>> fetchItems() async {
    List<Map> items = [];
    http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    if (response.statusCode == 200) {
      String jsonString = response.body;
      List data = jsonDecode(jsonString);
      items = data.cast<Map>();
    }

    return items;
  }
}
