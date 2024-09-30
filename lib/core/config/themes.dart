import 'package:flutter/material.dart';

import 'app_colors.dart';

final theme = ThemeData(
  useMaterial3: false,
  primarySwatch: Colors.grey,
  fontFamily: Fonts.regular,
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: AppColors.main,
    selectionColor: AppColors.main,
    selectionHandleColor: AppColors.main,
  ),
  colorScheme: ColorScheme.fromSwatch(
    accentColor: AppColors.card2,
  ),
  dialogTheme: const DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
);
