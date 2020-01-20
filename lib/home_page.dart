import 'package:flutter/material.dart';
import 'package:flutter_widgets/pages/hello_page1.dart';
import 'package:flutter_widgets/pages/hello_page2.dart';
import 'package:flutter_widgets/pages/hello_page3.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello Fluter"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildText(),
            _buildPageView(),
            _buildButtons(context),
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

  _buildButtons(context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton(context, "ListView", () => _onClickNavigator(context, HelloPage1())),
            _buildButton(context, "Page 2", () => _onClickNavigator(context, HelloPage2())),
            _buildButton(context, "Page 3",() => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildButton(context, "Snack", () => _onClickSnack),
            _buildButton(context, "Dialog", () => _onClickDialog()),
            _buildButton(context, "Toast", () => _onClickToast()),
          ],
        )
      ],
    );
  }

  Function _onClickSnack() {
    print("_onClickSnack");
  }

  Function _onClickDialog() {}

  Function _onClickToast() {}

  _buildButton(context, String text, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String retorno = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return page;
    }));
    print(retorno);
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
