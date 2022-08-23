import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userInputRow = '';
  String resultRow = '0';
  List operations = const ['%', '/', '*', '-', '+', '=', '√', '+/-'];

  buttonClick(buttonType, chosenButton) {
    if (buttonType == 'Input' ||
        buttonType == 'Operational' ||
        buttonType == 'Root') {
      setState(() {
        userInputRow += chosenButton;
      });
    } else if (buttonType == 'Equals') {
      setState(() {
        resultRow = userInputRow;
      });
    } else if (buttonType == 'C') {
      setState(() {
        userInputRow = '';
        resultRow = '0';
      });
    }
  }

  Widget createButton(String chosenButton, String buttonTypeClicked) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width * 0.2),
      height: (MediaQuery.of(context).size.height * 0.1),
      child: ElevatedButton(
        onPressed: () => buttonClick(buttonTypeClicked, chosenButton),
        style: ElevatedButton.styleFrom(
          primary: (chosenButton == buttonText[17])
              ? Colors.red
              : (chosenButton == buttonText[14])
                  ? Colors.blue
                  : Colors.black,
          elevation: 5,
          shadowColor: Colors.black,
        ),
        child: Text(
          chosenButton,
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  static List buttonText = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '.',
    '/',
    '*',
    '-',
    '=',
    '%',
    '+',
    'C',
    '^',
    '+/-',
  ];

  Widget rowOfButtons(
      int button1,
      int button2,
      int button3,
      int button4,
      String button1type,
      String button2type,
      String button3type,
      String button4type,
      context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: (MediaQuery.of(context).size.height * 0.005),
        ),
        createButton(
          buttonText[button1],
          button1type,
        ),
        createButton(
          buttonText[button2],
          button2type,
        ),
        createButton(
          buttonText[button3],
          button3type,
        ),
        createButton(
          buttonText[button4],
          button4type,
        ),
        SizedBox(
          width: (MediaQuery.of(context).size.height * 0.005),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('RetroKalk'),
          centerTitle: true,
          backgroundColor: Colors.blueGrey[700],
        ),
        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.blueGrey,
              alignment: Alignment.center,
              child: Container(
                width: (MediaQuery.of(context).size.width * 0.9),
                height: (MediaQuery.of(context).size.height * 0.7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.grey[700],
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black87,
                      blurRadius: 4,
                      spreadRadius: 1,
                      offset: Offset(3, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.01),
                    ),
                    Container(
                      height: (MediaQuery.of(context).size.height * 0.1),
                      width: (MediaQuery.of(context).size.width * 0.85),
                      decoration: BoxDecoration(
                        border: Border.all(),
                        color: Colors.green,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(3),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            alignment: AlignmentDirectional.topEnd,
                            child: Text(
                              userInputRow,
                              style: const TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          Container(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Text(
                              '${resultRow.interpret()}',
                              style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.01),
                    ),
                    Column(
                      children: <Widget>[
                        rowOfButtons(
                          17,
                          19,
                          15,
                          18,
                          'C',
                          'Change',
                          'Percent',
                          'Root',
                          context,
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.015),
                        ),
                        rowOfButtons(
                          7,
                          8,
                          9,
                          16,
                          'Input',
                          'Input',
                          'Input',
                          'Operational',
                          context,
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.015),
                        ),
                        rowOfButtons(
                          4,
                          5,
                          6,
                          13,
                          'Input',
                          'Input',
                          'Input',
                          'Operational',
                          context,
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.015),
                        ),
                        rowOfButtons(
                          1,
                          2,
                          3,
                          12,
                          'Input',
                          'Input',
                          'Input',
                          'Operational',
                          context,
                        ),
                        SizedBox(
                          height: (MediaQuery.of(context).size.height * 0.015),
                        ),
                        rowOfButtons(
                          0,
                          10,
                          14,
                          11,
                          'Input',
                          'Operational',
                          'Equals',
                          'Operational',
                          context,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
