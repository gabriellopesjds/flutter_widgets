import 'package:flutter/material.dart';
import 'package:flutter_widgets/drawer_home_page.dart';
import 'package:flutter_widgets/nav/nav.dart';
import 'package:flutter_widgets/pages/hello_page1.dart';
import 'package:flutter_widgets/pages/hello_page2.dart';
import 'package:flutter_widgets/pages/hello_page3.dart';
import 'package:flutter_widgets/pages/listview_page_example.dart';
import 'package:flutter_widgets/pages/listview_teste.dart';
import 'package:flutter_widgets/widgets/blue_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Hello Fluter"),
          centerTitle: true,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(text: "TAB1", icon: Icon(Icons.headset)),
              Tab(text: "TAB2", icon: Icon(Icons.headset_mic)),
              Tab(text: "TAB3", icon: Icon(Icons.headset_off)),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            print("ok");
          },
        ),
        drawer: Drawer(
          child: DrawerHomePage(),
        ),
        body: TabBarView(
          children: <Widget>[
            _buildBody(context),
            Container(color: Colors.black),
            Container(color: Colors.green),
          ],
        ),
      ),
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
                BlueButton(
                    "Toast", () => _onClickToast("Testando Toast do Flutter")),
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
                    _onClickToast("Erro ao processar as informações! :/",
                        color: Colors.red);
                  },
                ),
                FlatButton(
                  child: Text("OK"),
                  onPressed: () {
                    Navigator.pop(context);
                    _onClickToast("Informaçõe gravadas com sucesso! :D",
                        color: Colors.green);
                  },
                ),
              ],
            ),
          );
        });
  }

  Function _onClickToast(String msg, {Color color: Colors.red}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

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
