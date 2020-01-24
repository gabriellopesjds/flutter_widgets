import 'package:flutter/material.dart';

import 'listview_page_example.dart';

class ListViewDetail extends StatelessWidget {
  
  Dog dog;

  ListViewDetail(this.dog);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("UAL UAL: ${dog.nome}"),
      ),
      body: Image.asset(this.dog.foto),
    );
  }
}
