import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class calculator_view extends StatefulWidget {
  const calculator_view({super.key});

  @override
  State<calculator_view> createState() => _calculator_viewState();
}

class _calculator_viewState extends State<calculator_view> {
  int num1 = 0;
  int num2 = 0;
  num result = 0;

  final displayOneControler = TextEditingController();
  final displayTwoControler = TextEditingController();

  @override
  void initState() {
    super.initState();

    displayOneControler.text = num1.toString();

    displayTwoControler.text = num2.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: [
          Display(
              key: const Key("displayOne"),
              hint: "enter first number",
              controller: displayOneControler),
          const SizedBox(height: 20),
          Display(
              key: const Key("displayTwo"),
              hint: "enter second number",
              controller: displayTwoControler),
          const SizedBox(height: 20),
          Text(
            key: const Key("result"),
            "Result: $result",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneControler.text)! +
                        num.tryParse(displayTwoControler.text)!;
                    print(num.tryParse(displayOneControler.text)
                        .toString());
                  });
                },
                child: Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneControler.text)! -
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: Icon(Icons.remove),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneControler.text)! *
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: Icon(CupertinoIcons.multiply),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    result = num.tryParse(displayOneControler.text)! /
                        num.tryParse(displayTwoControler.text)!;
                  });
                },
                child: Icon(CupertinoIcons.divide),
              ),
            ],
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
              onPressed: () {
                setState(() {
                  displayOneControler.text = "";
                  displayTwoControler.text = "";
                  result = 0;
                });
              },
              child: Icon(Icons.refresh))
        ],
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({
    super.key,
    this.hint = 'enter number',
    required this.controller,
  });

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 3,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.deepOrange, width: 2),
        ),
        hintText: hint,
      ),
    );
  }
}
