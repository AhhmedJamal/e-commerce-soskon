import 'package:flutter/material.dart';

///Padings
EdgeInsets padding8 = const EdgeInsets.all(8);
EdgeInsets padding16 = const EdgeInsets.all(16);
EdgeInsets padding24 = const EdgeInsets.all(24);
EdgeInsets paddingH8 = const EdgeInsets.symmetric(horizontal: 8);
EdgeInsets paddingH16 = const EdgeInsets.symmetric(horizontal: 16);
EdgeInsets paddingH24 = const EdgeInsets.symmetric(horizontal: 24);
EdgeInsets paddingV8 = const EdgeInsets.symmetric(vertical: 8);
EdgeInsets paddingV16 = const EdgeInsets.symmetric(vertical: 16);
EdgeInsets paddingV24 = const EdgeInsets.symmetric(vertical: 24);

///Borders
BorderRadius circular4 = const BorderRadius.all(Radius.circular(4));
BorderRadius circular8 = const BorderRadius.all(Radius.circular(8));
BorderRadius circular12 = const BorderRadius.all(Radius.circular(12));
BorderRadius circular16 = const BorderRadius.all(Radius.circular(16));

String token = '';

String isDarkKey = 'dark';
String tokenKey = 'token';
String onBoardingKey = 'boarding';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}
