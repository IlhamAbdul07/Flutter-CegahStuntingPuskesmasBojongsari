import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.whiteSecondary,
              ),
              Container(
                width: double.infinity,
                height: 250.0,
                color: CustomColor.greenMain,
              ),
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.bgSecondary,
              ),
            ],
          ),
        );
      },
    );
  }
}
