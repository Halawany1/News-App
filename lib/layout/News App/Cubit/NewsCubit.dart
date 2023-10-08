import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/shared/Network/local/CacheHelper.dart';

import '../../../modules/Business/business.dart';
import '../../../modules/Science_Screen/science.dart';
import '../../../modules/Sports_Screen/sports.dart';
import '../../../shared/Network/remote/dio_helper.dart';
import 'NewsState.dart';

class NewsCubit extends Cubit<NewsState>{
  NewsCubit():super(NewsInitialState());
  static NewsCubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;
List<BottomNavigationBarItem>BottomItem=[
BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: 'Business'),
  BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
  BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
];
List<Widget> ScreenItem=[
Business(),
  Sports(),
  Science(),
  ];
void ChangeBottomNavBar(int Index){
  currentIndex=Index;
  emit(NewsChangeNavBarState());
}
List<dynamic> business=[];
int selectedItem=0;
void GetBusiness(){
  emit(NewsGetBusinessLoadingState());
    DioHelper.GetData(query: {
      'country':'us'
      ,'category':'business',
      'apiKey':'8d6c1e33c6864749bd703bb1cd969159'
    }, url: 'v2/top-headlines').then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

}
void ChangeSelectItem(int index){
  selectedItem=index;
  emit(ChangeSelectItemState());
}

bool isDesktop=false;
void ChangePlatform(bool platform){
  isDesktop=platform;
  emit(ChangePlatformState());
}

List<dynamic> sports=[];
void GetSports(){
    emit(NewsGetSportsLoadingState());

      DioHelper.GetData(query: {
        'country':'us'
        ,'category':'sports',
        'apiKey':'8d6c1e33c6864749bd703bb1cd969159'
      }, url: 'v2/top-headlines').then((value) {
        sports = value.data['articles'];
        print(business[2]['title']);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      });

  }

List<dynamic> science=[];
  void GetScience(){
    emit(NewsGetScienceLoadingState());
      DioHelper.GetData(query: {
        'country':'us'
        ,'category':'science',
        'apiKey':'8d6c1e33c6864749bd703bb1cd969159'
      }, url: 'v2/top-headlines').then((value) {
        science = value.data['articles'];
        print(business[2]['title']);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      });

  }
List<dynamic> search=[];
void GetSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.GetData(query: {
      'country':'us'
      ,'category':'$value',
      'apiKey':'8d6c1e33c6864749bd703bb1cd969159'
    }, url: 'v2/top-headlines').then((value) {
      search = value.data['articles'];
      print(search[2]['title']);
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });

  }


  bool IsDark=false;
  void ChangeMode({bool ?FromShared}) {
    if(FromShared!=null){
      IsDark=FromShared;
      emit(NewsChangeModeState());

    }else{
      IsDark=!IsDark;
      CacheHelper.PutBoolean(key:'IsDark', value: IsDark).then((value) {
        emit(NewsChangeModeState());
      });
      print("$FromShared");
    }


  }
}