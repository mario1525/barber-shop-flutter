import 'package:flutter/material.dart';
import 'widgets/myhome.dart';
import 'widgets/servis.dart';
import 'widgets/statistics.dart';
import 'widgets/newClient.dart';
import 'widgets/users.dart';
import 'widgets/newServi.dart';

void main() {
  runApp(MaterialApp( 
    title: 'Rutas ',
    initialRoute: '/',
    routes: {
      '/': (context) => myhome(),
      '/servi': (context) => myservis(),
      '/newservis': (context) => servis(),
      '/user': (context) => newUser(),
      '/users': (context) => users(),
      '/statistics': (context) => statistics(),
    },
  ));
}
