import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:soskon/bloc_observer.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/shared/local/get_storage.dart';
import 'package:soskon/shared/network/reomte/dio.dart';
import 'package:soskon/shared/style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {},
    blocObserver: MyBlocObserver(),
  );

  // runApp(DevicePreview(
  //   enabled: !kReleaseMode,
  //   builder: (_) => MyApp(startWidget: widget),
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit()
            ..getHomeData()
            ..getCatgories()
            ..getFavorites()
            ..getUser(),
        ),
      ],
      child: MaterialApp(
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: 'SOSKO',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.light,
        home: Storagee().changePage(),
      ),
    );
  }
}
