import 'package:flutter/material.dart';

void main() {
  runApp(AnimatedApp());
}

class AnimatedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimationExample(),
    );
  }
}

class AnimationExample extends StatefulWidget {
  @override
  _AnimationExampleState createState() => _AnimationExampleState();
}

class _AnimationExampleState extends State<AnimationExample> {
  bool isExpanded = false;
  bool showText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.menu, color: Colors.white),
        actions: [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 16),
          Icon(Icons.notifications, color: Colors.white),
          SizedBox(width: 16),
        ],
        title: Text(
          "Animated UI",
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: isExpanded ? 150 : 100,
              height: isExpanded ? 150 : 80,
              decoration: BoxDecoration(
                color: isExpanded ? Colors.blueAccent : Colors.orange,
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            SizedBox(height: 20),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: showText ? 1 : 0,
              child: Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isExpanded = !isExpanded;
                  showText = !showText;
                });
              },
              child: Text("Tap Here"),
            ),
          ],
        ),
      ),
    );
  }
}
