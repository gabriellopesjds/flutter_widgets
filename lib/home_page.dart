import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Fluter"),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Container _buildBody() {
    return Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Column(
              children: <Widget>[
                _buildButton(),
                _buildButton(),
                _buildButton()
              ],
            ),
            Column(
              children: <Widget>[
                _buildButton(),
                _buildButton(),
                _buildButton()
              ],
            )
          ],
        ));
  }

  _buildButton() {
    return RaisedButton(
        color: Colors.blue,
        child: Text(
          "OK",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () => _onClickOk());
  }

  _onClickOk() {
    print("Clicou no botão!");
  }

  _buildImg() {
    //return Image.network("https://www.clubeparacachorros.com.br/wp-content/uploads/2018/08/pastor-alemao-capa-preta.jpg");
    return Image.asset(
      "assets/images/dog1.png",
      fit: BoxFit.cover,
    );
  }

  Text _buildText() {
    return Text(
      "Bem Vindo!",
      style: TextStyle(
          fontSize: 30,
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red,
          decorationStyle: TextDecorationStyle.double),
    );
  }
}
