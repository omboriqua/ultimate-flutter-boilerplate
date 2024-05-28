// lib/app/theme.dart
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

final ThemeData lightTheme =
    FlexColorScheme.light(scheme: FlexScheme.deepOrangeM3).toTheme;
final ThemeData darkTheme =
    FlexColorScheme.dark(scheme: FlexScheme.deepOrangeM3).toTheme;
