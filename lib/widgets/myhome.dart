import 'package:flutter/material.dart';

class myhome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Algarin Barber Shop'),
      ),
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 20.0,
              left: 275,
              child: IconButton(
                icon: const Icon(Icons.assignment_ind),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/users');
                },
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 175,
              child: IconButton(
                icon: const Icon(Icons.request_page_rounded),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/servi');
                },
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 75,
              child: IconButton(
                icon: const Icon(Icons.query_stats),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/statistics');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
