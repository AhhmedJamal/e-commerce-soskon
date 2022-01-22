import 'package:flutter/material.dart';
import 'package:soskon/shared/components/components.dart';
import 'package:soskon/shared/style/colors.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: text(
          text: 'Search',
          color: kBlack,
        ),
      ),
    );
  }
}
