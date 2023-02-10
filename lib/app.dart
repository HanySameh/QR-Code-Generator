import 'package:flutter/material.dart';

import 'configs/routes.dart';
import 'screens/screen_exports.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QR Generator',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialRoute: Routes.homeScreen,
      routes: {
        Routes.homeScreen: (context) => const HomeScreen(),
        Routes.createQrWebsite: (context) => const CreateWebQrScreen(),
        Routes.recentQrScreen: (context) => const RecentQrScreen(),
      },
    );
  }
}
