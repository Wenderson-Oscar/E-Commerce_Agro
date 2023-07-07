import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class RegisterProduct extends StatefulWidget {
  @override
  _RegisterProductState createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  Uint8List? profile;

  void createProduct() async {
    final url = Uri.parse('http://10.8.30.139:8000/create_product/');
    final request = http.MultipartRequest('POST', url);

    request.fields['name'] = nameController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['value'] = valueController.text;

    if (profile != null) {
      final file = http.MultipartFile.fromBytes('profile', profile!);
      request.files.add(file);
    }

    final response = await request.send();

    if (response.statusCode == 201) {
      // Produto criado com sucesso
      // Realize as ações necessárias, como exibir uma mensagem de sucesso, limpar os campos do formulário, etc.
    } else {
      // Houve um erro ao criar o produto
      // Exiba uma mensagem de erro adequada ou realize as ações necessárias para lidar com o erro
    }
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      final imageBytes = await pickedImage.readAsBytes();
      setState(() {
        profile = imageBytes;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Produto'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nome do Produto',
              ),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Descrição',
              ),
            ),
            TextField(
              controller: valueController,
              decoration: InputDecoration(
                labelText: 'Valor',
              ),
            ),
            SizedBox(height: 16.0),
            GestureDetector(
              onTap: _pickImage,
              child: profile != null
                  ? Image.memory(
                      profile!,
                      height: 200.0,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 200.0,
                      color: Colors.grey[300],
                      child: Icon(Icons.camera_alt),
                      alignment: Alignment.center,
                    ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: createProduct,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}