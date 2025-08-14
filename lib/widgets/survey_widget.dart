import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.whiteSecondary,
                child: Text("INI SURVEY PAGE", style: TextStyle(fontSize: 50)),
              ),
              Container(
                width: double.infinity,
                height: 250.0,
                color: CustomColor.greenMain,
              ),
            ],
          ),
        );
      },
    );
  }
}
