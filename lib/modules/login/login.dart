import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/layout/home_layout.dart';
import 'package:soskon/modules/login/cubit/login_cubit.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/local/get_storage.dart';
import 'package:soskon/shared/style/colors.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.loginModel.status!) {
              navOffAll(context: context, widget: const HomeLayout());
              Storagee().saveData(
                value: state.loginModel.data!.token,
                key: tokenKey,
              );
              token = state.loginModel.data!.token!;
            } else {
              showToast(
                msg: LoginCubit.get(context).loginModel.message!,
                status: ToastStatus.ERROR,
              );
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(
                        text: 'Welcome to',
                        color: kBlack,
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                      text(
                        text: 'SOSKO.',
                        color: kprimreColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 55,
                        fontFamily: 'Don',
                      ),
                      const SizedBox(height: 20),
                      textFormFiled(
                        filled: true,
                        controller: emailController,
                        label: 'Email address',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'email must be not empty';
                          }
                          return null;
                        },
                        type: TextInputType.emailAddress,
                        prefix: Icons.email,
                      ),
                      const SizedBox(height: 20),
                      textFormFiled(
                        onSubmitted: (v) {
                          if (formKey.currentState!.validate()) {
                            LoginCubit.get(context).userLogin(
                              email: emailController.text,
                              password: passController.text,
                            );
                          }
                        },
                        obscureText: LoginCubit.get(context).obsecureText,
                        filled: true,
                        controller: passController,
                        label: 'Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'password must be not empty';
                          }
                          return null;
                        },
                        type: TextInputType.visiblePassword,
                        prefix: Icons.lock,
                        suffix: IconButton(
                          splashRadius: 2,
                          onPressed: () {
                            LoginCubit.get(context).changObsecureText();
                          },
                          icon: Icon(
                            !LoginCubit.get(context).obsecureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: kGreyText,
                            size: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 100),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (_) => materialBotton(
                          width: double.infinity,
                          child: text(
                            text: 'LOGIN',
                            color: kWhite,
                            fontSize: 25,
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                    
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passController.text,
                              );
                            }
                          },
                        ),
                        // jemy@gmail.com
                        // ahmed.jamal@gmail.com
                        fallback: (_) => const Center(
                          child: CircularProgressIndicator(
                            color: kprimreColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          text(
                            text: "Don't have a accont ?",
                            color: kBlack,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: text(
                              text: 'Sing up',
                              color: kprimreColor,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
