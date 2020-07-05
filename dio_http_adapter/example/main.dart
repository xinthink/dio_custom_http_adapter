import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_http_adapter/adapter.dart';

void main(List<String> args) async {
  if (args == null || args.length < 2) {
    print('Usage: dart main.dart <URI> <HOST>');
    exit(1);
  }

  final uriArg = args[0];

  if (!uriArg.startsWith('https://')) {
    print('URI must start with https://');
    exit(1);
  }

  final uri = Uri.parse(uriArg);
  final host = args[1];

  final dio = Dio()..httpClientAdapter = IoHttpClientAdapter();

  final resp = await dio.headUri(uri,
      options: Options(
        headers: <String, dynamic>{
          // kHostHeaderName: host,
        },
      ));
  resp.headers.forEach((name, values) => print('$name: $values'));
}
