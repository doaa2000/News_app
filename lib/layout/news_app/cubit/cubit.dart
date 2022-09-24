
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/news_app/business/business_screen.dart';
import 'package:news_app/news_app/science/science_screen.dart';
import 'package:news_app/news_app/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());
static NewsCubit get(context)=>BlocProvider.of(context);
int currentindex=0;
List<BottomNavigationBarItem>bottomitems=[
  BottomNavigationBarItem(icon:Icon(Icons.business),
  label: 'Business'),
  BottomNavigationBarItem(icon:Icon(Icons.sports_baseball,),
      label: 'Sports'),

  BottomNavigationBarItem(icon:Icon(Icons.science),
      label: 'Science'),

];
List<Widget>screens=
[
  BusinessScreen(),
  SportsScreen(),
  ScienceScreen(),

];

void ChangeBottom(int index)
{
  currentindex=index;

  emit(NewsBottomNavBar());
}
  List<dynamic>business=[];
void getBusiness()
{
  emit(BusinessLoadingState());
  DioHelper.getData(url: 'v2/top-headlines',
    query: {
      'country': 'us',
      'category': 'business' ,
      'apiKey': '2cf9616f1c924ae592fa3021f04f8523',},
  ).then((value) {
   business=value.data['articles'];
   print(business[0]['title']);
   emit(NewGetBusinessSuccessesState());
  }).catchError((error){
    print('error when catch ${error.toString()}');
    emit(NewGetBusinessErrorState());
  });
}

  List<dynamic>sports=[];
  void getSports()
  {
    emit(SportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'sports' ,
        'apiKey': '2cf9616f1c924ae592fa3021f04f8523',},
    ).then((value) {
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit(NewGetSportsSuccessesState());
    }).catchError((error){
      print('error when catch ${error.toString()}');
      emit(NewGetSportsErrorState());
    });
  }


  List<dynamic>science=[];
  void getScience()
  {
    emit(ScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'science' ,
        'apiKey': '2cf9616f1c924ae592fa3021f04f8523',},
    ).then((value)
    {
      science=value.data['articles'];
      print(science[0]['title']);
      emit(NewGetScienceSuccessesState());
    }).catchError((error){
      print('error when catch ${error.toString()}');
      emit(NewGetScienceErrorState());
    });
  }

  List<dynamic>search=[];
  void getSearch(String value)
  {
    emit(SearchLoadingState());
    DioHelper.getData(url: 'v2/everything',
      query: {

        'q': '$value',
        'apiKey': '2cf9616f1c924ae592fa3021f04f8523',},
    ).then((value)
    {
      search=value.data['articles'];

      print(search[0]['title']);
      emit(NewGetSearchSuccessesState());
    }).catchError((error){
      print('error when catch ${error.toString()}');
      emit(NewGetSearchErrorState(error.toString()));
    });
  }


}