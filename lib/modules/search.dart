import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/cubit.dart';
import 'package:news_app/layout/states.dart';
import 'package:news_app/shared/components.dart';

class Search extends StatelessWidget {

  TextEditingController searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (BuildContext context, state) {  },
      builder: (BuildContext context, Object? state) {
        var model=NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              padding: const EdgeInsetsDirectional.only(start: 20,top: 6),
                onPressed: (){
                  Navigator.pop(context);
                },
                icon:const Icon(
                  Icons.arrow_back_ios,
                )
            ),
            title:const Text('search'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Container(
                  child: defaultFormFiled(
                      context,
                      controller: searchController,
                      keyBordType: TextInputType.name,
                      validator: (String value){
                        if(value.isEmpty) {
                          return 'Please enter any word';
                        }
                      },
                      onChanged: (value){
                        NewsCubit.get(context).getSearch(value: value);
                      },
                      labelText: 'search',
                      prefix: Icons.search
                  ),
                ),
                Expanded(
                    child: newsItemBuilder(model, context,isSearch: true)
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
