import 'package:flutter/material.dart';
import 'widgets/myhome.dart';
import 'widgets/servis.dart';
import 'widgets/statistics.dart';
import 'widgets/newClient.dart';
import 'widgets/users.dart';

void main() {
  runApp(MaterialApp(
    title: 'rutas ',
    initialRoute: '/',
    routes: {
      '/': (context) => myhome(),
      '/servi': (context) => myservis(),
      '/user': (context) => newUser(),
      '/users': (context) => users(),
      '/statistics': (context) => statistics(),
    },
  ));
}
