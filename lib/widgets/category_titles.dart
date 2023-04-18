import 'package:bookano/logic/data/app_database.dart';
import 'package:bookano/logic/provider/category_titles_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTitles extends StatelessWidget {
  const CategoryTitles({super.key, required this.useTheme});

  final ThemeData useTheme;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          AppDatabase.categories.length,
          (index) {
            CategoryData data = AppDatabase.categories[index];

            return Consumer<CategoryTitlesProvider>(
              builder: (context, categoryTitlesProvider, child) => InkWell(
                onTap: () {
                  categoryTitlesProvider.toggleTitleIndex(index);
                },
                borderRadius: BorderRadius.circular(5),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                      child: Text(data.title),
                    ),
                    Container(
                      height: 3,
                      width: 30,
                      decoration: BoxDecoration(
                        color:
                            categoryTitlesProvider.selectedTitleIndex == index
                                ? useTheme.colorScheme.primary
                                : Colors.transparent,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
