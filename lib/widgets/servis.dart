import 'package:flutter/material.dart';

class myservis extends StatefulWidget {
  const myservis({Key? key}) : super(key: key);

  myServisestate createState() {
    return myServisestate();
  }
}

class myServisestate extends State<myservis> {
  final _formKey = GlobalKey<FormState>();

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
        child: Column(children: [
          Positioned(
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.grid_on_rounded),
                hintText: 'which is today date',
                labelText: ' date *',
              ),
              keyboardType: TextInputType.datetime,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some date';
                }
                return null;
              },
            ),
          ),
          Positioned(
              child: DropdownButton(
            items: _list.map((String a) {
              return DropdownMenuItem(value: a, child: Text(a));
            }).toList(),
            onChanged: (_) {},
            hint: Text(_vista),
          )),
          Positioned(
              child: DropdownButton(
            items: _list2.map((String a) {
              return DropdownMenuItem(value: a, child: Text(a));
            }).toList(),
            onChanged: (_) {},
            hint: Text(_vista2),
          )),
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
        ]),
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
