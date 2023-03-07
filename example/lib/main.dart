// main.dart

import 'package:flutter/material.dart';
import 'package:reduced_redux/reduced_redux.dart';
import 'logic.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ReducedProvider(
        initialState: 0,
        child: MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const ReducedConsumer(
            transformer: transformer,
            builder: builder,
          ),
        ),
      );
}
