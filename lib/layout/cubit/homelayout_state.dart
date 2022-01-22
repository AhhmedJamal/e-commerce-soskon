part of 'homelayout_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

// home BottomNav stste
class HomeChangeBottomNav extends HomeState {}

// changeListHome stste
class HomeChangeListHome extends HomeState {}

// loadingState stste
class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {}

class HomeErrorState extends HomeState {}

// categortes stste
class CategortesSuccessState extends HomeState {}

class CategortesErrorState extends HomeState {}

//change favorites stste
class ChangeFavoritesState extends HomeState {}

class ChangeFavoritesSuccessState extends HomeState {
  final FavoritesChangeModel model;

  ChangeFavoritesSuccessState(this.model);
}

class ChangeFavoritesErrorState extends HomeState {}

// favorites stste
class GetFavoritesLoadingState extends HomeState {}

class GetFavoritesSuccessState extends HomeState {}

class GetFavoritesErrorState extends HomeState {}

//user data stste
class UserDataLoadingState extends HomeState {}

class UserDataSuccessState extends HomeState {
 final LoginModel loginModel;

  UserDataSuccessState(this.loginModel);
}

class UserDataErrorState extends HomeState {}
