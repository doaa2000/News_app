import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/news_app/web_view/web_view_screen.dart';
import 'package:news_app/shared/components/conditional.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Function buttonfunction=(){};
Function validate=(){};
Function TextButtonFunction=(){};
String text="";
Function ontap=(){};
Function onchanged=(){};
Widget dafaultButton
    ({
 required double width,
  required Color background,
  required  buttonfunction,
  required text,


})
{
return Container(
width: width,
  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0),color:background),
  child: MaterialButton(
    onPressed: buttonfunction,
    child: Text(text.toUpperCase(),style:TextStyle(color: Colors.white)),
  ),
);

}
Widget defaultformfield(
{
 required TextEditingController controller,
  required validate,
  IconData ?suffix,
  required IconData prefixicon,
  required String label,
  TextInputType ?type,
  ontap,onchanged,
}
    )
{
  return   TextFormField(

    validator: validate,
    controller:controller,
onChanged: onchanged,
onTap: ontap,
keyboardType: type,
    decoration: InputDecoration(

      border: OutlineInputBorder(borderRadius: BorderRadius.circular(50.0)),
      labelText: label,
      suffixIcon: Icon(suffix),
      prefixIcon: Icon(prefixicon),
    ),

  );

}
Widget defaultTextButton({
  required TextButtonFunction,
  required String text,
})
{
  return TextButton(onPressed:TextButtonFunction , child: Text(text));
}

     


 
Widget MyDivider()=>   Padding(
  padding: const EdgeInsets.all(8.0),
  child:   Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
Widget buildArticleItem(article,context)=>InkWell(
  onTap: ()
  {
    navigateTo(context, WebViewScreen(article['url']));
  },
  child:   Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(

      children: [
        Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${article['urlToImage']}'),
            ),
          ),
        ),
        SizedBox(width: 20.0,),
        Expanded(
          child: Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(

                    child: Text('${article['title']} ',
                      style:Theme.of(context).textTheme.bodyText1,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    )
                ),
                Text('${article['publishedAt']}',style: TextStyle(color: Colors.grey),)
              ],
            ),
          ),
        ),
      ],
    ),
  ),
);
Widget articleBuilder(list,context)=>ConditionalBuilder
  (
  condition:list.length>0,
  builder:(context)=> ListView.separated
    (
    physics: BouncingScrollPhysics(),
    itemBuilder:(context,index)=>buildArticleItem(list[index],context) ,
    separatorBuilder:(context,index)=>MyDivider() ,
    itemCount:10,
    ),
  fallback:(context)=> Center(child: CircularProgressIndicator()) ,
);
void navigateTo(context,widget)=>Navigator.push(context,
    MaterialPageRoute(builder:(context)=>widget
    ));
void navigateAndFinish(context,widget)
{
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget),
          (route) => false);
}