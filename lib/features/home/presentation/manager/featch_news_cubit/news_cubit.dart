import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/features/home/data/repos/home_repo.dart';
import 'package:news_app/features/home/presentation/manager/featch_news_cubit/news_states.dart';

class NewsCubit extends Cubit<NewsStates> { 
  NewsCubit(this.homeRepo) : super(NewsInitialStates());

  final HomeRepo homeRepo;

  Future<void> fetchArticales() async {
    emit(NewsLoadingStates());
    var result = await homeRepo.fetchArticales();

    result.fold((failure) { 
      emit(NewsFailedStates(errorsMessage: failure.errMessage));
    }, (news) {
      emit(NewsSucessStates(articales: news));
    });
  }
}
