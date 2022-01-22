import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/models/categories_model.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/style/colors.dart';

class Cateogries extends StatelessWidget {
  const Cateogries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).cateogriesModel!.data!.data != null,
          builder: (_) => ListView.separated(
            itemBuilder: (_, index) => buildCategoriteyItems(
              HomeCubit.get(context).cateogriesModel!.data!.data![index],
            ),
            separatorBuilder: (_, index) => divider(),
            itemCount:
                HomeCubit.get(context).cateogriesModel!.data!.data!.length,
          ),
          fallback: (BuildContext context) => const Center(
            child: LinearProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget buildCategoriteyItems(DataModel model) => Padding(
        padding: paddingH24,
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                FadeInImage.assetNetwork(
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  placeholder: 'assets/images/placeholder.gif',
                  image: model.image!,
                ),
                Container(
                  width: 100,
                  color: kBlack.withOpacity(0.5),
                  child: text(
                    textAlign: TextAlign.center,
                    text: model.name!,
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    fontSize: 16,
                    color: kWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 20),
            text(text: 'Title'),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      );
}
