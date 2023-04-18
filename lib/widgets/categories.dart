import 'package:bookano/widgets/category_titles.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.useTheme});

  final ThemeData useTheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 24, top: 17, bottom: 5),
          child: Text(
            'Categories',
            style: useTheme.textTheme.headlineSmall!
                .apply(color: useTheme.colorScheme.secondary),
          ),
        ),
        CategoryTitles(useTheme: useTheme),
      ],
    );
  }
}
