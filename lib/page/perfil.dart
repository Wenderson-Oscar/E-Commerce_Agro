import 'package:flutter/material.dart';
import 'package:myapp/controller/menu.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  bool isEditing = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Inicializar os controladores com os dados existentes
    nameController.text = 'John Doe';
    emailController.text = 'johndoe@gmail.com';
    phoneController.text = '(123) 456-7890';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50.0,
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
                    buildField('Nome', nameController),
                    buildField('E-mail', emailController),
                    buildField('Telefone', phoneController),
                    SizedBox(height: 16.0),
                    if (!isEditing)
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = true;
                            });
                          },
                          child: Text('Editar'),
                        ),
                      ),
                    if (isEditing)
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              isEditing = false;
                            });
                            _showSnackBar(context, 'Alterado com sucesso');
                          },
                          child: Text('Salvar'),
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

  Widget buildField(String label, TextEditingController controller) {
    return isEditing
        ? TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          )
        : ListTile(
            title: Text('$label: ${controller.text}'),
          );
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
