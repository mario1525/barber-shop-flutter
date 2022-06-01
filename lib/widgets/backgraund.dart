import 'package:flutter/material.dart';

class backgraund extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 255, 255, 255),
          ],
          begin: FractionalOffset(1.0, 0.1),
          end: FractionalOffset(1.0, 0.1),
        ),
      ),
    );
  }
}
