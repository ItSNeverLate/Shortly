import 'package:http/http.dart' as http;

const SHORTEN_SERVICE_BASE_URL = "api.shrtco.de";

class ShortenService {
  Future<http.Response> getShortLink(String url) async {
    var queryParameters = {
      'url': url,
    };
    var uri = Uri.https(
      SHORTEN_SERVICE_BASE_URL,
      '/v2/shorten',
      queryParameters,
    );
    http.Response response = await http.get(uri);
    return response;
  }
}
