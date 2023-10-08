import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsCubit.dart';
import 'package:untitled/layout/News%20App/Cubit/NewsState.dart';
import 'package:untitled/shared/BuildBusinessitem/BuildBusinessItem.dart';

import '../../shared/articleBuilder/articlebuilder.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = context.read<NewsCubit>();
        List list = NewsCubit.get(context).business;
        return ScreenTypeLayout(
          mobile: Builder(
            builder: (context) {
              cubit.ChangePlatform(false);
              return ArticleBuilder(list, context);
            }
          ),
          desktop: Builder(
            builder: (context) {
              cubit.ChangePlatform(true);
              return Row(
                children: [
                  Expanded(child: ArticleBuilder(list, context)),
                  if (cubit.business.length > 0&&cubit.isDesktop)
                    Expanded(
                        child: Container(
                      color: Colors.grey[200],
                      height: double.infinity,
                      child: Text(
                        '${cubit.business[cubit.selectedItem]['description']}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ))
                ],
              );
            }
          ),
          breakpoints: ScreenBreakpoints(
            watch: 300,
            tablet: 600,
            desktop: 750,
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
