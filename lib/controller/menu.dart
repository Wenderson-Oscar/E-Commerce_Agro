import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/page/listing.dart';
import 'package:myapp/page/listingproducts.dart';
import 'package:myapp/page/login.dart';
import 'package:myapp/page/perfil.dart';
import 'package:myapp/page/registerproduct.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
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
            title: const Text('Perfil'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserProfile()),
              );
            },
          ),
          ListTile(
            title: const Text('Listar Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListerProducts()),
              );
            },
          ),
          ListTile(
            title: const Text('Listar meus Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ListProductsSell()),
              );
            },
          ),
          ListTile(
            title: const Text('Cadastrar Produtos'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RegisterProduct()),
              );
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SystemInfoPopup();
                },
              );
            },
          ),
           ListTile(
            title: Text('Sair'),
            onTap: () {
              SystemChannels.platform.invokeMethod<void>('SystemNavigator.pop');
            },
          ),
        ],
      ),
    );
  }
}

class SystemInfoPopup extends StatelessWidget {
  const SystemInfoPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Sobre o Sistema'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
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
          child: const Text('Fechar'),
        ),
      ],
    );
  }
}
