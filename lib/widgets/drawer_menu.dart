import 'package:flutter/material.dart';
import 'package:stunting_web/constants/nav_items.dart';

class DrawerMenu extends StatefulWidget {
  final Function(String) onMenuItemSelected;
  const DrawerMenu({super.key, required this.onMenuItemSelected});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
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
                widget.onMenuItemSelected(navTitles[i]);
                Navigator.pop(context);
              },
              leading: Icon(navIcons[i], color: Colors.white),
              title: Text(navTitles[i]),
            ),
        ],
      ),
    );
  }
}
