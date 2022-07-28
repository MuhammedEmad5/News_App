import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/layout/states.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/constant.dart';
import 'package:news_app/shared/dio.dart';
import 'package:news_app/shared/shared_prefrence.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool isDark=CacheHelper.getData(key: 'isDark')??false;

  BlocOverrides.runZoned(
        () {
          runApp( MyApp(isDark));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {

  final bool isDark;
  const MyApp(this.isDark, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness()..changeMode(fromShared: isDark),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var isDark=NewsCubit.get(context).isDark;
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDark?ThemeMode.dark: ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: const NewsApp(),
          );
        },

      ),
    );
  }
}

