import 'package:dartz/dartz.dart';
import 'package:news_app/core/errors/failures.dart';
import 'package:news_app/features/home/data/model/artical_model.dart';

abstract class HomeRepo {     
  Future<Either<Failure, List<ArticleModel>>> fetchArticales(); 

  
}
