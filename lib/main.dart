import 'package:flutter/material.dart';
import 'package:utip/widgets/person_counter.dart';

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
  int _personCount = 1;

  //Methods

  void increment() {
    setState(() {
      _personCount = _personCount + 1;
    });
  }

  void decrement() {
    setState(() {
      if (_personCount > 0) {
        _personCount = _personCount - 1;
      }
    });
  }

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
          //Form

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money),
                        labelText: 'Bill Amount'),
                    keyboardType: TextInputType.number,
                    onChanged: (String value) {
                      print("Value: $value ");
                    },
                  ),
                  //Split Bill area
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Split',
                        style: theme.textTheme.titleMedium,
                      ),
                      PersonCounter(
                        theme: theme,
                        personCount: _personCount,
                        onDecrement: decrement,
                        onIncrement: increment,
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
