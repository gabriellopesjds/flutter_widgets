import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dog{
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class ListViewPageExample extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ListView",
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  _buildBody() {
    List<Dog> listDog = [
      Dog("Dog1", "assets/images/dog1.png"),
      Dog("Dog2", "assets/images/dog2.png"),
      Dog("Dog3", "assets/images/dog3.png"),
      Dog("Dog4", "assets/images/dog4.png"),
      Dog("Dog5", "assets/images/dog5.png")
    ];

    return ListView.builder(
      itemCount: listDog.length,
      itemExtent: 300,
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: <Widget>[
            _buildImg(listDog[index].foto),
            Container(
              alignment: Alignment.bottomLeft,
              child: Container(
                margin: EdgeInsets.all(12),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.black45
                ),
                child: Text(
                  listDog[index].nome,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  _buildImg(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
