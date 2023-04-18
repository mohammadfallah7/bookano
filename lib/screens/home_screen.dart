import 'package:bookano/widgets/my_library.dart';
import 'package:bookano/widgets/my_wishlist.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);

    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 24),
              child: Text(
                'Hi Mohammad,',
                style: useTheme.textTheme.bodyLarge!
                    .apply(color: useTheme.colorScheme.secondary),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: MyLibrary(
              useTheme: useTheme,
              title: 'My Library',
              onDiscoverMoreTap: () {},
              onBookTap: (data) {},
            ),
          ),
          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30,
                    left: 24,
                  ),
                  child: Text(
                    'My Wishlist',
                    style: useTheme.textTheme.headlineSmall!
                        .apply(color: useTheme.colorScheme.primary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 27, right: 20),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: BorderSide(
                        color: useTheme.colorScheme.surface,
                      ),
                      minimumSize: const Size(50, 35),
                    ),
                    child: const Text('See More'),
                  ),
                ),
              ],
            ),
          ),
          MyWishlist(
            useTheme: useTheme,
            onTap: (data) {},
          ),
        ],
      ),
    );
  }
}
