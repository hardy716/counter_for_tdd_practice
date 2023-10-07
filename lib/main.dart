import 'package:counter_tdd_practice/features/counter/domain/usecases/counter_usecases.dart';
import 'package:counter_tdd_practice/features/counter/presentation/counter_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CounterScreen(counterUseCases: CounterUseCases()),
    );
  }
}
