import 'package:flutter/material.dart';

var showSnackBar = (context, message, color) => {
      Scaffold.of(context).showSnackBar(SnackBar(
        backgroundColor: color,
        content: Text(
          message,
          style: TextStyle(fontSize: 20.0),
        ),
      ))
    };
