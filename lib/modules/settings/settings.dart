import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soskon/layout/cubit/homelayout_cubit.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/style/colors.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var emailController = TextEditingController();
    var phoneController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var model = HomeCubit.get(context).userModel;
        nameController.text = model!.data!.name!;
        emailController.text = model.data!.email!;
        phoneController.text = model.data!.phone!;
        return ConditionalBuilder(
          condition: HomeCubit.get(context).userModel != null,
          builder: (_) => SingleChildScrollView(
            child: Container(
              padding: padding24,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                    text: 'Photo',
                    color: kBlack,
                    fontFamily: 'Don',
                    fontSize: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: kprimreColor,
                            radius: 40,
                            child: IconButton(
                              splashRadius: 50,
                              color: kWhite,
                              iconSize: 50,
                              onPressed: () {},
                              icon: const Icon(
                                Icons.person,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: text(
                              text: 'add photo',
                              color: kprimreColor,
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      text(
                        text: 'Name',
                        color: kBlack,
                        fontSize: 30,
                        fontFamily: 'Don',
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250,
                        child: textFormFiled(
                          controller: nameController,
                          label: '',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name must be not empty';
                            }
                          },
                          type: TextInputType.name,
                          prefix: Icons.person,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      text(
                        text: 'Email',
                        color: kBlack,
                        fontSize: 30,
                        fontFamily: 'Don',
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250,
                        child: textFormFiled(
                          controller: emailController,
                          label: '',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email must be not empty';
                            }
                          },
                          type: TextInputType.emailAddress,
                          prefix: Icons.email,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      text(
                        text: 'Phone',
                        color: kBlack,
                        fontSize: 30,
                        fontFamily: 'Don',
                      ),
                      const Spacer(),
                      SizedBox(
                        width: 250,
                        child: textFormFiled(
                          controller: phoneController,
                          label: '',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone must be not empty';
                            }
                          },
                          type: TextInputType.phone,
                          prefix: Icons.phone,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  materialBotton(
                    width: double.infinity,
                    child: text(
                      text: 'LOG OUT',
                      color: kWhite,
                      fontSize: 18,
                    ),
                    onPressed: () {
                      logOut(context);
                    },
                  ),
                  const SizedBox(height: 15),
                  materialBotton(
                    color: kGreyText,
                    width: double.infinity,
                    child: text(
                      text: 'UP DATE',
                      color: kWhite,
                      fontSize: 18,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          fallback: (_) => const Center(
            child: SizedBox(
              width: 100,
              child: LinearProgressIndicator(
                color: kprimreColor,
                backgroundColor: kGreyBackground,
              ),
            ),
          ),
        );
      },
    );
  }
}
