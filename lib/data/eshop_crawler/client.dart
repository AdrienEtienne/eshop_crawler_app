import 'dart:convert';

import 'package:eshop_crawler_app/data/eshop_crawler/models/shop.dart';
import 'package:http/http.dart' as http;

class EshopCrawlerClient {
  Map<String, String> _getHeaders() {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
    };
    return headers;
  }

  Map<String, dynamic> _parseResponse(http.Response response) {
    Map<String, dynamic> json = {};
    try {
      json = jsonDecode(response.body);
    } catch (exception) {
      throw new Exception('UNKNOWN');
    }

    if (response.statusCode >= 400) {
      throw new Exception('RESPONSE: ${response.statusCode}');
    }

    return json;
  }

  String url([String route = '']) {
    return 'https://eshop-crawler.herokuapp.com$route';
  }

  Future<ShopsResponse> getShops() async {
    final http.Response response = await http.get(
      this.url('/v1/shops'),
      headers: this._getHeaders(),
    );
    final body = _parseResponse(response);

    return ShopsResponse.fromJson(body);
  }
}
