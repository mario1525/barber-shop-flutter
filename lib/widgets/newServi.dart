import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class servis extends StatefulWidget {
  const servis({Key? key}) : super(key: key);

  ServisUP createState() => ServisUP();
}

class ServisUP extends State<servis> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;

  void update() async {
    final data = await DB.getservis();
    _isLoading = false;
    _journals = data;
  }

  @override
  void initState() {
    super.initState();
     // Loading the diary when the app starts
  }



  final nombrecontroller = TextEditingController();
  final valorcontroller = TextEditingController();

  void _showForm(int? id) async {
    update();
    if (id != null) {
      final existingJournal =
          _journals.firstWhere((element) => element['id'] == id);
      nombrecontroller.text = existingJournal['nombre'];
      valorcontroller.text = existingJournal['valor'];
    }

    showModalBottomSheet(
        context: context,
        elevation: 5,
        isScrollControlled: true,
        builder: (_) => Container(
              padding: EdgeInsets.only(
                top: 15,
                left: 15,
                right: 15,
                // this will prevent the soft keyboard from covering the text fields
                bottom: MediaQuery.of(context).viewInsets.bottom + 120,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextField(
                    controller: nombrecontroller,
                    decoration: const InputDecoration(hintText: 'nombre'),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: valorcontroller,
                    decoration: const InputDecoration(hintText: 'valor'),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // guardar los nuevos datos
                      if (id == null) {
                        await _addser();
                      }

                      if (id != null) {
                        await updateserv(id);
                      }

                      nombrecontroller.text = '';
                      valorcontroller.text = '';

                      // Close the bottom sheet
                      Navigator.of(context).pop();
                    },
                    child: Text(id == null ? 'Create New' : 'Update'),
                  )
                ],
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    update();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop 5'),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _journals.length,
              itemBuilder: (context, index) => Card(
                color: Color.fromARGB(255, 128, 236, 255),
                margin: const EdgeInsets.all(15),
                child: ListTile(
                    title: Text(_journals[index]['nombre']),
                    //subtitle: Text(_journals[index]['valor']),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () => updateserv(_journals[index]['id']),
                          ),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed:
                                  () {} //=>_deleteItem(_journals[index]['id']),
                              ),
                        ],
                      ),
                    )),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),

        onPressed: () {
          update();
          _showForm(null);},
      ),
    );
  }

// agregar servicios
  Future<void> _addser() async {
    int valor = int.parse(valorcontroller.text);
    await DB.createItemser(nombrecontroller.text, valor);
    update();
  }

//actualizar servicios
  Future<void> updateserv(int id) async {
    int valor = int.parse(valorcontroller.text);
    await DB.updateserv(id, nombrecontroller.text, valor);
    update();
  }
}
