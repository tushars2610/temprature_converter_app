// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(const CelsiusFahrenheitConverterApp());
}

class CelsiusFahrenheitConverterApp extends StatelessWidget {
  const CelsiusFahrenheitConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Celsius Fahrenheit Converter',
      home: ConverterScreen(),
    );
  }
}

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  _ConverterScreenState createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  double celsiusValue = 0;
  double fahrenheitValue = 32.0;

  void _convertCelsiusToFahrenheit(double value) {
    setState(() {
      celsiusValue = value;
      fahrenheitValue = (value * 9 / 5) + 32;
    });
  }

  void _convertFahrenheitToCelsius(double value) {
    setState(() {
      fahrenheitValue = value;
      celsiusValue = (value - 32) * 5 / 9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Celsius Fahrenheit Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _convertCelsiusToFahrenheit(double.parse(value));
                }
              },
              decoration: const InputDecoration(
                labelText: 'Enter Celsius',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Fahrenheit: $fahrenheitValue',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                if (value.isNotEmpty) {
                  _convertFahrenheitToCelsius(double.parse(value));
                }
              },
              decoration: const InputDecoration(
                labelText: 'Enter Fahrenheit',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Celsius: $celsiusValue',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
