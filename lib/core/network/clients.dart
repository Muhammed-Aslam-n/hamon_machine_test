import 'package:hamon_machine_task/core/utils/api_constants.dart';
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

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, String? body}) async {
    final url = Uri.parse('http://nibrahim.pythonanywhere.com/registration/?api_key=${ApiConstants.apiKey}');
    return client.post(url, body: body,headers: {'Content-Type': 'application/x-www-form-urlencoded'});
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    // final url = Uri.parse('$baseUrl$endpoint');
    final url = Uri.parse('http://nibrahim.pythonanywhere.com/registration/$endpoint?api_key=${ApiConstants.apiKey}');

    return client.delete(url, headers: {'Content-Type': 'application/x-www-form-urlencoded'});
  }
}
