import 'package:bookano/logic/data/app_database.dart';
import 'package:bookano/widgets/star_rate.dart';
import 'package:flutter/material.dart';

class MyWishlist extends StatelessWidget {
  const MyWishlist({super.key, required this.useTheme, required this.onTap});

  final ThemeData useTheme;
  final void Function(BookData data) onTap;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25.0,
          crossAxisSpacing: 15.0,
          childAspectRatio: 1.7,
        ),
        delegate: SliverChildBuilderDelegate(
          childCount: AppDatabase.myWishlist.length,
          (context, index) {
            BookData data = AppDatabase.myWishlist[index];

            return Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(data),
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  child: Row(
                    children: <Widget>[
                      Image.asset(data.bookImage),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  data.bookName,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: useTheme.textTheme.bodyMedium!.apply(
                                    color: useTheme.colorScheme.secondary,
                                  ),
                                ),
                                Text(
                                  data.writer,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: useTheme.textTheme.bodyMedium!.apply(
                                    color: useTheme.colorScheme.surface,
                                  ),
                                ),
                              ],
                            ),
                            StarRate(
                              useTheme: useTheme,
                              star: data.star,
                              bottom: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
