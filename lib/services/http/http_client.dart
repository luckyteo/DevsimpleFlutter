import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'app_exception.dart';

class HttpClient {
  final String _baseUrl = "http://api.themoviedb.org/3/";

  Future<dynamic> get(String url) async {
    var responseJson;
    try {
      
      final response = await http.get(_baseUrl + url);
      
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('Connect failed');
    }

    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case HttpStatus.ok:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
        break;
      case HttpStatus.badRequest:
        throw BadRequestException(response.body.toString());
        break;
      case HttpStatus.unauthorized:
      case HttpStatus.forbidden:
        throw UnauthorisedException(response.body.toString());
        break;
      case HttpStatus.badGateway:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with Statuscode: ${response.statusCode}');
    }
  }
}
