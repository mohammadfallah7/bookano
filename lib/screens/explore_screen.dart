import 'package:bookano/widgets/categories.dart';
import 'package:bookano/widgets/category_books.dart';
import 'package:bookano/widgets/my_page_view.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: MyPageView(
              useTheme: useTheme,
              onTap: () {},
              aspectRatio: 2.1,
            ),
          ),
          SliverToBoxAdapter(
            child: Categories(useTheme: useTheme),
          ),
          CategoryBooks(
            useTheme: useTheme,
            onTap: (data) {},
          ),
        ],
      ),
    );
  }
}
