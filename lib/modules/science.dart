import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../layout/cubit.dart';
import '../layout/states.dart';
import '../shared/components.dart';

class Science extends StatelessWidget {
  const Science({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
        listener: (BuildContext context, state) {  },
        builder: (BuildContext context, Object? state) {
          var model=NewsCubit.get(context).science;
          return newsItemBuilder(model, context);
        }
    );
  }
}
