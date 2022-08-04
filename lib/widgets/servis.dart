import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class myservis extends StatefulWidget {
  const myservis({Key? key}) : super(key: key);

  MyServisestate createState() {
    return MyServisestate();
  }
}

class MyServisestate extends State<myservis> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
