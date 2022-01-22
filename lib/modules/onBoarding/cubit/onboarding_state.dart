part of 'onboarding_cubit.dart';

@immutable
abstract class OnboardingState {}

class OnboardingInitial extends OnboardingState {}

class OnboardingIsLast extends OnboardingState {
  final bool isLast;

  OnboardingIsLast(this.isLast);
}
