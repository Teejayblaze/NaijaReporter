import 'package:naija_reporter/models/news.dart';
import 'package:flutter/material.dart';

class NaijaReportersRepository {

  Future<List<NaijaReportersNews>> getNews() async {
    Future.delayed(Duration(seconds: 5));
    return Future.value(this._getRepository());
  }


  List<NaijaReportersNews> _getRepository() {
    return [
      NaijaReportersNews.fromJson({
        'id': 1,
        'category': "Lifestyle",
        'title': "5 Things I Wish I Knew While Growing Up",
        'subtitle': "Alfie Allen has devastated fans by revealing "
            "the fate of one; are some plague on their bodies.",
        'imagePath': "images/portfolio_press_large.png",
        'bgColor': Colors.amberAccent[100],
        'duration': "1 day ago",
        'similarity': null,
      }),
      NaijaReportersNews.fromJson({
        'id': 2,
        'category': "Software Developer",
        'title': "My Experience As A Software Developer",
        'subtitle': "Software Development has been one of my greatest dreams"
            "as an engineer, i love crafting beautiful designs...",
        'imagePath': "images/adetunji.jpg",
        'bgColor': Colors.pinkAccent[100],
        'duration': "2 weeks ago",
        'similarity': null,
      }),
      NaijaReportersNews.fromJson({
        'id': 3,
        'category': "Politics",
        'title': "AAC Political Party Rally",
        'subtitle': "The African Action Congress(AAC) political party took to"
            "the streets of lagos storming and educating young minds on their...",
        'imagePath': "images/aac_campaign_2.jpg",
        'bgColor': Colors.blueGrey[100],
        'duration': "4 months ago",
        'similarity': [
          {
            'id': 30,
            'title': "AAC Rally Pulling Weight Everyone collaborated in making"
                "the rally a major success, grassroot campaign, house-to-house"
                "was also not left out.",
            'imagePath': "images/aac_campaign_1.jpg",
            'duration': "5 months ago",
          },
          {
            'id': 31,
            'title': "AAC Political Education as basic as human education is"
                "it\'s lack can destroy a democracy nation. That is why AAC is"
                "taking time out to educate citizens.",
            'imagePath': "images/aac_campaign_5.jpg",
            'duration': "6 weeks ago",
          },
          {
            'id': 32,
            'title': "AAC Awareness And Empowerment, knowledge is power so is"
                "empowerment for the youth and the common man, we are responsi"
                "ble for what happens in the future of our children.",
            'imagePath': "images/aac_campaign_3.jpg",
            'duration': "8 weeks ago",
          },
          {
            'id': 33,
            'title': "AAC Awareness Movement, we are always committed in enlight"
                "ning Nigerians that their MUMU don do, we will do everything "
                "within our reach to stop looting and corrupt leaders.",
            'imagePath': "images/aac_campaign_4.jpg",
            'duration': "7 days ago",
          },
        ],
      }),
      NaijaReportersNews.fromJson({
        'id': 4,
        'category': "Events",
        'title': "Flanbouyant Wedding Grand Finale",
        'subtitle': "The wedding that hold Akure on a stand still...",
        'imagePath': "images/wedding-akinsoto_plus.jpg",
        'bgColor': Colors.purple[100],
        'duration': "4 months ago",
        'similarity': [
          {
            'id': 40,
            'title': "Friends and well wishers enjoyed themselves, while others"
                "are catching the fun of the day. You are all invited, no Penalty.",
            'imagePath': "images/wedding-akinsoto.jpg",
            'duration': "9 months ago",
          },
          {
            'id': 41,
            'title': "The Groom\'s men looking fabulous, families, men and women"
                "of high capacity all graced the occation, it was a fun-filled"
                "event of the year.",
            'imagePath': "images/wedding_akinsoto_frnd.jpg",
            'duration': "9 months ago",
          },
        ],
      }),
      NaijaReportersNews.fromJson({
        'id': 5,
        'category': "Civil Insurgencies",
        'title': "Youths Protest FG To End Sars",
        'subtitle': "The youths in Nigeria has taken to the street protesting"
            " against the formidable manipulation of the Fedral Sars and are"
            " asking the Fedral Goverment to put an end....",
        'imagePath': "images/end_sars_2.jpg",
        'bgColor': Colors.redAccent[100],
        'duration': "1 month ago",
        'similarity': [
          {
            'id': 50,
            'title': "Kolade who was murdered in Cold blood by unscrupulus fedr"
                "al sars officials claiming to be doing their job. We don\'t kn"
                "ow when human killing and assasination becomes the job of...",
            'imagePath': "images/end_sars_1.jpg",
            'duration': "2 weeks ago",
          },
        ],
      }),
      NaijaReportersNews.fromJson({
        'id': 6,
        'category': "Interviews",
        'title': "Omoyele Sowore Interviewed Says Nigerian Youth Are Taking Back"
            "Their Country From Oppressors",
        'subtitle': "Omoyele Sowore the CEO of Sahara Reporters in an interview"
            " on Channels TV says Nigerian youth are tired of the afflictions"
            " from their Oppressor and are ready to take back....",
        'imagePath': "images/sowore_interview.jpg",
        'bgColor': Colors.blueAccent[100],
        'duration': "5 months ago",
        'similarity': null,
      }),
      NaijaReportersNews.fromJson({
        'id': 7,
        'category': "Religion",
        'title': "Reverends Operating Fat Bank Account",
        'subtitle': "Most times we wonder if this kind of Pastors ever fast!",
        'imagePath': "images/pastors_fasting.jpg",
        'bgColor': Colors.cyan[100],
        'duration': "1 month ago",
        'similarity': null,
      }),
    ];
  }
}

final appRepo = new NaijaReportersRepository();