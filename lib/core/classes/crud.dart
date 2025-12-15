import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/classes/StatusRequest.dart';
import 'package:ecommerce/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    print('--- DEBUG: POST REQUEST ---');
    print('URL: $linkurl');
    print('DATA: $data');
    print('---------------------------');

    if (await checkInternet()) {
      try {
        var response = await http.post(Uri.parse(linkurl), body: data);

        // decode safely
        final raw = utf8.decode(response.bodyBytes);
        print('STATUS: ${response.statusCode}');
        print('RAW RESPONSE: $raw');
        print('---------------------------');

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(raw);
          return Right(responsebody);
        } else {
          return Left(StatusRequest.serverfailure);
        }
      } catch (e, st) {
        print('ERROR during POST: $e');
        print(st);
        return Left(StatusRequest.serverfailure);
      }
    } else {
      print('No internet connection');
      return Left(StatusRequest.offlinefailure);
    }
  }
}
