import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/models/categories_model.dart';
import 'package:soskon/models/changet_favorites_model.dart';
import 'package:soskon/models/favorites_model.dart';
import 'package:soskon/models/home_model.dart';
import 'package:soskon/models/login_model.dart';
import 'package:soskon/modules/categories/cateogries.dart';
import 'package:soskon/modules/favorites/favorites.dart';
import 'package:soskon/modules/products/products.dart';
import 'package:soskon/modules/settings/settings.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/network/end_points.dart';
import 'package:soskon/shared/network/reomte/dio.dart';
part 'homelayout_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  // screens
  List<Widget> screens = const [
    Products(),
    Cateogries(),
    Favorites(),
    Setting(),
  ];

  // icons Bottom Nav Bar
  List<IconData> iconsBottonNav = [
    Icons.home_outlined,
    Icons.category_outlined,
    Icons.favorite_border_rounded,
    Icons.settings_outlined,
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeBottomNav());
  }

  // home data
  HomeModel? homeModel;
  Map<int, bool> favorites = {};
  void getHomeData() {
    emit(HomeLoadingState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value.data);

      for (ProductModel element in homeModel!.dataModel!.products) {
        favorites.addAll({element.id!: element.inFavorites!});
      }

      emit(HomeSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorState());
    });
  }

  /// list row home cateageies
  int currentIndexList = 0;
  void changeIndexList(int index) {
    currentIndexList = index;
    emit(HomeChangeBottomNav());
  }

  // catogries
  CategoriesModel? cateogriesModel;
  void getCatgories() {
    DioHelper.getData(
      url: CATEGORIES,
      token: token,
    ).then((value) {
      cateogriesModel = CategoriesModel.fromJson(value.data);

      emit(CategortesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(CategortesErrorState());
    });
  }

  // change favorites
  FavoritesChangeModel? favoritesChangeModel;
  void changeFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(ChangeFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      favoritesChangeModel = FavoritesChangeModel.fromJson(value.data);
      if (!favoritesChangeModel!.status!) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }
      emit(ChangeFavoritesSuccessState(favoritesChangeModel!));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;
      print(error.toString());
      emit(ChangeFavoritesErrorState());
    });
  }

  // get favorites
  FavoritesModel? favoritesModel;
  void getFavorites() {
    emit(GetFavoritesLoadingState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(GetFavoritesSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetFavoritesErrorState());
    });
  }

  // user data
  LoginModel? userModel;
  void getUser() {
    emit(UserDataLoadingState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = LoginModel.fromJson(value.data);

      emit(UserDataSuccessState(userModel!));
    }).catchError((error) {
      print(error.toString());
      emit(UserDataErrorState());
    });
  }
}
