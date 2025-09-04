import 'package:flutter/material.dart';


/// --light & dark Elevated Button themes
class TElevatedButtonTheme{
  TElevatedButtonTheme._(); // to avoid creating instances


  /// --Light theme
   static final lightElevatedButtonTheme = ElevatedButtonThemeData(
     style: ElevatedButton.styleFrom(
       elevation: 0,
       foregroundColor: Colors.white,
       backgroundColor: Colors.blue,
       disabledBackgroundColor: Colors.grey,
       disabledForegroundColor: Colors.grey,
       side: const BorderSide(color: Colors.blue),
       padding: const EdgeInsets.symmetric(vertical: 18),
       textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
     ),
   );

   /// --Dark Theme
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

}