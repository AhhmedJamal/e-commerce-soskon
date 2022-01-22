import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shimmer/shimmer.dart';
import 'package:soskon/modules/login/login.dart';
import 'package:soskon/shared/components/constents.dart';
import 'package:soskon/shared/local/get_storage.dart';
import 'package:soskon/shared/style/colors.dart';

// text
Widget text({
  required String text,
  Color? color,
  double? fontSize,
  FontWeight? fontWeight,
  String? fontFamily,
  int? maxLines,
  TextOverflow? textOverflow,
  TextDecoration? decoration,
  TextAlign? textAlign,
}) =>
    Text(
      text,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
    );

// text form filed

Widget textFormFiled({
  required TextEditingController controller,
  required String label,
  required String? Function(String? v) validator,
  required TextInputType type,
  required IconData prefix,
  Widget? suffix,
  bool? filled,
  bool obscureText = false,
  Function(String)? onSubmitted,
  Function(String)? onChanged,
}) {
  return TextFormField(
    cursorColor: kprimreColor,
    controller: controller,
    validator: validator,
    onChanged: onChanged,
    keyboardType: type,
    onFieldSubmitted: onSubmitted,
    cursorWidth: 2,
    obscureText: obscureText,
    style: const TextStyle(
      color: kBlack,
    ),
    decoration: InputDecoration(
      fillColor: kGreyBackground,
      filled: filled,
      labelText: label,
      labelStyle: const TextStyle(color: kGreyText),
      prefixIcon: Icon(
        prefix,
        color: kGreyText,
      ),
      suffixIcon: suffix,
      enabledBorder: OutlineInputBorder(
          borderRadius: circular12,
          borderSide: const BorderSide(
            color: kGreyText,
          )),
      focusedBorder: OutlineInputBorder(
        borderRadius: circular12,
        borderSide: const BorderSide(
          color: kprimreColor,
          width: 2,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: circular12,
        borderSide: const BorderSide(
          color: Colors.red,
        ),
      ),
    ),
  );
}

// material botton
Widget materialBotton({
  required dynamic child,
  double? width,
  required VoidCallback onPressed,
  double? fontSize,
  Color color = kprimreColor,
}) =>
    Material(
      color: color,
      borderRadius: circular16,
      child: MaterialButton(
        minWidth: width,
        height: 50,
        onPressed: onPressed,
        child: child,
      ),
    );

// flutter toast
void showToast({
  required String msg,
  required ToastStatus status,
}) =>
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      textColor: kWhite,
      backgroundColor: chooseToastColor(status),
      fontSize: 16,
    );

// ignore: constant_identifier_names
enum ToastStatus { SUCCESS, ERROR, WARNIND }

Color chooseToastColor(ToastStatus toastStatus) {
  Color color;
  switch (toastStatus) {
    case ToastStatus.SUCCESS:
      color = Colors.green;
      break;
    case ToastStatus.ERROR:
      color = Colors.red;
      break;
    case ToastStatus.WARNIND:
      color = Colors.amber;
      break;
  }
  return color;
}

// drawer botton
Widget drawer(BuildContext context, globalKey) => MaterialButton(
      minWidth: 0,
      padding: EdgeInsetsDirectional.zero,
      child: const Image(
        width: 30,
        color: kprimreColor,
        image: AssetImage(
          'assets/images/list.png',
        ),
      ),
      onPressed: () {
        globalKey.currentState!.openDrawer();
      },
    );

// home loading Shemmer
Widget homeloadingShemmer() {
  return SingleChildScrollView(
    physics: const BouncingScrollPhysics(),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Shimmer.fromColors(
        period: const Duration(milliseconds: 900),
        baseColor: kGreyBackground,
        highlightColor: kWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: itemShimmer(
                width: double.infinity,
                height: 190,
              ),
            ),
            const SizedBox(height: 25),
            itemShimmer(
              width: 120,
              height: 30,
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                itemShimmer(
                  width: 60,
                  height: 30,
                ),
                const Spacer(),
                itemShimmer(
                  width: 60,
                  height: 30,
                ),
                const Spacer(),
                itemShimmer(
                  width: 60,
                  height: 30,
                ),
                const Spacer(),
                itemShimmer(
                  width: 60,
                  height: 30,
                ),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                itemShimmer(
                  width: 100,
                  height: 25,
                ),
                const Spacer(),
                itemShimmer(
                  width: 60,
                  height: 20,
                ),
              ],
            ),
            const SizedBox(height: 15),
            GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 1 / 1.5,
              children: List.generate(
                6,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      itemShimmer(
                        width: double.infinity,
                        height: 160,
                      ),
                      const SizedBox(height: 10),
                      itemShimmer(
                        width: 100,
                        height: 15,
                      ),
                      const SizedBox(height: 10),
                      itemShimmer(
                        width: 60,
                        height: 15,
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: paddingH8,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            itemShimmer(
                              borderRadius: circular4,
                              width: 30,
                              height: 25,
                            ),
                            itemShimmer(
                              borderRadius: circular4,
                              width: 30,
                              height: 25,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget itemShimmer({
  required double width,
  required double height,
  BorderRadiusGeometry? borderRadius,
}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      color: kGreyBackground,
      borderRadius: borderRadius,
    ),
  );
}

// navigator push
void navTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

// navigator push and remove until
void navOffAll({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => widget),
      (route) => false,
    );

// sign out account
void logOut(BuildContext context) {
  Storagee().removeToken(key: tokenKey);
  navOffAll(context: context, widget: const Login());
}

// divider
Widget divider() => const Divider(
      height: 20,
      thickness: 1.2,
    );
