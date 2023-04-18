import 'package:bookano/logic/data/app_database.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyLibrary extends StatelessWidget {
  const MyLibrary({
    super.key,
    required this.useTheme,
    required this.title,
    required this.onDiscoverMoreTap,
    required this.onBookTap,
  });

  final ThemeData useTheme;
  final String title;
  final GestureTapCallback onDiscoverMoreTap;
  final void Function(BookData data) onBookTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
            top: 18,
            bottom: 11,
            left: 24,
          ),
          child: Text(
            title,
            style: useTheme.textTheme.headlineSmall!
                .apply(color: useTheme.colorScheme.secondary),
          ),
        ),
        SizedBox(
          height: 215,
          child: ListView.builder(
            itemCount: AppDatabase.myLibrary.length + 1,
            padding: const EdgeInsets.only(left: 17),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              if (index == AppDatabase.myLibrary.length) {
                return Container(
                  margin: const EdgeInsets.only(
                    left: 7,
                    right: 24,
                    bottom: 55,
                  ),
                  width: 130,
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(6),
                    dashPattern: const [8, 4],
                    color: useTheme.colorScheme.secondary,
                    child: SizedBox(
                      width: 130,
                      child: InkWell(
                        onTap: onDiscoverMoreTap,
                        borderRadius: BorderRadius.circular(6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              CupertinoIcons.add,
                              size: 30,
                              color: Color(0XFF656B8C),
                            ),
                            SizedBox(height: 16),
                            Text(
                              'Discover More',
                              style: TextStyle(
                                color: Color(0XFF656B8C),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              } else {
                BookData data = AppDatabase.myLibrary[index];
                const double mainBookSize = 80;

                return InkWell(
                  onTap: () => onBookTap(data),
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    margin: const EdgeInsets.only(left: 7, right: 7, top: 5),
                    width: 117,
                    child: SizedBox(
                      width: 117,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.asset(data.bookImage),
                          const SizedBox(height: 11),
                          Text(
                            data.bookName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Stack(
                                children: [
                                  Container(
                                    height: 4,
                                    width: mainBookSize,
                                    decoration: BoxDecoration(
                                      color: useTheme.colorScheme.surface,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                  Container(
                                    height: 4,
                                    width: (data.completePercent / 100) *
                                        mainBookSize,
                                    decoration: BoxDecoration(
                                      color: useTheme.colorScheme.secondary,
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '${data.completePercent}%',
                                style: useTheme.textTheme.labelSmall,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}
