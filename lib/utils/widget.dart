import 'package:flutter/material.dart';

Widget Box(String a)
{
  return ClipRRect(
    borderRadius: BorderRadius.circular(15),
    child: Container(
      height: 150,
      width: 275,
      color: Colors.red,
      child: Image.network("$a",fit: BoxFit.cover),
    ),
  );
}