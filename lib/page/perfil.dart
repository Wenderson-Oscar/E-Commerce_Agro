import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile extends StatefulWidget {
  final int userId;

  UserProfile({required this.userId});
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  Map<String, dynamic>? userData;
  bool isLoading = true;
  bool isEditing = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  void fetchUserData() async {
    try {
      final response = await http.get(
        Uri.parse('http://10.8.8.10:8000/get_user/${widget.userId}/'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          userData = data[0];
          isLoading = false;

          // Inicializar os controladores com os dados existentes
          nameController.text = userData!['name'];
          emailController.text = userData!['email'];
          phoneController.text = userData!['phone'].toString();
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erro'),
            content: Text('Falha ao obter os dados do usuário.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Erro de conexão.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void saveChanges() async {
    try {
      final response = await http.put(
        Uri.parse('http://10.8.8.10:8000/update_user/${widget.userId}/'),
        body: {
          'name': nameController.text,
          'email': emailController.text,
          'phone': phoneController.text,
        },
      );
      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Sucesso'),
            content: Text('Alterações salvas com sucesso.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
        setState(() {
          isEditing = false;
        });
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Erro'),
            content: Text('Falha ao salvar as alterações.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Erro'),
          content: Text('Erro de conexão.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : userData == null
              ? Center(child: Text('Dados do usuário não disponíveis.'))
              : ListView(
                  padding: EdgeInsets.all(16.0),
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(userData!['profile']),
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'Nome:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    isEditing
                        ? TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              labelText: 'Nome',
                            ),
                          )
                        : Text(
                            userData!['name'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                    SizedBox(height: 16.0),
                    Text(
                      'E-mail:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    isEditing
                        ? TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              labelText: 'E-mail',
                            ),
                          )
                        : Text(
                            userData!['email'],
                            style: TextStyle(fontSize: 16.0),
                          ),
                    SizedBox(height: 16.0),
                    Text(
                      'Telefone:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    isEditing
                        ? TextField(
                            controller: phoneController,
                            decoration: InputDecoration(
                              labelText: 'Telefone',
                            ),
                          )
                        : Text(
                            userData!['phone'].toString(),
                            style: TextStyle(fontSize: 16.0),
                          ),
                    SizedBox(height: 16.0),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                        onPressed: isEditing ? saveChanges : () {
                          setState(() {
                            isEditing = true;
                          });
                        },
                        child: Text(isEditing ? 'Salvar' : 'Editar'),
                      ),
                    ),
                  ],
                ),
    );
  }
}
