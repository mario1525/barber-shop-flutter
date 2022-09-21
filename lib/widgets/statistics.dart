import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class statistics extends StatefulWidget {
  const statistics({Key? key}) : super(key: key);

  Mystatistic createState() {
    return Mystatistic();
  }
}

class Mystatistic extends State<statistics> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void _update() async {
    final data = await DB.getfacture();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    _update();
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop1'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                  color: Color.fromARGB(255, 93, 150, 235),
                  margin: const EdgeInsets.all(15),
                  child: ListTile(
                    title: Text(_journals[index]['fecha'].toString()),
                    subtitle: Text(_journals[index]['id_user'].toString()),
                    trailing: SizedBox(
                      width: 100,
                    ),
                  ))),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _update();
          Navigator.pushNamed(context, '/newservis');
        },
      ),
    );
  }
}
