import 'package:flutter/material.dart';

class Trial extends StatelessWidget {
  const Trial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('height : ${MediaQuery.of(context).size.height}')
          ],
        ),
      ),
    );
  }
}