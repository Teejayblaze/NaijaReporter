import 'dart:async';
import 'package:naija_reporter/resources/repository.dart';
import 'package:naija_reporter/models/news.dart';
import 'package:naija_reporter/models/news_category.dart';

class NaijaReporterNewsStream {

  StreamController<List<NaijaReportersNews>> _streamController = new StreamController<List<NaijaReportersNews>>.broadcast();
  StreamSink<List<NaijaReportersNews>> get streamInput => _streamController.sink;
  Stream<List<NaijaReportersNews>> get stream => _streamController.stream;


  StreamController<List<NaijaReportersNewsCategory>> _newsCategoryStreamController = new StreamController<List<NaijaReportersNewsCategory>>.broadcast();
  StreamSink<List<NaijaReportersNewsCategory>> get newsCategoryStreamInput => _newsCategoryStreamController.sink;
  Stream<List<NaijaReportersNewsCategory>> get newsCategoryStreamOutput => _newsCategoryStreamController.stream;


  Future<Null> fillStreamRepository() async{
    Stream<NaijaReportersNews> newsStream = await appRepo.getNews(uri: '/news/recent/featured');
    final List<NaijaReportersNews> _naijaNewsList = new List<NaijaReportersNews>();
    newsStream.listen((news) => _naijaNewsList.add(news));
    this.streamInput.add(_naijaNewsList);
    return null;
  }

  Future<Null> fillStreamMenuRepository() async {
    Stream<NaijaReportersNewsCategory> newsCategories = await appRepo.getNewsCategory(uri: '/news/category');
    final List<NaijaReportersNewsCategory> _newsListCategory = new List<NaijaReportersNewsCategory>();
    newsCategories.listen((newsCategory) => _newsListCategory.add(newsCategory));
    newsCategoryStreamInput.add(_newsListCategory);
    return null;
  }


  void disposed(){
    _streamController.close();
    _newsCategoryStreamController.close();
  }
}

final njReporterStreamBloc = new NaijaReporterNewsStream();