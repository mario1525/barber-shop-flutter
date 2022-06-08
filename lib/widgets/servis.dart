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

  List<Map<String, dynamic>> _journals = [];
  List<Map<String, dynamic>> _journals2 = [];

  void update() async {
    final data = await DB.getItems();
    _journals = data;

    final data2 = await DB.getservis();
    _journals2 = data2;
  }

  var _list = ['uno', 'dos ', 'tres', 'cuaro'];
  var _vista = 'seleccione el Nombre del cliente';

  var _list2 = ['uno', 'dos ', 'tres', 'cuaro'];
  var _vista2 = 'seleccione un servicio';

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
              Positioned(
                child: DropdownButton(
                  items: _list.map(
                    (String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    },
                  ).toList(),
                  onChanged: (_) {},
                  hint: Text(_vista),
                ),
              ),
              Positioned(
                child: DropdownButton(
                  items: _list2.map(
                    (String a) {
                      return DropdownMenuItem(value: a, child: Text(a));
                    },
                  ).toList(),
                  onChanged: (_) {},
                  hint: Text(_vista2),
                ),
              ),
              Positioned(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/newservis');
        },
      ),
    );
  }
}
