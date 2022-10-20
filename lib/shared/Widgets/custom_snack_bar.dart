// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomSnackBar extends StatelessWidget {
  final String message;

  const CustomSnackBar({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(message));
  }
}
