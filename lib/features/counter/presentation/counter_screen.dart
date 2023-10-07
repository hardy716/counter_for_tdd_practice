import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';
import 'package:counter_tdd_practice/features/counter/domain/usecases/counter_usecases.dart';
import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  final CounterUseCases counterUseCases;

  const CounterScreen({
    Key? key,
    required this.counterUseCases,
  }) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  late CounterEntity _counterEntity; // Using CounterEntity

  @override
  void initState() {
    super.initState();
    _counterEntity = CounterEntity(0); // Initializing CounterEntity
  }

  void _incrementCounter() {
    setState(() {
      widget.counterUseCases
          .increment(_counterEntity); // Updating CounterEntity through use case
    });
  }

  void _decrementCounter() {
    setState(() {
      widget.counterUseCases
          .decrement(_counterEntity); // Updating CounterEntity through use case
    });
  }

  void _resetCounter() {
    setState(() {
      widget.counterUseCases
          .reset(_counterEntity); // Updating CounterEntity through use case
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Now Counter Number is...',
            ),
            Text(
              '${_counterEntity.value}',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 10.0,
            left: 40.0,
            child: FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 10.0,
            left: 120.0,
            child: FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ),
          Positioned(
            bottom: 10.0,
            right: 10.0,
            child: FloatingActionButton(
              onPressed: _resetCounter,
              tooltip: 'Reset',
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}
