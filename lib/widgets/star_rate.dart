import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StarRate extends StatelessWidget {
  const StarRate({
    super.key,
    required this.useTheme,
    required this.star,
    this.left = 0,
    this.top = 0,
    this.right = 0,
    this.bottom = 0,
  });

  final ThemeData useTheme;
  final int star;
  final double left, top, right, bottom;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: Row(
        children: <Widget>[
          Row(
            children: List.generate(
              star,
              (index) => Icon(
                CupertinoIcons.star_fill,
                size: 10,
                color: useTheme.colorScheme.primary,
              ),
            ),
          ),
          Row(
            children: List.generate(
              5 - star,
              (index) => Icon(
                CupertinoIcons.star_fill,
                size: 10,
                color: useTheme.colorScheme.surface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
