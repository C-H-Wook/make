import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://54.83.101.17:8080";
  final String getInfo = "users";
  final String postInfo = "users/test";

  void getUserInfo() async {
    final url = Uri.parse('$baseUrl/$getInfo');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}
