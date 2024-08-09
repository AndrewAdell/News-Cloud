import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/core/errors/util/api_service.dart';
import 'package:news_app/features/home/data/repos/home_repoImple.dart';

final getIt = GetIt.instance;
   
void setupServiceLocator() {                               
  getIt.registerSingleton<ApiService>(ApiService(Dio()));
  getIt.registerSingleton<HomeRepoImple>(HomeRepoImple(getIt.get<ApiService>()));
}
