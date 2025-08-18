import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_web/constants/dialog_item.dart';
import 'package:stunting_web/styles/style.dart';
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
  int currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> pages = const [
    HomeWidget(),
    SurveyWidget(),
    LaporanWidget(),
    const Text("error"),
  ];

  @override
  void initState() {
    super.initState();
  }

  void confirmLogout() async {
    final confirm = await DialogItem.showDialogLogout(
      context: context,
      title: "Logout",
      message: "Apakah Anda Yakin Ingin Keluar ?",
      confirmButtonText: "Ya, Keluar",
      cancelButtonText: "Batal",
    );

    if (confirm == true) {
      try {
        await _clearLoginStatus();
        Future.delayed(Duration(milliseconds: 500), () {
          if (!mounted) return;
          Navigator.pushReplacementNamed(context, '/');
        });
      } on Exception catch (e) {
        General.showSnackBar(context, "Failed Log Out: $e");
      }
    }
  }

  void onMenuItemSelected(String menuName) {
    if (menuName == 'Beranda') {
      setState(() => currentIndex = 0);
    } else if (menuName == 'Survey') {
      setState(() => currentIndex = 1);
    } else if (menuName == 'Laporan') {
      setState(() => currentIndex = 2);
    } else if (menuName == 'Log Out') {
      Future.delayed(const Duration(milliseconds: 200), () {
        confirmLogout();
      });
    } else {
      setState(() => currentIndex = 3);
    }
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
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }
}
