import 'package:bookano/logic/data/app_database.dart';
import 'package:bookano/widgets/book_details.dart';
import 'package:bookano/widgets/star_rate.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BookScreen extends StatelessWidget {
  const BookScreen({super.key, required this.data});

  final BookData data;

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);

    return Theme(
      data: useTheme.copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: useTheme.colorScheme.background,
        ),
      ),
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Row(
            children: [
              const Text('Add to cart'),
              const SizedBox(width: 10),
              ColorFiltered(
                colorFilter: ColorFilter.mode(
                  useTheme.colorScheme.onPrimary,
                  BlendMode.srcATop,
                ),
                child: SvgPicture.asset(
                  'assets/icons/cart.svg',
                  width: 15,
                  height: 15,
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      CupertinoIcons.chevron_back,
                      size: 24,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: useTheme.colorScheme.secondary,
                        foregroundColor: useTheme.colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: const Text('+ Add to wishlist'),
                    ),
                    const SizedBox(width: 16),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        data.bookIntro,
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24, right: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Image.asset(
                                  'assets/images/profile.png',
                                  width: 48,
                                  height: 48,
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      data.bookName,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: useTheme.textTheme.bodyLarge!
                                          .copyWith(
                                        fontWeight: FontWeight.w700,
                                        color: useTheme.colorScheme.secondary,
                                      ),
                                    ),
                                    Text('By ${data.writer}'),
                                  ],
                                ),
                              ],
                            ),
                            Text(
                              '\$${data.price}',
                              style: useTheme.textTheme.headlineSmall!.apply(
                                color: useTheme.colorScheme.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 60),
                            StarRate(
                              useTheme: useTheme,
                              star: data.star,
                              starSize: 15,
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '${data.readCount} Reads',
                              style: useTheme.textTheme.bodySmall!.apply(
                                color: useTheme.colorScheme.surface,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: BookDetails(
                    useTheme: useTheme,
                    data: data,
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 100,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0X7FFFFFFF),
                      Color(0XFFFFFFFF),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
