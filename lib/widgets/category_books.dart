import 'package:bookano/logic/data/app_database.dart';
import 'package:bookano/widgets/star_rate.dart';
import 'package:flutter/material.dart';

class CategoryBooks extends StatelessWidget {
  const CategoryBooks({super.key, required this.useTheme, required this.onTap});

  final ThemeData useTheme;
  final void Function(BookData data) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(24, 18, 24, 24),
      sliver: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: .47,
        ),
        itemCount: AppDatabase.categoryBook.length,
        itemBuilder: (context, index) {
          BookData data = AppDatabase.categoryBook[index];

          return InkWell(
            onTap: () => onTap(data),
            borderRadius: BorderRadius.circular(6),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Image.asset(data.bookImage),
                  const SizedBox(height: 5),
                  Text(
                    data.bookName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: useTheme.textTheme.bodyMedium!.apply(
                      color: useTheme.colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    data.writer,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: useTheme.textTheme.bodyMedium!.apply(
                      color: useTheme.colorScheme.surface,
                    ),
                  ),
                  const SizedBox(height: 3),
                  StarRate(
                    useTheme: useTheme,
                    star: data.star,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
