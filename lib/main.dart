import 'package:bookano/logic/provider/bottom_nav_provider.dart';
import 'package:bookano/logic/provider/category_titles_provider.dart';
import 'package:bookano/root_screen.dart';
import 'package:bookano/themes/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(
    MultiProvider(
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<BottomNavProvider>(
          create: (context) => BottomNavProvider(),
        ),
        ChangeNotifierProvider<CategoryTitlesProvider>(
          create: (context) => CategoryTitlesProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bookano',
      theme: AppThemeColor.lightTheme,
      home: const RootScreen(),
    );
  }
}
