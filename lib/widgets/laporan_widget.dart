import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';

class LaporanWidget extends StatefulWidget {
  const LaporanWidget({super.key});

  @override
  State<LaporanWidget> createState() => _LaporanWidgetState();
}

class _LaporanWidgetState extends State<LaporanWidget> {
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
                height: 250.0,
                color: CustomColor.greenMain,
                child: Text(
                  "INI LAPORAN PAGES",
                  style: TextStyle(fontSize: 25),
                ),
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
