import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/modules/cart/cart.dart';
import 'package:soskon/modules/search/search.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/style/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var keyScaffold = GlobalKey<ScaffoldState>();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: keyScaffold,
          appBar: AppBar(
            leading: drawer(context, keyScaffold),
            centerTitle: true,
            title: text(
              fontFamily: 'Don',
              text: 'SOSKO',
              color: kprimreColor,
              fontSize: 43,
            ),
            actions: [
              IconButton(
                iconSize: 30,
                onPressed: () {
                  navTo(
                    context: context,
                    widget: const Search(),
                  );
                },
                icon: const Icon(Icons.search),
              )
            ],
          ),
          body: HomeCubit.get(context)
              .screens[HomeCubit.get(context).currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar(
            icons: HomeCubit.get(context).iconsBottonNav,
            gapLocation: GapLocation.center,
            activeColor: kprimreColor,
            inactiveColor: kGreyText,
            notchSmoothness: NotchSmoothness.defaultEdge,
            leftCornerRadius: 30,
            rightCornerRadius: 30,
            activeIndex: HomeCubit.get(context).currentIndex,
            onTap: (index) => HomeCubit.get(context).changeIndex(index),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              navTo(context: context, widget: const Cart());
            },
            child: const Icon(Icons.shopping_bag_outlined),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        );
      },
    );
  }
}
