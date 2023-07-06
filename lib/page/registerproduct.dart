import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/page/listing.dart';
import 'package:myapp/controller/menu.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


class RegisterProduct extends StatefulWidget {
  @override
  _RegisterProductState createState() => _RegisterProductState();
}

class _RegisterProductState extends State<RegisterProduct> {
  File? _imageFile;

 Future<void> _pickImage() async {
  final imagePicker = ImagePicker();
  final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);

  if (pickedImage != null) {
  }
}
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        title: Text(
          'Cadastro de produtos',
        ),
      ),
      drawer: MenuDrawer(),
      body: Container(
        width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(
                      11 * fem, 119 * fem, 12 * fem, 0 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 83 * fem),
                        child: Text(
                          'Cadastrar Produto',
                          textAlign: TextAlign.center,
                           style: TextStyle(
                      fontSize: 48 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xdd003a06),
                    ),
                        ),
                      ),
                   Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10 * fem),
                      border: Border.all(color: Color(0xff148a8a)),
                    ),
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: _imageFile != null
                          ? Image.file(
                              _imageFile!,
                              height: 120,
                              fit: BoxFit.cover,
                            )
                          : Column(
                              children: [
                                Container(
                                  height: 120,
                                  child: Icon(Icons.upload_outlined),
                                ),
                                Text(
                                  'Faça o upload da imagem',
                                  style: TextStyle(color: Color(0xb2000000)),
                                ),
                              ],
                            ),
                    ),
                  ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: Color(0xff148a8a)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(
                                10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Nome do produto',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          )
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: Color(0xff148a8a)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(
                                10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'descrição',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          )
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(
                      11 * fem, 17 * fem, 12 * fem, 213.1 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: Color(0xff148a8a)),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(
                                10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Valor: 00,00',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            0 * fem, 0 * fem, 0 * fem, 16 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: Color(0xff148a8a)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            10 * fem, 0 * fem, 12.77 * fem, 0 * fem),
                        width: double.infinity,
                        height: 42.9 * fem,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(4.1376318932 * fem),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ListerProducts()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Color(0xff148a8a),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(4.1376318932 * fem),
                            ),
                          ),
                          child: Text(
                            'Cadastrar',
                            textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xfff3f3f3),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}
