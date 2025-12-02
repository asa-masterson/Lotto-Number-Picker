import 'package:flutter/material.dart';
import 'dart:ui' show FontVariation;
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Lottery Number Picker';

    final TextTheme appTextTheme = TextTheme(
      bodyLarge: TextStyle(
        fontVariations: [FontVariation('wght', 800)],
        fontSize: 24,
      ),
      bodyMedium: TextStyle(
        fontVariations: [FontVariation('wght', 600)],
        fontSize: 18,
      ),
      bodySmall: TextStyle(
        fontVariations: [FontVariation('wght', 400)],
        fontSize: 12,
      ),
    );

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'TASA Explorer',
        textTheme: appTextTheme,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3A415C)),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF3A415C)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF3A415C)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color(0xFF3A415C), width: 2),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: const Color(0xFF91A0E4),
          titleTextStyle: appTextTheme.bodyLarge,
          toolbarTextStyle: appTextTheme.bodyMedium,
          elevation: 4,
          centerTitle: true,
        ),
        fontFamilyFallback: [
          'Roboto',
          'Segoe UI',
          'Helvetica',
          'Arial',
        ],
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController minController = TextEditingController(text: '1');
  final TextEditingController maxController = TextEditingController(text: '100');
  final TextEditingController excludedController = TextEditingController();
  bool allowDuplicates = true;
  List<int> pickedNumbers = [];
  final Random random = Random();

  static const WidgetStateProperty<Icon> thumbIcon = WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.check),
      WidgetState.any: Icon(Icons.close),
    },
  );

  @override
  void dispose() {
    minController.dispose();
    maxController.dispose();
    excludedController.dispose();
    super.dispose();
  }

  void pickNumber() {
    final int? min = int.tryParse(minController.text);
    final int? max = int.tryParse(maxController.text);

    if (min == null || max == null || min > max) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid minimum and maximum values')),
      );
      return;
    }

    final Set<int> excluded = excludedController.text
        .split(RegExp(r'\s+'))
        .where((s) => s.isNotEmpty)
        .map((s) => int.tryParse(s))
        .whereType<int>()
        .toSet();

    List<int> availableNumbers = List.generate(max - min + 1, (i) => min + i)
        .where((num) => !excluded.contains(num))
        .toList();

    if (!allowDuplicates) {
      availableNumbers.removeWhere((num) => pickedNumbers.contains(num));
    }

    if (availableNumbers.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('No available numbers to pick!')),
      );
      return;
    }

    final int picked = availableNumbers[random.nextInt(availableNumbers.length)];

    setState(() {
      pickedNumbers.add(picked);
    });
  }

  void reset() {
    setState(() {
      pickedNumbers.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    String buttonText = pickedNumbers.isEmpty
        ? 'Pick a number'
        : 'Pick ${_ordinal(pickedNumbers.length + 1)} number';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Random Number Generator',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF91A0E4).withValues(alpha: 0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (pickedNumbers.isNotEmpty) ...[
                    Text(
                      'Picked Numbers',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 12,
                      runSpacing: 12,
                      children: pickedNumbers.asMap().entries.map((entry) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: const Color(0xFF3A415C), width: 2),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '#${entry.key + 1}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              Text(
                                '${entry.value}',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 20),
                  ],
                  Text(
                    'To get started fill out the boxes.',
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: minController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Minimum Value',
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: maxController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Maximum Value',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: SizedBox(
                      width: 520,
                      child: TextField(
                        controller: excludedController,
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Excluded numbers',
                          hintText: 'Separate numbers with spaces (e.g., 5 12 18 23)',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: 520,
                      child: Row(
                        children: [
                          const Text('Allow duplicate numbers'),
                          const Spacer(),
                          Switch(
                            thumbIcon: thumbIcon,
                            value: allowDuplicates,
                            onChanged: (bool value) {
                              setState(() {
                                allowDuplicates = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Center(
                    child: SizedBox(
                      width: 520,
                      child: FilledButton.tonal(
                        style: FilledButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            textStyle: Theme.of(context).textTheme.bodyLarge
                        ),
                        onPressed: pickNumber,
                        child: Text(buttonText),
                      ),
                    ),
                  ),
                  if (pickedNumbers.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Center(
                      child: SizedBox(
                        width: 520,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              textStyle: Theme.of(context).textTheme.bodyMedium
                          ),
                          onPressed: reset,
                          child: const Text('Reset'),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _ordinal(int number) {
    if (number % 100 >= 11 && number % 100 <= 13) {
      return '${number}th';
    }
    switch (number % 10) {
      case 1: return '${number}st';
      case 2: return '${number}nd';
      case 3: return '${number}rd';
      default: return '${number}th';
    }
  }
}
