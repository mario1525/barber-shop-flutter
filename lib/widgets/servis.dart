import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class myservis extends StatefulWidget {
  const myservis({Key? key}) : super(key: key);

  MyServisestate createState() {
    return MyServisestate();
  }
}

class MyServisestate extends State<myservis> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;
  final now = DateTime.now().toString();

  void update() async {
    final data = await DB.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    update();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop2'),
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
                  title: Text(_journals[index]['nombre']),
                  subtitle: Text(_journals[index]['apellido']),

                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            icon:
                                const Icon(Icons.assignment_turned_in_outlined),
                            onPressed: () {
                              _addFacture(_journals[index]['id'],now);
                              Navigator.pushNamed(context, '/factura');
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.autorenew_rounded),
        onPressed: () {
          update();
        },
      ),
    );
  }
  Future<void> _addFacture(idUser,fecha) async {
    await DB.createFacture(idUser,fecha);
  }

}
