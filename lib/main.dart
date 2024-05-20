import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:utip/providers/ThemProvider.dart';
import 'package:utip/providers/TipCalculatorModel.dart';
import 'package:utip/widgets/bill_amount_field.dart';
import 'package:utip/widgets/person_counter.dart';
import 'package:utip/widgets/tip_row.dart';
import 'package:utip/widgets/tip_slider.dart';
import 'package:utip/widgets/toggle_theme_button.dart';
import 'package:utip/widgets/total_per_person.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => TipCalculatorModel()),
      ChangeNotifierProvider(create: (context) => ThemeProvider())
    ], child: const UIipApp()),
  );
}

class UIipApp extends StatelessWidget {
  const UIipApp({super.key});

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'UTip App',
      theme: themeProvider.currentTheme,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
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
    final model = Provider.of<TipCalculatorModel>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    //Add style
    final style = theme.textTheme.titleMedium!.copyWith(
        color: theme.colorScheme.onPrimary, fontWeight: FontWeight.bold);

    return Scaffold(
      appBar: AppBar(
          title: const Text('UTip'),
          //actions - is a list of widgets
          actions: [ToggleThemeButton(themeProvider: themeProvider)]),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TotalPerPerson(
              theme: theme, style: style, total: model.totalPerPerson),
          //Form

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: theme.colorScheme.primary, width: 2)),
              child: Column(
                children: [
                  BillAmountField(
                    billAmount: model.billTotal.toString(),
                    onChanged: (value) {
                      model.updateBillTotal(double.parse(value));
                    },
                  ),
                  //Split Bill area
                  PersonCounter(
                    theme: theme,
                    personCount: model.personCount,
                    onDecrement: () {
                      if (model.personCount > 1) {
                        model.updatePersonCount(model.personCount - 1);
                      }
                    },
                    onIncrement: () {
                      model.updatePersonCount(model.personCount + 1);
                    },
                  ),
                  //== Tip Section ==
                  TipRow(
                    theme: theme,
                    totalT: model.billTotal,
                    percentage: model.tipPercentage,
                  ),
                  //Slider Text
                  Text("${(model.tipPercentage * 100).round()}%"),
                  //Slider
                  TipSlider(
                    tipPercentage: model.tipPercentage,
                    onChanged: (double value) {
                      model.updateTipPercentage(value);
                    },
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
