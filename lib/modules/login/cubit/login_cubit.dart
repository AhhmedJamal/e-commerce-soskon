import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:soskon/models/login_model.dart';
import 'package:soskon/shared/network/end_points.dart';
import 'package:soskon/shared/network/reomte/dio.dart';

part 'login_state.dart';

// ahmed.jamal@gmail.com
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obsecureText = false;
  void changObsecureText() {
    obsecureText = !obsecureText;
    emit(LoginChanngObsecure());
  }

  late LoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(LoginSuccessState(loginModel));
    }).catchError((error) {
      // ignore: avoid_print
      print(error.toString());
      emit(LoginErrorState(error.toString()));
    });
  }
}
