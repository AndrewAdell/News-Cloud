import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/errors/widgets/custom_error_message.dart';
import 'package:news_app/features/home/presentation/manager/featch_news_cubit/news_cubit.dart';
import 'package:news_app/features/home/presentation/manager/featch_news_cubit/news_states.dart';

import 'news_list_view.dart';

class NewsListViewBuilder extends StatelessWidget {
  const NewsListViewBuilder({super.key,
  //  required this.category
   });

  // final String category;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        if (state is NewsSucessStates) {
          return NewsListView(
            articles: state.articales,
          );
        } else if (state is NewsLoadingStates) {
          return const SliverFillRemaining(
            child:  Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NewsFailedStates) {
          return SliverFillRemaining(child: CustomErrorMessage(errMessage: state.errorsMessage));
        } else {
          return const SliverFillRemaining(child:  Text('oops  was an error, try later'));
        }
      },
    );

    // FutureBuilder<List<ArticleModel>>(
    //     future: future,
    //     builder: (context, snapshot) {
    //       if (snapshot.hasData) {
    //         return NewsListView(
    //           articles: snapshot.data!,
    //         );
    //       } else if (snapshot.hasError) {
    //         return const SliverToBoxAdapter(
    //           child: Text('oops  was an error, try later'),
    //         );
    //       } else {
    //         return const SliverToBoxAdapter(
    //           child: Center(
    //             child: CircularProgressIndicator(),
    //           ),
    //         );
    //       }
    //     });
  }
}

// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // future = NewsService(Dio()).getTopHeadlines(category: widget.category);

//     HomeRepoImple(ApiService(Dio())).fetchArticales();
//   }