import 'package:io_http/io_http.dart';

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
  final client = IoHttpClient();
  final req = await client.openUrl('get', uri, host);
  final resp = await req.close();
  print(resp.headers);
}
