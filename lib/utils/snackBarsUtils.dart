import 'package:flutter/material.dart';

showMessage(msg, label, context) {
  final snackBar = SnackBar(
    content: Text(msg),
    action: SnackBarAction(
      label: label,
      onPressed: () {},
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showMessageWithMessagesArray(msg, label, context, errors) {
  List<String> errorMessages = [];

  // Iterate through the errors object and collect all error messages
  errors!.forEach((key, value) {
    if (value is List && value.isNotEmpty) {
      errorMessages.add(value[0]);
    }
  });

  final snackBar = SnackBar(
    content: errorMessages.length > 0
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: errorMessages.map((error) => Text(error)).toList(),
          )
        : Text(msg),
    action: SnackBarAction(
      label: label,
      onPressed: () {
        // Some code to undo the change!
      },
    ),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
