import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/models/onBoarding_model.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit get(context) => BlocProvider.of(context);

  var isLast = false;

  void isLastfun({required int index}) {
    if (index == bording.length - 1) {
      isLast = true;
    } else {
      isLast = false;
    }
    emit(OnboardingIsLast(isLast));
  }
}
