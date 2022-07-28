import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/states.dart';
import 'package:news_app/modules/business.dart';
import 'package:news_app/modules/science.dart';
import 'package:news_app/modules/sports.dart';
import 'package:news_app/shared/dio.dart';
import 'package:news_app/shared/shared_prefrence.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../shared/constant.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);

  int currentIndex=0;

  List<SalomonBottomBarItem> item=[
    SalomonBottomBarItem(
        icon:const Icon(
            Icons.business_center_outlined
        ),
        title:const Text('Business'),
        selectedColor: secondColor,
        unselectedColor: mainColor

    ),
    SalomonBottomBarItem(
        icon:const Icon(
            Icons.sports_cricket
        ),
        title:const Text('Sports'),
        selectedColor: secondColor,
        unselectedColor: mainColor
    ),
    SalomonBottomBarItem(
        icon:const Icon(
            Icons.science_outlined
        ),
        title:const Text('Science'),
        selectedColor: secondColor,
        unselectedColor: mainColor
    ),
  ];

  List<String>title=[
    'business',
    'Sports',
    'Science',
  ];
  List<Widget>screen=[
    const Business(),
    const Sports(),
    const Science(),
  ];

  void changeNavBar(index){
    currentIndex=index;
    if(index == 1) {
      getSports();
    }
    if(index==2){
      getScience();
    }
    emit(ChangeNavBarState());
  }

  List<dynamic>business=[];
  void getBusiness(){
    emit(GetBusinessLoadingState());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country':'eg',
          'category':'business',
          'apikey':'3eb661b40bbb4df1a7e00258e306aada',

        }
    ).then((value) {
      business=value.data['articles'];
      emit(GetBusinessSuccessState());
    }).catchError((error){
      emit(GetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic>sports=[];
  void getSports(){
    emit(GetSportLoadingState());
    if(sports.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'sports',
            'apikey':'3eb661b40bbb4df1a7e00258e306aada',

          }
      ).then((value) {
        sports=value.data['articles'];
        emit(GetSportSuccessState());
      }).catchError((error){
        emit(GetSportErrorState(error.toString()));
      });
    }else {
      emit(GetSportSuccessState());
    }

  }

  List<dynamic>science=[];
  void getScience(){
    emit(GetScienceLoadingState());
    if(science.isEmpty){
      DioHelper.getData(
          url: 'v2/top-headlines',
          query: {
            'country':'eg',
            'category':'science',
            'apikey':'3eb661b40bbb4df1a7e00258e306aada',

          }
      ).then((value) {
        science=value.data['articles'];
        emit(GetScienceSuccessState());
      }).catchError((error){
        emit(GetScienceErrorState(error.toString()));
      });
    }else {
      emit(GetScienceSuccessState());
    }

  }

  List<dynamic>search=[];
  void getSearch({required String value}){
    emit(SearchLoadingState());
    search=[];
    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'sortBy':'publishedAt',
          'apikey':'3eb661b40bbb4df1a7e00258e306aada',

        }
    ).then((value) {
      search=value.data['articles'];
      emit(SearchSuccessState());
    }).catchError((error){
      emit(SearchErrorState(error.toString()));
    });
  }

  bool isDark=false;
  void changeMode({fromShared}){
    if(fromShared!=null){
      isDark=fromShared;
    }else {
      isDark=!isDark;
      CacheHelper.putData(key: 'isDark', value: isDark);
      emit(ChangeModeState());
    }

  }

}