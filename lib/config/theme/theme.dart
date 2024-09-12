import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkmode;

  AppTheme({
    this.selectedColor = 0,
    this.isDarkmode = false,
  })  : assert(selectedColor >= 0,
            'Selected color must be greater than or equal to 0'),
        assert(selectedColor < colorList.length,
            'Selected color must be less than ${colorList.length}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        // colorSchemeSeed: colorList[selectedColor],
        primaryColor: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
          elevation: 0, // Opcional: Elimina la sombra del AppBar
        ),
        // Agrega más configuraciones según sea necesario
      );

  AppTheme copyWith({int? selectedColor, bool? isDarkmode}) => AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkmode: isDarkmode ?? this.isDarkmode,
      );
}
