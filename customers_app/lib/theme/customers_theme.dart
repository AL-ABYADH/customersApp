import 'package:flutter/material.dart';

class CustomersTheme {
  // Colors
  static final CustomersColors colors = CustomersColors();

  // Gradients
  static final CustomersGradients gradients = CustomersGradients();

  // Text
  static final CustomersTextStyles textStyles = CustomersTextStyles();

  // Text selection
  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: Color(0xff599873),
    selectionColor: Color(0xff9acab0),
    selectionHandleColor: Color(0xff599873),
  );

  // Text button
  static final textButtonTheme = TextButtonThemeData(
    style: ButtonStyle(
      foregroundColor: MaterialStateColor.resolveWith(
        (states) => const Color(0xff599873),
      ),
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontFamily: 'Almarai',
          fontSize: 13,
          color: Color(0xff599873),
        ),
      ),
    ),
  );
}

class CustomersColors {
  Color primaryColor = const Color(0xff599873);
  Color primaryColorTransparent = const Color(0xff1565c0);
  Color firstSecondaryColor = const Color(0xff27a2a2);
  Color secondSecondaryColor = const Color.fromARGB(255, 186, 134, 32);
  Color successColor = const Color.fromARGB(255, 0, 109, 62);
  Color errorColor = const Color.fromARGB(255, 155, 55, 77);
  Color backgroundColor = const Color.fromARGB(255, 248, 250, 255);
  Color fieldFillColor = const Color.fromARGB(255, 245, 245, 255);
  Color displayTextColor = const Color.fromARGB(255, 27, 39, 51);
  Color fieldLabel = Colors.grey;
}

class CustomersGradients {
  LinearGradient horizontalGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(26, 112, 176, 0.2),
      Color(0xff1565c0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    stops: [0, 1],
  );
  LinearGradient verticalGradient = const LinearGradient(
    colors: [
      Color.fromRGBO(26, 112, 176, 0.2),
      Color(0xff1565c0),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0, 1],
  );
}

class CustomersTextStyles {
  TextStyle titleLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xff599873),
  );
  TextStyle titleMedium = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 13,
    color: Color(0xff599873),
  );
  TextStyle displayLarge = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: Color(0xff666666),
  );
  TextStyle displayMedium = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 8,
    color: Color(0xff666666),
  );
  TextStyle labelSmall = const TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: Color(0xff666666),
  );
  TextStyle fieldError = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 8,
    color: CustomersTheme.colors.errorColor,
  );
  TextStyle fieldLabel = TextStyle(
    fontFamily: 'Alexandria',
    fontSize: 10,
    color: CustomersTheme.colors.fieldLabel,
  );
}

class CustomersInputDecoration extends InputDecoration {
  // Login credentials fields
  CustomersInputDecoration.login({required String label, required String icon})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'lib/assets/icons/$icon.png', // Assuming the icon is a PNG file
              color: CustomersTheme.colors.primaryColor,
              height: 15,
              width: 15,
            ),
          ),
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );
// Form fields
  CustomersInputDecoration.form({required String label, required Widget icon})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: icon,
          ),
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );

  // Filters fields
  CustomersInputDecoration.filter({required String label})
      : super(
          labelText: label,
          errorStyle: CustomersTheme.textStyles.fieldError,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          suffixIcon: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset(
              'lib/assets/icons/search.png',
              color: Colors.grey,
              height: 15,
              width: 15,
            ),
          ),
          labelStyle: CustomersTheme.textStyles.fieldLabel,
          border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(8))),
          filled: true,
          fillColor: CustomersTheme.colors.fieldFillColor,
        );
}
