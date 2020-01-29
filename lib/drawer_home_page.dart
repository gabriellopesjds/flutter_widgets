import 'package:flutter/material.dart';

class DrawerHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Gabriel Lopes"),
              accountEmail: Text("gabriel.lopesjds@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/dog1.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Mais Informações ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Clicou no item Favoritos :P",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  action: SnackBarAction(
                    label: "OK",
                    textColor: Colors.amber,
                    onPressed: () {
                      print("Clicou");
                    },
                  ),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Obter ajuda ..."),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(
                    "Clicou no item Ajuda:P",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  action: SnackBarAction(
                    label: "OK",
                    textColor: Colors.amber,
                    onPressed: () {
                      print("Clicou");
                    },
                  ),
                ));
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Clicou em Logout"),
                  action: SnackBarAction(
                    label: "OK",
                    onPressed: () {},
                  ),
                ));
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
