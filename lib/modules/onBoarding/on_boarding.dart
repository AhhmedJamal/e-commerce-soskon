import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:soskon/models/onBoarding_model.dart';
import 'package:soskon/modules/login/login.dart';
import 'package:soskon/modules/onBoarding/cubit/onboarding_cubit.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/local/get_storage.dart';
import 'package:soskon/shared/style/colors.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pageController = PageController();

    void submitOnbording() {
      Storagee().saveData(
        key: onBoardingKey,
        value: true,
      );
      navOffAll(context: context, widget: const Login());
    }

    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {},
        builder: (context, state) {
          // OnboardingCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(height: 50),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextButton(
                      child: text(
                        text: 'SKIP',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kprimreColor,
                      ),
                      onPressed: () => submitOnbording(),
                    ),
                  ),
                  Center(
                    child: Column(
                      children: [
                        text(
                          text: 'SOSKO',
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: kprimreColor,
                        ),
                        const SizedBox(height: 2),
                        const Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'Welcome to',
                                style: TextStyle(
                                  color: kBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              TextSpan(
                                text: ' SOSKO ',
                                style: TextStyle(
                                  color: kprimreColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: "Let's shop tougher",
                                style: TextStyle(
                                  color: kBlack,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView.builder(
                      controller: pageController,
                      physics: const BouncingScrollPhysics(),
                      onPageChanged: (int index) {
                        OnboardingCubit.get(context).isLastfun(index: index);
                      },
                      itemBuilder: (_, index) => buildItems(
                        bording[index],
                      ),
                      itemCount: bording.length,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: padding16,
                        child: SmoothPageIndicator(
                          controller: pageController,
                          count: bording.length,
                          effect: ExpandingDotsEffect(
                            dotColor: kBlack.withOpacity(0.5),
                            activeDotColor: kprimreColor,
                            dotHeight: 10,
                            dotWidth: 10,
                            spacing: 5,
                            expansionFactor: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (OnboardingCubit.get(context).isLast) {
                  submitOnbording();
                } else {
                  pageController.nextPage(
                    duration: const Duration(milliseconds: 750),
                    curve: Curves.fastLinearToSlowEaseIn,
                  );
                }
              },
              child: Icon(
                OnboardingCubit.get(context).isLast == true
                    ? Icons.check_sharp
                    : Icons.arrow_forward_ios_rounded,
                size: 20,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildItems(BordingModel model) => Column(
        children: [
          Lottie.asset(
            model.image,
          ),
          text(
            text: model.title,
            fontSize: 20,
            color: kBlack,
          ),
          const SizedBox(
            height: 2,
          ),
          text(
            text: model.subTitle,
            fontSize: 15,
            color: kBlack,
          ),
        ],
      );
}
