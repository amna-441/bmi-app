import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var w1 = TextEditingController();
  var heightinch = TextEditingController();
  var heightfoot = TextEditingController();
  var result = "";
  var bgcolor = Colors.green.shade200;

  @override
  Widget build(BuildContext context) {
    // Get the screen size
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "BMI APP",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: screenWidth * 0.8, // Responsive width
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.05), // Responsive padding
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BMI APP',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: w1,
                    decoration: const InputDecoration(
                      label: Text("Enter your weight"),
                      prefixIcon: Icon(Icons.line_weight),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: heightfoot,
                    decoration: const InputDecoration(
                      label: Text("Enter your height in feet"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: heightinch,
                    decoration: const InputDecoration(
                      label: Text("Enter your height in inches"),
                      prefixIcon: Icon(Icons.height),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      var wt = w1.text.toString();
                      var ft = heightfoot.text.toString();
                      var it = heightinch.text.toString();
                      if (wt != "" && ft != "" && it != "") {
                        var iwt = int.parse(wt);
                        var ift = int.parse(ft);
                        var iit = int.parse(it);
                        var tinch = (ift * 12) + iit;
                        var tcm = tinch * 2.54;
                        var tm = tcm / 100;
                        var bmi = iwt / (tm * tm);
                        var msg = "";
                        if (bmi > 25) {
                          msg = "You are overweight";
                          bgcolor = Colors.orange.shade200;
                        } else if (bmi < 18) {
                          msg = "You are underweight";
                          bgcolor = Colors.red.shade200;
                        } else {
                          msg = "You are healthy";
                          bgcolor = Colors.green.shade200;
                        }
                        result =
                            "$msg \n Your BMI is ${bmi.toStringAsFixed(4)}";
                        setState(() {});
                      } else {
                        setState(() {
                          result = "Please fill all the required blanks";
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // background color
                    ),
                    child: const Text(
                      "Calculate",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(result, style: const TextStyle(fontSize: 15)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Responsive Width: The width of the main container is set to screenWidth * 0.8, which means it will take up 80% of the screen width, making it responsive on different devices.

// Responsive Padding: Added vertical padding using EdgeInsets.symmetric(vertical: screenHeight * 0.05) to give it some space based on the screen height.

// Removed Fixed Width: Removed the fixed width of 300 for the container to allow it to be responsive based on the device's screen size.

