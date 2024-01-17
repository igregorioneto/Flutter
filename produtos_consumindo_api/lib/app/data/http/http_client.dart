import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

abstract class IHttpClient {
  Future get({required String url});
}

class CustomHttpClient extends http.BaseClient {
  final http.Client _inner = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    return _inner.send(request..followRedirects = false);
  }
  
}

class HttpClient implements IHttpClient {
  final CustomHttpClient client = CustomHttpClient();

  @override
  Future get({required String url}) async {
    return await client.get(Uri.parse(url));
  }
}

class DioClient implements IHttpClient {
  final Dio client;

  DioClient(): client = Dio() {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.badCertificateCallback =
      (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  @override
  Future get({required String url}) async {
    return await client.get(url);
  }
  
}