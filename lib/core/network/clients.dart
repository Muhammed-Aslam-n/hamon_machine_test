import 'package:http/http.dart' as http;
class CustomHttpClient {
  final String baseUrl;
  final http.Client client;

  CustomHttpClient({required this.baseUrl, http.Client? client})
      : client = client ?? http.Client();

  Future<http.Response> get(String endpoint, {Map<String, String>? headers, Map<String, String>? queryParameters}) async {
    final url = Uri.parse('$baseUrl$endpoint').replace(queryParameters: queryParameters);
    return client.get(url, headers: headers);
  }

  Future<http.Response> patch(String endpoint, {Map<String, String>? headers, Map<String, String>? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return client.patch(url, headers: headers, body: body);
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, Map<String, String>? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return client.post(url, headers: headers, body: body);
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return client.delete(url, headers: headers);
  }
}
