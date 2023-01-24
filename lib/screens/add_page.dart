import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Añadir'),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.numbers_sharp),
                      border: OutlineInputBorder(),
                      labelText: 'Id',
                      hintText: 'Introduce una id'),
                ),
              ),
              Divider(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.title),
                      border: OutlineInputBorder(),
                      labelText: 'Título',
                      hintText: 'Introduce un título'),
                ),
              ),
              Divider(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: InputDecoration(
                      icon: Icon(Icons.production_quantity_limits),
                      border: OutlineInputBorder(),
                      labelText: 'Cantidad',
                      hintText: 'Introduce una cantidad'),
                ),
              ),
              Divider(
                color: Color.fromARGB(0, 255, 255, 255),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Añadir'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
