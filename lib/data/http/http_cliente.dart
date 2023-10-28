import 'package:http/http.dart' as http;

import 'package:consumindo_api_flutter/data/http/http.dart';

class HttpCliente implements IHttpcliente {
  final client = http.Client();

  @override
  Future get({required String url}) {
    return client.get(Uri.parse(url));
  }
}
