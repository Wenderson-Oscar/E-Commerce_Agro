import 'package:flutter/material.dart';
import 'package:myapp/page/listing.dart';
import 'package:myapp/page/listingproducts.dart';
import 'package:myapp/page/login.dart';
import 'package:myapp/page/registerperfil.dart';
import 'package:myapp/page/registerproduct.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xff148a8a),
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterAccount()),
              );
            },
          ),
          ListTile(
            title: Text('Listar Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListerProducts()),
              );
            },
          ),
          ListTile(
            title: Text('Listar meus Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListProductsSell()),
              );
            },
          ),
          ListTile(
            title: Text('Cadastrar Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterProduct()),
              );
            },
          ),
          ListTile(
            title: Text('Sobre'),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SystemInfoPopup();
                },
              );
            },
          ),
          ListTile(
            title: Text('Sair'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SystemInfoPopup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Sobre o Sistema'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Versão: 1.0.0'),
          SizedBox(height: 10),
          Text('Desenvolvido por: Wenderson Oscar'),
          SizedBox(height: 10),
          Text('Descrição: Sistema de E-commerce de produtos do Agro.'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Fechar'),
        ),
      ],
    );
  }
}
