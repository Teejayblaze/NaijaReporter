import 'dart:async';
import 'dart:convert';

import 'package:naija_reporter/models/news.dart';
import 'package:naija_reporter/models/news_category.dart';
import 'package:flutter/material.dart';
import 'package:naija_reporter/network/http_services.dart';

class NaijaReportersRepository {


  Future<Stream<NaijaReportersNewsCategory>> getNewsCategory({@required String uri}) => this._getNewsCategoryRepository(uri: uri);
  Future<Stream<NaijaReportersNews>> getNews({@required uri}) => this._getRepository(uri: uri);


  Future<Stream<NaijaReportersNews>> _getRepository({@required uri}) async {
    Stream newsStream = await njHttpServices.getHttpServiceRequest(uri: uri);
    return newsStream
        .transform(Utf8Decoder())
        .transform(JsonDecoder())
        .expand((jsonBody) => (jsonBody as Map)['results'])
        .map((news) => NaijaReportersNews.fromJson(news));
  }

  Future<Stream<NaijaReportersNewsCategory>> _getNewsCategoryRepository({@required String uri}) async{
    Stream categoryStream = await njHttpServices.getHttpServiceRequest(uri: uri);
    return categoryStream
        .transform(Utf8Decoder())
        .transform(JsonDecoder())
        .expand((jsonBody) => (jsonBody as Map)['results'])
        .map((newsCategory) => NaijaReportersNewsCategory.fromJson(newsCategory));
  }
}

final appRepo = new NaijaReportersRepository();