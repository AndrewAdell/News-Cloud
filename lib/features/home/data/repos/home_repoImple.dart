import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/core/util/api_service.dart';
import 'package:news_app/features/home/data/model/artical_model.dart';
import 'package:news_app/features/home/data/repos/home_repo.dart';

class HomeRepoImple implements HomeRepo {   
  final ApiService apiService;

  HomeRepoImple(this.apiService);
  @override
  Future<Either<Failure, List<ArticleModel>>> fetchArticales() async {
    try {
      var data = await apiService.get(
          endpoint:
              'everything?q=bitcoin&apiKey=ddef7a7265ad472ab1d7927ad2a1d2b8');

      print(data);
      List<ArticleModel> articales = [];

      for (var articale in data["articles"]) {
        articales.add(ArticleModel.fromJson(articale));
      }
      print(articales);
      return right(articales);
    } on Exception catch (e) { 
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure('there is no internet connection '));
    }
  }
}
