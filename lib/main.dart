
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cach_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';


import 'layout/news_app/cubit/cubit.dart';
import 'layout/news_app/news_layout.dart';



void main() async
{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachHelper.init();
  bool? isDark=CachHelper.getBoolean(key:'isDark');
runApp(MyApp(isDark));
}

class MyApp extends StatelessWidget {
  bool? isDark;
  MyApp(isDark);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getBusiness()..getSports()..getScience()),
    BlocProvider( create: (BuildContext context)=>AppCubit()..changeMode(
      fromShared: isDark,
    ),)
      ],
      child: BlocConsumer<AppCubit,AppStates>
        (
        listener: (context,state){},
        builder: (context,state)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:lighttheme ,
          darkTheme: darktheme,
          themeMode:AppCubit.get(context).isdark?ThemeMode.dark:ThemeMode.light,

      home:NewsLayout(),
    ),

        ),
      );
  }
}

