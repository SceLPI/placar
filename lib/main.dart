import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Placar(),
    );
  }
}

class Placar extends StatefulWidget {
  const Placar({super.key});

  @override
  State<Placar> createState() => _PlacarState();
}

class _PlacarState extends State<Placar> {
  int p1 = 0;
  bool p1IsOnpan = false;

  int p2 = 0;
  bool p2IsOnpan = false;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return Scaffold(
          body: Stack(
            children: [
              orientation == Orientation.portrait ? portrait() : landscape(),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            p1 = 0;
                            p2 = 0;
                            p1IsOnpan = false;
                            p1IsOnpan = false;
                          });
                        },
                        backgroundColor: Colors.black,
                        elevation: 0,
                        hoverElevation: 0,
                        child: const Text(
                          "↩︎",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget portrait() {
    return Column(
      children: buildScreen(),
    );
  }

  Widget landscape() {
    return Row(
      children: buildScreen(),
    );
  }

  List<Widget> buildScreen() {
    return [
      Expanded(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.distance > 10 &&
                details.delta.dy < 0 &&
                !p1IsOnpan) {
              p1IsOnpan = true;
              setState(() {
                p1++;
              });
            }
            if (details.delta.distance > 10 &&
                details.delta.dy > 0 &&
                !p1IsOnpan) {
              p1IsOnpan = true;
              setState(() {
                if (p1 > 0) {
                  p1--;
                }
              });
            }
          },
          onPanEnd: (details) {
            p1IsOnpan = false;
          },
          onTap: () {
            setState(() {
              p1++;
            });
          },
          child: Container(
            color: Colors.red,
            child: Center(
              child: Text(
                "$p1",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      Expanded(
        child: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.distance > 10 &&
                details.delta.dy < 0 &&
                !p2IsOnpan) {
              p2IsOnpan = true;
              setState(() {
                p2++;
              });
            }
            if (details.delta.distance > 10 &&
                details.delta.dy > 0 &&
                !p2IsOnpan) {
              p2IsOnpan = true;
              setState(() {
                if (p2 > 0) {
                  p2--;
                }
              });
            }
          },
          onPanEnd: (details) {
            p2IsOnpan = false;
          },
          onTap: () {
            setState(() {
              p2++;
            });
          },
          child: Container(
            color: Colors.blue,
            child: Center(
              child: Text(
                "$p2",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 120,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    ];
  }
}
