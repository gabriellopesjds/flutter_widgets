import 'package:flutter/material.dart';
import 'package:flutter_widgets/nav/nav.dart';
import 'package:flutter_widgets/pages/hello_page1.dart';
import 'package:flutter_widgets/pages/hello_page2.dart';
import 'package:flutter_widgets/pages/hello_page3.dart';
import 'package:flutter_widgets/pages/listview_page_example.dart';
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
            //_buildText(),
            _buildPageView(),
            _buildPageView(),
            _buildPageView(),
            //_buildButtons(context),
          ],
        ));
  }

    _buildPageView() {
    return Expanded(
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
            BlueButton("ListView", () => _onClickNavigator(context, ListViewPageExample())),
            BlueButton("Page 2", () => _onClickNavigator(context, HelloPage2())),
            BlueButton("Page 3",() => _onClickNavigator(context, HelloPage3())),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            BlueButton("Snack", () => _onClickSnack),
            BlueButton("Dialog", () => _onClickDialog()),
            BlueButton("Toast", () => _onClickToast()),
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

  void _onClickNavigator(BuildContext context, Widget page) async {
    String retorno = await push(context, page);
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
