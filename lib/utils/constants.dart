import 'package:flutter/material.dart';

// Define any constant values here
const String appName = "E-commerce App";

// Define any color constants here
const Color primaryColor = Colors.blue;
const Color secondaryColor = Colors.green;

// Define any text style constants here
const TextStyle headingTextStyle = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const TextStyle subheadingTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.grey,
);

// Define any other constants or utility functions here

// Utility function to show a simple dialog
void showSimpleDialog(BuildContext context, String title, String content) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}