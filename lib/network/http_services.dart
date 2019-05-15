import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';

class NaijaReportersHttpServices {

  final String url = 'http://192.168.43.109:8000/api/v1';
  final http.Client client = new http.Client();

  Future<Stream> getHttpServiceRequest({@required String uri}) async {

    try{

      var streamedResponse = await client.send(
          http.Request('get', Uri.parse("$url$uri"))
      );

      return streamedResponse.stream;

    } catch(e) {
      return Future.error("Unable to connect to host.");
    }
  }
}

final njHttpServices = new NaijaReportersHttpServices();