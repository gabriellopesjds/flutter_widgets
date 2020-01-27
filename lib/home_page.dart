import 'package:flutter/material.dart';
import 'package:flutter_widgets/nav/nav.dart';
import 'package:flutter_widgets/pages/hello_page1.dart';
import 'package:flutter_widgets/pages/hello_page2.dart';
import 'package:flutter_widgets/pages/hello_page3.dart';
import 'package:flutter_widgets/pages/listview_page_example.dart';
import 'package:flutter_widgets/pages/listview_teste.dart';
import 'package:flutter_widgets/widgets/blue_button.dart';

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

  _buildButtons() {
    return Builder(
      builder: (BuildContext context) {
        return Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("ListView",
                    () => _onClickNavigator(context, ListViewPageExample())),
                BlueButton("Page 2",
                    () => _onClickNavigator(context, ListViewTeste())),
                BlueButton(
                    "Page 3", () => _onClickNavigator(context, HelloPage3())),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                BlueButton("Snack", () => _onClickSnack(context)),
                BlueButton("Dialog", () => _onClickDialog(context)),
                BlueButton("Toast", () => _onClickToast()),
              ],
            )
          ],
        );
      },
    );
  }

  Function _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        "Clicou no Snack :P",
        style: TextStyle(
          color: Colors.red,
        ),
      ),
      action: SnackBarAction(
        label: "DESFAZER",
        textColor: Colors.amber,
        onPressed: () {
          print("Clicou");
        },
      ),
    ));
  }

  Function _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              title: Text("Title Alert Dialog Flutter"),
              content: Text("Content Alert Dialog Flutter"),
              actions: <Widget>[
                FlatButton(
                  child: Text("CANCELAR"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    print("Clicou no OK !!!");
                  },
                ),
              ],
            ),
          );
        });
  }

  Function _onClickToast() {}

  void _onClickNavigator(BuildContext context, Widget page) async {
    String retorno = await push(context, page);
    print(retorno);
  }

  _buildImg(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
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
