import 'package:flutter/material.dart';

var showSnackBar = (context, message, color) => {
      Scaffold.of(context).showSnackBar(SnackBar(
        duration: Duration(seconds: 0, milliseconds: 300),
        backgroundColor: color,
        content: Text(
          message,
          style: TextStyle(fontSize: 20.0),
        ),
      ))
    };
