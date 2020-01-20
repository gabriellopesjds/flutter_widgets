import 'package:flutter/material.dart';

class HelloPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Page 3"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Center(
      child: RaisedButton(
        child: Text(
          "Voltar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          _onClickVoltar(context);
        },
        color: Colors.black,
      ),
    );
  }

  _onClickVoltar(context){
    Navigator.pop(context, "Page 3");
  }
}
