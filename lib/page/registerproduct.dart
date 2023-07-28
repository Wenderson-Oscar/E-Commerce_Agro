import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

    
class RegisterProduct extends StatefulWidget {
  final int userId;

  RegisterProduct({required this.userId});
  @override
  _RegisterProductState createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController valueController = TextEditingController();
  final TextEditingController urlImagemProdutoController = TextEditingController();

  XFile? image;

  void createProduct() async {
    final url = Uri.parse('http://10.8.8.10:8000/create_product/${widget.userId}/');
    final request = http.MultipartRequest('POST', url);

    request.fields['name'] = nameController.text;
    request.fields['description'] = descriptionController.text;
    request.fields['value'] = valueController.text;

    final response = await request.send();
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
        )
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Erro ao cadastrar um produto!'),
        )
      );
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
            Padding(
                          padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Badge(),
                              ElevatedButton(
                                onPressed: ()async{
                                  image = await ImagePicker().pickImage(
                                      source: ImageSource.gallery
                                    );
                                    setState(() {
                                      if (image != null){
                                        
                                        urlImagemProdutoController.text = image!.path;
                                      }
                                    });
                                },
                                style: ElevatedButton.styleFrom(
                                ), 
                                child: Text(
                                  "Escolher imagem",
                                  style: TextStyle(
                                  ),
                                )
                              )
                            ],
                          )
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