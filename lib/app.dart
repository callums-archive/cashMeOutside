import 'package:flutter/material.dart';
// import 'counter.dart';
import 'counter_page.dart';

class CounterApp extends MaterialApp {
  // not sure about the brances over key
  CounterApp({Key key}) : super(key: key, home: CounterPage());
}
