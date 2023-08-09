import 'dart:convert';
import 'package:http/http.dart' as http;

class Session {
  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept' : 'application/json',
  };

  Map<String, String> cookies = {};   // 쿠키 대신 키 값을 넣어줄 예정

  Future<dynamic> post({required String url, required dynamic data, bool status=false}) async {
    print('post() url: $url');

    http.Response response = await http.post(
      Uri.parse(url),
      body: json.encode(data),
      headers: headers
    );

    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      // TODO: input
    }
    if(status==true) {
      return json.decode(utf8.decode(response.bodyBytes));
    } else {
      return utf8.decode(response.bodyBytes);
    }
  }
}

