import 'package:flutter/material.dart';

void main() {
  runApp(const UIipApp());
}

class UIipApp extends StatelessWidget {
  const UIipApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print(context.widget);
    return MaterialApp(
      title: 'UTip App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UIip(),
    );
  }
}

//StatefulWidget will return a placeholder from the build

class UIip extends StatefulWidget {
  const UIip({super.key});

  @override
  State<UIip> createState() => _UIipState();
}

class _UIipState extends State<UIip> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    //Add style

    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                  color: theme.colorScheme.inversePrimary,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Text("Total per Person", style: style),
                  Text(
                    "\$34.00",
                    style: style.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontSize: theme.textTheme.displaySmall?.fontSize),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
