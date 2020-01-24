import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widgets/nav/nav.dart';
import 'package:flutter_widgets/pages/listview_detail.dart';

class Dog {
  String nome;
  String foto;

  Dog(this.nome, this.foto);
}

class ListViewPageExample extends StatefulWidget {
  @override
  _ListViewPageExampleState createState() => _ListViewPageExampleState();
}

class _ListViewPageExampleState extends State<ListViewPageExample> {
  bool _gridViewOn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ListView",
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridViewOn = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridViewOn = true;
              });
            },
          )
        ],
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

    if (_gridViewOn) {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: listDog.length,
        itemBuilder: (context, index) {
          return _itemView(listDog, index);
        },
      );
    } else {
      return ListView.builder(
        itemExtent: 350,
        itemCount: listDog.length,
        itemBuilder: (context, index) {
          return _itemView(listDog, index);
        },
      );
    }
  }

  _itemView(List<Dog> listDog, int index) {
    return GestureDetector(
      onTap: (){
        push(context, ListViewDetail(listDog[index]));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _buildImg(listDog[index].foto),
          Container(
            alignment: Alignment.bottomLeft,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.black45),
              child: Text(
                listDog[index].nome,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildImg(String path) {
    return Image.asset(
      path,
      fit: BoxFit.cover,
    );
  }
}
