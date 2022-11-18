import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:stocknews/constant/apiconstant.dart';
import 'package:stocknews/models/homePageModel/homePageModel.dart';
import 'package:stocknews/models/newsModel/news_data_model.dart';

class ApiProvider {
  var client = http.Client();

  Future<dynamic> allNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.allnews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        homepageDataModel.clear();
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          print(newsBody[i]['urlToImage'].toString());
          homepageDataModel.add(HomePageDataModel(
            image: newsBody[i]['urlToImage'].toString(),
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['title'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> indiaNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.indianews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> usaNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.usanews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> canadaNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.canadanews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> franceNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.francenews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> germanyNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.germanynews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> japanNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.japannews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> russiaNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.russianews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> ukNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.uknews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> australiaNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.australianews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<dynamic> uaeNews() async {
    try {
      var url = Uri.parse(ApiConstant.baseURL + ApiConstant.uaenews);
      var response = await client.get(url);
      var newsBody = jsonDecode(response.body)["articles"];
      if (response.statusCode == 200) {
        newsDataModel.clear();
        for (int i = 0; i < newsBody.length; i++) {
          newsDataModel.add(NewsDataModel(
            newsdate: newsBody[i]['publishedAt'].toString().split('T').first,
            newsdetailsdata: newsBody[i]['description'].toString(),
            newstime: newsBody[i]['publishedAt']
                .toString()
                .split('T')
                .last
                .split('Z')
                .first,
            link: newsBody[i]['url'].toString(),
          ));
        }
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
