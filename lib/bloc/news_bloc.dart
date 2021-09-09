import 'dart:async';
import 'dart:convert';
import 'package:state_managment/model/news_info.dart';
import 'package:http/http.dart' as http;

enum NewsActions { Fetch }

class NewsBloc {
  StreamController<List<Article>> _newsStreamController =
      StreamController<List<Article>>();
  StreamSink<List<Article>> get _newsSink => _newsStreamController.sink;
  Stream<List<Article>> get newsStream => _newsStreamController.stream;

  StreamController<NewsActions> _eventConrtoller =
      StreamController<NewsActions>();
  StreamSink<NewsActions> get eventSink => _eventConrtoller.sink;
  Stream<NewsActions> get _eventStream => _eventConrtoller.stream;

  NewsBloc() {
    Future<NewsModel> getNews() async {
      var client = http.Client();
      var newsModel;

      try {
        var response = await client.get(
            "http://newsapi.org/v2/everything?domains=wsj.com&apiKey=280cb475309f439880996fcb3102c2e9");
        if (response.statusCode == 200) {
          var jsonString = response.body;
          var jsonMap = json.decode(jsonString);

          newsModel = NewsModel.fromJson(jsonMap);
        }
      } catch (Exception) {
        return newsModel;
      }

      return newsModel;
    }

    _eventStream.listen((event) async {
      if (event == NewsActions.Fetch) {
        try {
          var news = await getNews();
          if (news != null) {
            _newsSink.add(news.articles);
          } else {
            _newsSink.addError("Something went wrong");
          }
        } on Exception catch (e) {
          _newsSink.addError(e.toString());
        }
      }
    });
  }

  void dispose() {
    _newsStreamController.close();
    _eventConrtoller.close();
  }
}
