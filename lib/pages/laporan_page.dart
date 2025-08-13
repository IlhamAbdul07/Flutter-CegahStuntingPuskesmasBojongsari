import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:stunting_web/widgets/drawer_menu.dart';
import 'package:stunting_web/widgets/header.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: ScaffoldKey,
          endDrawer: DrawerMenu(),
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Header(
                onLogoTap: () {},
                onMenuTap: () {
                  ScaffoldKey.currentState?.openEndDrawer();
                },
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
