import 'package:bookano/logic/provider/bottom_nav_provider.dart';
import 'package:bookano/widgets/bottom_nav_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);
    final MediaQueryData useMediaQuery = MediaQuery.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5),
      width: useMediaQuery.size.width,
      height: 70,
      decoration: BoxDecoration(
        color: useTheme.colorScheme.background,
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Colors.black26,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Consumer<BottomNavProvider>(
        builder: (context, bottomNavProvider, child) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BottomNavItem(
              navIcon: 'assets/icons/my-library.svg',
              navLabel: 'My Library',
              isSelected: bottomNavProvider.selectedIndex == 0,
              onTap: () {
                bottomNavProvider.toggleIndex(0);
              },
            ),
            BottomNavItem(
              navIcon: 'assets/icons/explore.svg',
              navLabel: 'Explore',
              isSelected: bottomNavProvider.selectedIndex == 1,
              onTap: () {
                bottomNavProvider.toggleIndex(1);
              },
            ),
            BottomNavItem(
              navIcon: 'assets/icons/cart.svg',
              navLabel: 'Cart',
              isSelected: bottomNavProvider.selectedIndex == 2,
              onTap: () {
                bottomNavProvider.toggleIndex(2);
              },
            ),
            BottomNavItem(
              navIcon: 'assets/icons/community.svg',
              navLabel: 'Community',
              isSelected: bottomNavProvider.selectedIndex == 3,
              onTap: () {
                bottomNavProvider.toggleIndex(3);
              },
            ),
          ],
        ),
      ),
    );
  }
}
