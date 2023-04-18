import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    super.key,
    required this.navIcon,
    required this.navLabel,
    this.space = 4,
    required this.isSelected,
    this.unSelectedIconSize = 24,
    this.selectedIconSize = 26,
    required this.onTap,
  });

  final String navIcon;
  final String navLabel;
  final double space;
  final bool isSelected;
  final double unSelectedIconSize;
  final double selectedIconSize;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    final ThemeData useTheme = Theme.of(context);

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ColorFiltered(
                colorFilter: isSelected
                    ? ColorFilter.mode(
                        useTheme.colorScheme.primary,
                        BlendMode.srcATop,
                      )
                    : ColorFilter.mode(
                        useTheme.colorScheme.surface,
                        BlendMode.srcATop,
                      ),
                child: SvgPicture.asset(
                  navIcon,
                  height: isSelected ? selectedIconSize : unSelectedIconSize,
                  width: isSelected ? selectedIconSize : unSelectedIconSize,
                ),
              ),
              SizedBox(height: space),
              Text(
                navLabel,
                style: useTheme.textTheme.bodySmall!.apply(
                  color: isSelected
                      ? useTheme.colorScheme.secondary
                      : useTheme.colorScheme.surface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
