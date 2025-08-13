import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:stunting_web/widgets/drawer_menu.dart';
import 'package:stunting_web/widgets/header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
