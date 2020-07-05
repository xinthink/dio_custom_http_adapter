/// A customized HttpClient implementation base on the dart:io package.
///
/// The source code is extracted from the dart:io package, but it's customized so that
/// we can override the host name validation during the SSL handshake phrase.
library io_http;

import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:developer' hide log;
import 'dart:math';
import 'dart:io';
import 'dart:typed_data';

export 'dart:io';
export 'dart:typed_data';

part 'crypto.dart';
part 'http_date.dart';
part 'http_headers.dart';
part 'http_impl.dart';
part 'http_parser.dart';
part 'http_session.dart';
