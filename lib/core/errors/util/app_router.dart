import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/auth/presentation/views/login_view.dart';
import 'package:news_app/features/auth/presentation/views/register_view.dart';
import 'package:news_app/features/home/presentation/views/home_view.dart';
import 'package:news_app/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {                         
  static const homeView = '/homeView';
  static const loginView = '/loginView';
  static const registerView = '/searchView';
  static final GoRouter router = GoRouter(  
    routes: <RouteBase>[       
    GoRoute(     
      path: '/',
      builder: (BuildContext context, GoRouterState state) {   
        return const SplashView();
      },
    ),
    GoRoute(     
      path: homeView,
      builder: (BuildContext context, GoRouterState state) {  
        return const HomeView( );
      },
    ),
    GoRoute( 
      path: loginView,
      builder: (BuildContext context, GoRouterState state) {   
        return const LoginView();
      },
    ),
        
        GoRoute(      
      path: registerView,
      builder: (BuildContext context, GoRouterState state) {  
        return const RegisterView();
      },
    ),
   ]
   );
  
}