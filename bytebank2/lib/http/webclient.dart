import 'package:bytebank2/interceptors/logging_interceptor.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';



final Client client = HttpClientWithInterceptor.build(
    interceptors: [LoggingInterceptor()],
    requestTimeout: Duration(seconds: 5),
    );

const String baseUrl = 'http://192.168.25.13:8080/transactions';

