import 'package:flutter/material.dart';

class ExitPopup {
  static Future<bool> showExitPopup(BuildContext context) async {
    final ThemeData useTheme = Theme.of(context);

    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Exit'),
          content: const Text('Do you want to exit?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: useTheme.colorScheme.errorContainer,
                foregroundColor: useTheme.colorScheme.onError,
              ),
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: useTheme.colorScheme.primary,
                foregroundColor: useTheme.colorScheme.onError,
              ),
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }
}
