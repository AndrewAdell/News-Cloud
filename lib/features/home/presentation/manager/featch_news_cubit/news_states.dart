import 'package:news_app/features/home/data/model/artical_model.dart';

abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsSucessStates extends NewsStates { 

  List<ArticleModel> articales;

  NewsSucessStates({required this.articales});
}

class NewsFailedStates extends NewsStates{  

   String errorsMessage;

  NewsFailedStates({required this.errorsMessage});
}

class NewsLoadingStates extends NewsStates{}
