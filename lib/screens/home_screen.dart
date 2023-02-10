import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import 'screen_exports.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = const [
    CreateScanScreen(),
    RecentScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: (height * 0.020),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 16.0,
                color:
                    const Color.fromARGB(255, 194, 200, 244).withOpacity(0.30),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            ),
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              currentIndex: _currentIndex,
              selectedItemColor: const Color(0xFF6565FF),
              unselectedItemColor: const Color.fromARGB(255, 194, 200, 244),
              showUnselectedLabels: true,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.edit2Outline),
                  label: "Create QR",
                ),
                // BottomNavigationBarItem(
                //   icon: Icon(Icons.qr_code_scanner_outlined),
                //   label: "Scan QR",
                // ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.clockOutline),
                  label: "Recent",
                ),
                BottomNavigationBarItem(
                  icon: Icon(EvaIcons.settings2Outline),
                  label: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
