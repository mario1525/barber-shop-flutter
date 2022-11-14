import 'package:flutter/material.dart';
import 'package:appalgarn/db.dart';

class Factura extends StatefulWidget{
  const Factura({Key? key}) : super(key: key );

  Myfacture createState() {
    return Myfacture();
  }
}

class Myfacture extends State<Factura> {
  List<Map<String, dynamic>> _journals = [];
  bool _isLoading = true;
  bool value = false;



  void update() async {
    final data = await DB.getservis();
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
        title: const Text('Algarin Baber Shop3'),
      ),
      body: _isLoading
        ?
      const Center(
        child: CircularProgressIndicator(),
      )
          :ListView.builder(
        itemCount: _journals.length,
        itemBuilder: (context, index)=> Card(
          color: Color.fromARGB(255, 93, 150, 235),
          margin: const EdgeInsets.all(15),
          child: ListTile(
            title: Text(_journals[index]['nombre']),
            subtitle: Text(_journals[index]['valor'].toString()),
            trailing: SizedBox(
            width: 100,
            child: Row(
              children: [
                Checkbox(
                  checkColor: Colors.green,
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
              ],
            ),
            )
          ),
        ),
      ),
    floatingActionButton: FloatingActionButton(
      child: const Icon(Icons.playlist_add_check_circle_sharp),
      onPressed: () {
        },
      ),
    );
  }
}