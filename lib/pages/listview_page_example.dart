import 'package:flutter/material.dart';

class ListViewPageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _buildImg("assets/images/dog1.png"),
        _buildImg("assets/images/dog2.png"),
        _buildImg("assets/images/dog3.png"),
        _buildImg("assets/images/dog4.png"),
        _buildImg("assets/images/dog5.png")
      ],
    );
  }

  _buildImg(String path) {
    return Image.asset(
      path,
    );
  }


}
