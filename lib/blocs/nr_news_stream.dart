import 'dart:async';
import 'package:naija_reporter/resources/repository.dart';
import 'package:naija_reporter/models/news.dart';

class NaijaReporterNewsStream {

  StreamController<List<NaijaReportersNews>> _streamController = new StreamController<List<NaijaReportersNews>>.broadcast();

  StreamSink<List<NaijaReportersNews>> get streamInput => _streamController.sink;
  Stream<List<NaijaReportersNews>> get stream => _streamController.stream;

  Future<Null> fillStreamRepository() async{
    List<NaijaReportersNews> news = await appRepo.getNews();
    this.streamInput.add(news);
    return null;
  }

}

final njReporterStreamBloc = new NaijaReporterNewsStream();