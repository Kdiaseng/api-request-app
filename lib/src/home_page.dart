import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Todo\s'),
      ),
      body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(title: Text('item $index'));
          }),
    );
  }
}
