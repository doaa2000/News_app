import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
 var searchcontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
     listener: (context, state){},
      builder: (context, state){
       var list=NewsCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultformfield
                (
                  type: TextInputType.text,
                  onchanged: (value)
                  {
                  NewsCubit.get(context).getSearch(value);
                  },
                  controller: searchcontroller,
                  validate: (value)
                  {
                    if(value.isEmpty)
                      return 'Search must not be empty';
                    return null;
                  },
                  prefixicon: Icons.search,
                  label: 'Search'),
            ),
            Expanded(
              child: articleBuilder(list,context),
            ),
          ],
        ),
      );
      },
    );
  }
}
