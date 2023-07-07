import 'package:flutter/material.dart';
import 'package:myapp/controller/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isLoading = true;
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Inicializar os controladores com os dados existentes
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final url = Uri.parse('http://10.8.30.139:8000/get_user/1/');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final userData = jsonDecode(response.body);
      setState(() {
        nameController.text = userData['name'];
        emailController.text = userData['email'];
        phoneController.text = userData['phone'];
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      _showSnackBar(context, 'Erro ao carregar os dados do usuário');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      drawer: MenuDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 50.0,
                      // TODO: Adicione a imagem do usuário aqui
                    ),
                  ),
                  SizedBox(height: 24.0),
                  Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Nome',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          buildEditableField(
                            label: 'Nome',
                            controller: nameController,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'E-mail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          buildEditableField(
                            label: 'E-mail',
                            controller: emailController,
                          ),
                          SizedBox(height: 16.0),
                          Text(
                            'Telefone',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          buildEditableField(
                            label: 'Telefone',
                            controller: phoneController,
                          ),
                          SizedBox(height: 16.0),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  isEditing = !isEditing;
                                });
                              },
                              child: Text(isEditing ? 'Salvar' : 'Editar'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildEditableField({
    required String label,
    required TextEditingController controller,
  }) {
    return isEditing
        ? TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          )
        : Text(
            controller.text,
            style: TextStyle(fontSize: 16.0),
          );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
