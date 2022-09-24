import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/news_app/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';


class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, NewsStates state){},
      builder: (BuildContext context, NewsStates state){
       var cubit=NewsCubit.get(context);
        return Scaffold(

          appBar: AppBar(
            title: Text('News App',style:
            TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
            actions: [
            IconButton(onPressed: (){
              navigateTo(context,SearchScreen());
            }, icon: Icon(Icons.search)
            ),
              IconButton(onPressed: (){
              AppCubit.get(context).changeMode();
              },
                  icon: Icon(Icons.brightness_4_outlined)),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            elevation: 20.0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            items: cubit.bottomitems,
            currentIndex: cubit.currentindex,
            onTap: (index)
            {
              cubit.ChangeBottom(index);
            },
          ),
          body: cubit.screens[cubit.currentindex],
        );
      }
    );
  }
}
