import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/errors/util/app_router.dart';
import 'package:news_app/core/errors/util/service_locator.dart';
import 'package:news_app/features/auth/presentation/views/manager/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/views/manager/register_cubit/register_cubit.dart';
import 'package:news_app/features/home/data/repos/home_repoImple.dart';
import 'package:news_app/features/home/presentation/manager/featch_news_cubit/news_cubit.dart';
import 'package:news_app/firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewsCubit(getIt.get<HomeRepoImple>())..fetchArticales(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
