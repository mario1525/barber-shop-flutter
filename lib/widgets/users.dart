import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class users extends StatefulWidget {
  const users({Key? key}) : super(key: key);

  userspp createState() {
    return userspp();
  }
}

class userspp extends State<users> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void _updateDate() async {
    final data = await DB.getItems();
    setState(() {
      _journals = data;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop'),
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
                            icon: const Icon(Icons.edit),
                            onPressed:
                                () {} //=> _showForm(_journals[index]['id']),
                            ),
                        IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _deleteItem(_journals[index]['id']);
                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          _updateDate();
          Navigator.pushNamed(context, '/user');
        },
      ),
    );
  }

  void _deleteItem(int id) async {
    await DB.deleteuser(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('se elimino con exito un usuario'),
    ));
    _updateDate();
  }
}
