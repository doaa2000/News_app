
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cach_helper.dart';



class AppCubit extends Cubit<AppStates> {
  

  AppCubit() :super(AppInitialStates());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentindex = 0;


  void ChangeIndex(int index) {
    currentindex = index;
    emit(AppChangeBottomNavBar());
  }

 

 

 bool isdark=false;
void changeMode({bool? fromShared})
{
  if(fromShared!=null)
    {
      isdark=fromShared;
      emit(ChangeAppMode());
    }

  else {
    isdark = !isdark;

    CachHelper.putBoolean(key: 'isDark', isDark: isdark).then((value) {
      emit(ChangeAppMode());
   });

 }
 }
}