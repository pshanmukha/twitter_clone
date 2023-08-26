import 'package:flutter/material.dart';

showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(content),
    ),
  );
}

String getNAmeFromEmail(String email) {
  // shanmukhapanyam@gmail.com
  // List = [shanmukhapanyam, @gmail.com]
  return email.split('@')[0]; //shanmukhapanyam
}
