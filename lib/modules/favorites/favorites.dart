import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/models/favorites_model.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/style/colors.dart';

class Favorites extends StatelessWidget {
  const Favorites({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: HomeCubit.get(context).favoritesModel != null,
          
          builder: (_) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, index) => buildFav(
              HomeCubit.get(context).favoritesModel!.data!.data[index].product!,
              context,
            ),
            separatorBuilder: (_, index) => divider(),
            itemCount: HomeCubit.get(context).favoritesModel!.data!.data.length,
          ),
          fallback: (_) {
            return Center(
              child: LottieBuilder.asset(
                'assets/images/no-data.json',
              ),
            );
          },
        );
      },
    );
  }

  Widget buildFav(Product product, BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: NetworkImage(product.image!),
                width: 120,
                height: 120,
              ),
              if (product.discount != 0)
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 180,
                child: text(
                  text: product.name!,
                  fontSize: 14,
                  color: kBlack,
                  maxLines: 2,
                  textOverflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  text(
                    text: '\$${product.price.toString()}',
                    fontSize: 14,
                    color: kprimreColor,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(width: 15),
                  if (product.discount != 0)
                    text(
                      text: '\$${product.oldPrice.toString()}',
                      fontSize: 14,
                      color: kBlack,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      decoration: TextDecoration.lineThrough,
                    ),
                ],
              )
            ],
          ),
          Padding(
            padding: paddingH8,
            child: Column(
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
                const SizedBox(height: 20),
                IconButton(
                  color: Colors.redAccent,
                  onPressed: () {
                    HomeCubit.get(context).changeFavorites(product.id!);
                  },
                  icon: CircleAvatar(
                    backgroundColor:
                        HomeCubit.get(context).favorites[product.id!]!
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
      );
}
