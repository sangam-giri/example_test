import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient({http.Client? client}) : client = client ?? http.Client();

  Future<http.Response> get(String url) async {
    final response = await client.get(Uri.parse(url));
    return response;
  }
}
