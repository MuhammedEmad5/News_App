import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/web_view.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'constant.dart';

Widget defaultFormFiled(context,{
  required TextEditingController controller,
  required TextInputType keyBordType,
  required Function validator,
  required String labelText,
  required IconData prefix,
  ValueChanged<String>? onChanged,
})=>TextFormField(
  controller: controller,
  keyboardType: keyBordType,
  onChanged:onChanged,
  validator: (String? value ){return validator(value);},
  decoration: InputDecoration(
    labelText: labelText,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
    ),
    prefixIcon: Icon(
      prefix,
      color: mainColor,

    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
          color: secondColor
      ),
      borderRadius: BorderRadius.circular(18),
    ),
    enabledBorder: OutlineInputBorder(
        borderSide:const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(18)
    ),
    labelStyle:const TextStyle(color: Colors.grey,fontSize: 16),
  ),
  cursorColor: secondColor,
  cursorHeight: 20,
  style: Theme.of(context).textTheme.subtitle1,
);


Future<dynamic> navigatorTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context)=>widget,
    maintainState: false,
  ),
);


Widget newsItemBuilder(model,context,{isSearch=false})=>BuildCondition(
  condition: model.isNotEmpty,
  builder: (context)=>ListView.separated(
    physics:const BouncingScrollPhysics(),
    itemBuilder: (BuildContext context, int index) =>InkWell(
      onTap: (){
        navigatorTo(context, WebViewScreen(url: model[index]['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            model[index]['urlToImage']==null?Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border:Border.all(color: mainColor,width: 1)
              ),
              child: const Icon(Icons.error_outline,color: Colors.deepOrange),
            )
                :Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(model[index]['urlToImage']),
                    fit: BoxFit.cover,
                  )
              ),
            ),
            const SizedBox(width: 15,),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        model[index]['title'],
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    Text(
                      model[index]['publishedAt'],
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    separatorBuilder: (BuildContext context, int index)=> const SizedBox(height: 10,),
    itemCount: model.length,
  ),
  fallback:(context)=>isSearch?Container(): Center(
    child: JumpingText(
      'Loading...',
      style: Theme.of(context).textTheme.bodyText1!.copyWith(
          fontWeight: FontWeight.normal,
          color: Colors.deepOrange
      ),
    ),
  ) ,
);

