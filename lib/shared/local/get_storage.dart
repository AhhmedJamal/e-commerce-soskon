import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soskon/layout/home_layout.dart';
import 'package:soskon/modules/login/login.dart';
import 'package:soskon/modules/onBoarding/on_boarding.dart';
import 'package:soskon/shared/components/constents.dart';

class Storagee {
  // ignore: non_constant_identifier_names
  var box_storage = GetStorage();

  /// take data and save it to storage
  void saveData({
    required dynamic value,
    required String key,
  }) {
    box_storage.write(key, value);
  }

  bool getOnBoarding({required String key}) {
    return box_storage.read(key) ?? false;
  }

  String getToken({required String key}) {
    return box_storage.read(key) ?? '';
  }

  /// change theme mode
  bool getIsDark() {
    return box_storage.read(isDarkKey) ?? false;
  }

  ThemeMode getMode() {
    return getIsDark() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode() {
    getIsDark() ? ThemeMode.light : ThemeMode.dark;
    saveData(value: !getIsDark(), key: isDarkKey);
  }

  /// change page view
  Widget changePage() {
    Widget widget;
    bool onBording = Storagee().getOnBoarding(key: onBoardingKey);
    token = Storagee().getToken(key: tokenKey);

    if (onBording == true) {
      // ignore: unnecessary_null_comparison
      if (token != '') {
        widget = const HomeLayout();
      } else {
        widget = const Login();
      }
    } else {
      widget = const OnBoarding();
    }
    return widget;
  }

  void removeToken({required String key}) {
    box_storage.remove(key);
  }
}
