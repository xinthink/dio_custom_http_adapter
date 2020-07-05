# dio_http_adapter

[![Pub][pub-badge]][pub]
[![Check Status][check-badge]][github-runs]
[![BSD][license-badge]][license]

A customized [dio] `HttpClientAdapter` based on the `dart:io` package, to work around the "Hostname mismatch" issue 
when accessing URIs with an IP address ([DNS over HTTP] for example).

## Usage

Get an IP address of the 'pub.dev' site:

```
ping pub.dev
PING pub.dev (216.239.38.21) 56(84) bytes of data.
64 bytes from any-in-2615.1e100.net (216.239.38.21): icmp_seq=1 ttl=112 time=88.7 ms
```

> Or using a dart package like [dns][dns package]


Access it using [dio]:

```dart
final dio = Dio(BaseOptions(
  baseUrl: 'https://216.239.38.21', // uses an IP address
  headers: <String, dynamic>{
    'host': 'pub.dev', // specifies the host name
  },
))..httpClientAdapter = IoHttpClientAdapter(); // uses the customized adapter

final resp = await dio.head('/');
```


[Dart]: https://dart.dev
[github-runs]: https://github.com/xinthink/dio_custom_http_adapter/actions
[check-badge]: https://github.com/xinthink/dio_custom_http_adapter/workflows/check/badge.svg
[codecov-badge]: https://codecov.io/gh/xinthink/dio_custom_http_adapter/branch/master/graph/badge.svg
[codecov]: https://codecov.io/gh/xinthink/dio_custom_http_adapter
[license-badge]: https://img.shields.io/github/license/xinthink/dio_custom_http_adapter
[license]: https://raw.githubusercontent.com/xinthink/dio_custom_http_adapter/master/LICENSE
[pub]: https://pub.dev/packages/dio_http_adapter
[pub-badge]: https://img.shields.io/pub/v/dio_http_adapter.svg
[dio]: https://github.com/flutterchina/dio
[DNS over HTTP]: https://en.wikipedia.org/wiki/DNS_over_HTTPS
[dns package]: https://pub.dev/packages/dns
[SecureSocket.secure]: https://api.dart.dev/stable/dart-io/SecureSocket/secure.html
