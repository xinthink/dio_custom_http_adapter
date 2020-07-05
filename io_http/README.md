# io_http

[![Pub][pub-badge]][pub]
[![Check Status][check-badge]][github-runs]
[![BSD][license-badge]][license]

A customized dart:io `HttpClient` implementation, to work around the "Hostname mismatch" issue 
when accessing URIs with an IP address ([DNS over HTTP] for example).

Most of the source code is extracted from the `dart:io` package, yet modified to leverage the [SecureSocket.secure] method to specify the host name used during SSL handshake.

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
final client = IoHttpClient();
final req = await client.openUrl('get', Uri.parse('https://216.239.38.21'), 'pub.dev');
final resp = await req.close();
```


[Dart]: https://dart.dev
[github-runs]: https://github.com/xinthink/dio_custom_http_adapter/actions
[check-badge]: https://github.com/xinthink/dio_custom_http_adapter/workflows/check/badge.svg
[codecov-badge]: https://codecov.io/gh/xinthink/dio_custom_http_adapter/branch/master/graph/badge.svg
[codecov]: https://codecov.io/gh/xinthink/dio_custom_http_adapter
[license-badge]: https://img.shields.io/github/license/xinthink/dio_custom_http_adapter
[license]: https://raw.githubusercontent.com/xinthink/dio_custom_http_adapter/master/LICENSE
[pub]: https://pub.dev/packages/io_http
[pub-badge]: https://img.shields.io/pub/v/io_http.svg
[DNS over HTTP]: https://en.wikipedia.org/wiki/DNS_over_HTTPS
[dns package]: https://pub.dev/packages/dns
[SecureSocket.secure]: https://api.dart.dev/stable/dart-io/SecureSocket/secure.html
