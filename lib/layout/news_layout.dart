import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/states.dart';
import 'package:news_app/modules/search.dart';
import 'package:news_app/shared/components.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var cubit=NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              cubit.title[cubit.currentIndex],
            ),
            actions: [
              IconButton(
                  onPressed: (){
                    navigatorTo(context, Search());
                  },
                  icon:const Icon(Icons.search),
              ),
              IconButton(
                onPressed: (){
                  cubit.changeMode();
                },
                icon:const Icon(Icons.brightness_4_outlined),
              ),
            ],
          ),
          bottomNavigationBar: SalomonBottomBar(
            items: cubit.item,
            currentIndex: cubit.currentIndex,
            onTap: (index){
              cubit.changeNavBar(index);
            },
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },

    );
  }
}
