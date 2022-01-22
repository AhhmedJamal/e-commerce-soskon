import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/models/categories_model.dart';
import 'package:soskon/models/home_model.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/style/colors.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ChangeFavoritesSuccessState) {
          if (!state.model.status!) {
            showToast(
              msg: state.model.message.toString(),
              status: ToastStatus.ERROR,
            );
          }
        }
      },
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).homeModel != null &&
              HomeCubit.get(context).cateogriesModel != null,
          builder: (_) => productItems(HomeCubit.get(context).homeModel!,
              context, HomeCubit.get(context).cateogriesModel!),
          fallback: (_) => homeloadingShemmer(),
        );
      },
    );
  }
}

Widget productItems(
        HomeModel model, BuildContext context, CategoriesModel categries) =>
    SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CarouselSlider(
            items: model.dataModel!.banners
                .map(
                  (e) => Image(
                    image: NetworkImage('${e.image}'),
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            options: CarouselOptions(
              height: 200,
              initialPage: 0,
              // viewportFraction: 1.0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(seconds: 1),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: paddingH16,
            child: text(
              fontFamily: 'Don',
              text: 'Categories',
              fontSize: 32,
              color: kBlack,
            ),
          ),
          Container(
            margin: padding16,
            height: 30,
            child: ListView.separated(
              separatorBuilder: (_, index) => const SizedBox(width: 20),
              scrollDirection: Axis.horizontal,
              itemCount: categries.data!.data!.length,
              itemBuilder: (_, index) => GestureDetector(
                onTap: () {
                  HomeCubit.get(context).changeIndexList(index);
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: paddingH8,
                  decoration: BoxDecoration(
                    color: index == HomeCubit.get(context).currentIndexList
                        ? kprimreColor
                        : kGreyBackground,
                    borderRadius: circular8,
                  ),
                  child: text(
                    fontFamily: 'Don',
                    maxLines: 1,
                    textOverflow: TextOverflow.ellipsis,
                    text: categries.data!.data![index].name!,
                    fontSize: 22,
                    color: index == HomeCubit.get(context).currentIndexList
                        ? kWhite
                        : kBlack,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: paddingH16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  fontFamily: 'Don',
                  text: 'New Products',
                  fontSize: 35,
                  color: kBlack,
                ),
                TextButton(
                  onPressed: () {},
                  child: text(
                    text: 'ShowAll',
                    fontSize: 15,
                    color: kprimreColor,
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: paddingH8,
            color: kGreyBackground,
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.6,
              children: List.generate(
                model.dataModel!.products.length,
                (index) => buildGridProduct(
                  model.dataModel!.products[index],
                  context,
                ),
              ),
            ),
          ),
        ],
      ),
    );

Widget buildGridProduct(ProductModel model, BuildContext context) => Container(
      color: kWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                height: 170,
                width: double.infinity,
                image: NetworkImage(
                  '${model.image}',
                ),
              ),
              if (model.discount != 0)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: circular4,
                  ),
                  child: text(
                    text: 'DISCOUNt',
                    fontSize: 10,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: paddingH8,
            child: text(
              text: '${model.name}',
              fontSize: 14,
              color: kBlack,
              maxLines: 2,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              text(
                text: '\$${model.price}',
                fontSize: 14,
                color: kprimreColor,
                maxLines: 2,
                textOverflow: TextOverflow.ellipsis,
              ),
              const SizedBox(width: 15),
              if (model.discount != 0)
                text(
                  text: '\$${model.oldPrice}',
                  fontSize: 14,
                  color: kBlack,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                  decoration: TextDecoration.lineThrough,
                ),
            ],
          ),
          Padding(
            padding: paddingH8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                    color: kprimreColor,
                    borderRadius: circular8,
                  ),
                  child: IconButton(
                    iconSize: 16,
                    color: kWhite,
                    onPressed: () {},
                    icon: const Icon(Icons.add_shopping_cart),
                  ),
                ),
                IconButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    HomeCubit.get(context).changeFavorites(model.id!);
                  },
                  icon: CircleAvatar(
                    backgroundColor:
                        HomeCubit.get(context).favorites[model.id!]!
                            ? Colors.redAccent
                            : kGreyText,
                    radius: 16,
                    child: const Icon(
                      Icons.favorite_border,
                      size: 16,
                      color: kWhite,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
