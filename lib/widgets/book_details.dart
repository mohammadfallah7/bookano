import 'package:bookano/logic/data/app_database.dart';
import 'package:bookano/logic/provider/book_details_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({
    super.key,
    required this.useTheme,
    required this.data,
  });

  final ThemeData useTheme;
  final BookData data;

  @override
  Widget build(BuildContext context) {
    final List<String> tabTitle = ['About', 'Reviews', 'Author'];

    return Consumer<BookDetailsProvider>(
      builder: (context, bookDetailsProvider, child) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                tabTitle.length,
                (index) => InkWell(
                  onTap: () {
                    bookDetailsProvider.toggleTabIndex(index);
                  },
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 8,
                    ),
                    child: Text(
                      tabTitle[index],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                ),
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: useTheme.colorScheme.surface,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: bookDetailsProvider.selectedTabIndex == 0
                            ? useTheme.colorScheme.primary
                            : useTheme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: bookDetailsProvider.selectedTabIndex == 1
                            ? useTheme.colorScheme.primary
                            : useTheme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    Container(
                      height: 4,
                      width: 80,
                      decoration: BoxDecoration(
                        color: bookDetailsProvider.selectedTabIndex == 2
                            ? useTheme.colorScheme.primary
                            : useTheme.colorScheme.surface,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (bookDetailsProvider.selectedTabIndex == 0)
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 17,
                bottom: 95,
              ),
              child: Text(data.about),
            ),
          if (bookDetailsProvider.selectedTabIndex == 1)
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 17,
                bottom: 95,
              ),
              child: Text(data.review),
            ),
          if (bookDetailsProvider.selectedTabIndex == 2)
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 17,
                bottom: 95,
              ),
              child: Text(data.author),
            ),
        ],
      ),
    );
  }
}
