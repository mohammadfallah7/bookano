import 'package:bookano/logic/provider/bottom_nav_provider.dart';
import 'package:bookano/screens/cart_screen.dart';
import 'package:bookano/screens/community_screen.dart';
import 'package:bookano/screens/explore_screen.dart';
import 'package:bookano/screens/home_screen.dart';
import 'package:bookano/widgets/bottom_nav.dart';
import 'package:bookano/widgets/exit_popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);
    final BottomNavProvider bottomNavProvider =
        Provider.of<BottomNavProvider>(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Theme(
      data: useTheme.copyWith(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: useTheme.colorScheme.surface.withOpacity(.3),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useTheme.colorScheme.primary,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useTheme.colorScheme.errorContainer,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: useTheme.colorScheme.errorContainer,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      child: WillPopScope(
        onWillPop: () => ExitPopup.showExitPopup(context),
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: useTheme.colorScheme.background,
            leading: IconButton(
              icon: SvgPicture.asset(
                'assets/icons/menu.svg',
                width: 24,
                height: 24,
              ),
              onPressed: () => scaffoldKey.currentState?.openDrawer(),
            ),
            title: TextField(
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Color(0XFF979797),
                      BlendMode.srcATop,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 24,
                      height: 24,
                    ),
                  ),
                ),
              ),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/scan.svg',
                  width: 28,
                  height: 28,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  CupertinoIcons.bell_fill,
                  color: useTheme.colorScheme.secondary,
                ),
              ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: useTheme.colorScheme.primary,
                  ),
                  child: const Text('Drawer Header'),
                ),
                ListTile(
                  title: const Text('Item 1'),
                  onTap: () {
                    // Perform action for Item 1
                  },
                ),
                ListTile(
                  title: const Text('Item 2'),
                  onTap: () {
                    // Perform action for Item 2
                  },
                ),
              ],
            ),
          ),
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: SystemUiOverlayStyle.light.copyWith(
              statusBarColor: useTheme.colorScheme.background,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: useTheme.colorScheme.background,
              systemNavigationBarDividerColor: useTheme.colorScheme.background,
              systemNavigationBarIconBrightness: Brightness.dark,
            ),
            child: IndexedStack(
              index: bottomNavProvider.selectedIndex,
              children: const <Widget>[
                HomeScreen(),
                ExploreScreen(),
                CartScreen(),
                CommunityScreen(),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNav(),
        ),
      ),
    );
  }
}
