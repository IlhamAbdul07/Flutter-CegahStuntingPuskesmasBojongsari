import 'package:flutter/material.dart';
// import 'package:stunting_web/constants/colors.dart';
import 'package:stunting_web/constants/nav_items.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: ListView(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 20.0,
                bottom: 20.0,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ),
          ),
          for (int i = 0; i < navIcons.length; i++)
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
              titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              onTap: () {
                // Navigasi berdasarkan item yang dipilih
                if (navTitles[i] == "Beranda") {
                  Navigator.pushNamed(context, '/');
                } else if (navTitles[i] == "Survey Stunting") {
                  Navigator.pushNamed(context, '/survey');
                } else if (navTitles[i] == "Laporan") {
                  Navigator.pushNamed(context, '/laporan');
                } else if (navTitles[i] == "Log Out") {
                  // Tambahkan logika untuk log out jika diperlukan
                }
              },
              leading: Icon(navIcons[i], color: Colors.white),
              title: Text(navTitles[i]),
            ),
        ],
      ),
    );
  }
}
