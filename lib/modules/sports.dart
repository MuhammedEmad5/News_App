import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components.dart';

class Sports extends StatelessWidget {
  const Sports({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var model=NewsCubit.get(context).sports;
          return newsItemBuilder(model, context);
        }
    );
  }
}
