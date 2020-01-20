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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildText(),
            _buildPageView(),
            _buildButtons(),
          ],
        ));
  }

  Container _buildPageView() {
    return Container(
            height: 300,
            child: PageView(
              children: <Widget>[
                _buildImg("assets/images/dog1.png"),
                _buildImg("assets/images/dog2.png"),
                _buildImg("assets/images/dog3.png"),
                _buildImg("assets/images/dog4.png"),
                _buildImg("assets/images/dog5.png")
              ],
            ),
          );
  }

  Column _buildButtons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton("ListView"),
            _buildButton("Page 2"),
            _buildButton("Page 3"),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton("Snack"),
            _buildButton("Dialog"),
            _buildButton("Toast"),
          ],
        )
      ],
    );
  }

  _buildButton(String text) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () => _onClickOk(),
    );
  }

  _onClickOk() {
    print("Clicou no botão!");
  }

  _buildImg(String path) {
    return Image.asset(
      path,
    );
  }

  Text _buildText() {
    return Text(
      "Bem Vindo!",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
      ),
    );
  }
}
