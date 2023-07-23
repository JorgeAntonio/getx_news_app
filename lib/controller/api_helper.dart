import 'package:get/get.dart';
import 'package:news_app/model/news_model.dart';

class NewsHelper extends GetConnect implements GetxService {
  Future<List<NewsModel>> getHeadlines() async {
    Response response = await get(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=139b5cec42724cb1ba7c56f9f28b3bea');
    List data = response.body['articles'];
    List<NewsModel> newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return newsModel;
  }
}
