import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_web/widgets/drawer_menu.dart';
import 'package:stunting_web/widgets/header.dart';
import 'package:stunting_web/widgets/home_widget.dart';
import 'package:stunting_web/widgets/laporan_widget.dart';
import 'package:stunting_web/widgets/survey_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Widget currentWidget;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    currentWidget = HomeWidget();
  }

  void onMenuItemSelected(String menuName) {
    setState(() {
      if (menuName == 'Beranda') {
        currentWidget = HomeWidget();
      } else if (menuName == 'Survey') {
        currentWidget = SurveyWidget();
      } else if (menuName == 'Laporan') {
        currentWidget = LaporanWidget();
      } else if (menuName == 'Log Out') {
        _clearLoginStatus();
        Future.delayed(Duration(milliseconds: 500), () {
          Navigator.pushReplacementNamed(context, '/login');
        });
      } else {
        Text("error");
      }
    });
  }

  Future<void> _clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('expirationTime');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Header(
          onMenuTap: () {
            _scaffoldKey.currentState?.openEndDrawer();
          },
        ),
      ),
      endDrawer: DrawerMenu(onMenuItemSelected: onMenuItemSelected),
      body: currentWidget,
    );
  }
}
