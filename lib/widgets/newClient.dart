import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';
import './users.dart';

class newUser extends StatefulWidget {
  const newUser({Key? key}) : super(key: key);

  newUserstate createState() {
    return newUserstate();
  }
}

class newUserstate extends State<newUser> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController myController1 = TextEditingController();
  final TextEditingController myController2 = TextEditingController();
  final TextEditingController myController3 = TextEditingController();
  final TextEditingController myController4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Positioned(
              child: TextFormField(
                controller: myController1,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your name',
                  labelText: 'Name *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some name';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              child: TextFormField(
                controller: myController2,
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  hintText: 'What is your surname',
                  labelText: 'surname *',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some surname';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              child: TextFormField(
                controller: myController3,
                decoration: const InputDecoration(
                  icon: Icon(Icons.phone_rounded),
                  hintText: 'What is your phone number',
                  labelText: 'phone *',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some phone number';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              child: TextFormField(
                controller: myController4,
                decoration: const InputDecoration(
                  icon: Icon(Icons.grid_on_rounded),
                  hintText: 'YYYY-MM-DD ',
                  labelText: 'birthday date *',
                ),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some birthday date';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addItem();
                  }
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _addItem() async {
    int valDInt = int.parse(myController3.text);
    await DB.createItem(
        myController1.text, myController2.text, valDInt, EVfechas(myController4.text));
  }
  String EVfechas(String fecha) {
    final newValue = fecha
        .replaceAll("/", "-")
        .replaceAll(";", "-")
        .replaceAll(":", "-")
        .replaceAll(".", "-")
        .replaceAll(" ", "");
    return newValue;
  }
}
