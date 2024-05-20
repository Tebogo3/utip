import 'package:flutter/material.dart';
import 'package:utip/providers/ThemProvider.dart';

class ToggleThemeButton extends StatelessWidget {
  const ToggleThemeButton({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => themeProvider.toggleTheme(),
        icon: !themeProvider.isDarkMode
            ? Icon(Icons.wb_sunny)
            : Icon(Icons.nightlight_round));
  }
}
