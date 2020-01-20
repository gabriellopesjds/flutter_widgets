import 'package:flutter/material.dart';
import 'package:flutter_widgets/nav/nav.dart';
import 'package:flutter_widgets/widgets/blue_button.dart';

class HelloPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Page 2"),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(context) {
    return Center(
      child: BlueButton("Voltar", () => _onClickVoltar(context)),
    );
  }

  _onClickVoltar(context){
    pop(context, "Page 2");
  }
}
