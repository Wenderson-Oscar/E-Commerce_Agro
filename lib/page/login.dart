import 'package:flutter/material.dart';
import 'package:myapp/page/listing.dart';
import 'package:myapp/page/register.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Login extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  

  Future<void> realizarLogin(BuildContext context) async {
    final email = emailController.text;
    final senha = senhaController.text;
    final usernamePassword = '$email:$senha';
    final basicAuth = 'Basic ' + base64Encode(utf8.encode(usernamePassword));

    final url = Uri.parse('http://10.8.30.139:8000/login/');

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': basicAuth,
      },
      body:
          jsonEncode({'email': email.toString(), 'password': senha.toString()}),
    );

    if (response.statusCode == 200) {
      // Login bem-sucedido, redirecione para a próxima tela
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListerProducts()),
      );
    } else {
      // Login falhou, exiba uma mensagem de erro
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha ao fazer login. Tente novamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const double baseWidth = 375;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double fem = screenWidth / baseWidth;
    final double ffem = fem * 0.97;

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              63.5 * fem,
              168 * fem,
              83.5 * fem,
              31 * fem,
            ),
            width: double.infinity,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 228 * fem,
                  ),
                  child: Text(
                    'Comércio Agro',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 48 * ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.2125 * ffem / fem,
                      color: const Color(0xdd003a06),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              22 * fem,
              15.01 * fem,
              23 * fem,
              169.59 * fem,
            ),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(
                    0 * fem,
                    0 * fem,
                    0 * fem,
                    21.53 * fem,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          9.63 * fem,
                          0 * fem,
                          20.56 * fem,
                          7.27 * fem,
                        ),
                        width: double.infinity,
                        child: TextField(
                          obscureText: false,
                          controller: emailController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Color(0xff9d9d9d)),
                          ),
                          style: TextStyle(
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0 * fem,
                          0 * fem,
                          1 * fem,
                          29.73 * fem,
                        ),
                        padding: EdgeInsets.fromLTRB(
                          0.72 * fem,
                          0 * fem,
                          0.72 * fem,
                          0 * fem,
                        ),
                        width: 329 * fem,
                        height: 4 * fem,
                        child: Container(
                          width: double.infinity,
                          height: 1.5 * fem,
                          color: Colors.black, // Adjust color as needed
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          9.63 * fem,
                          0 * fem,
                          20.56 * fem,
                          7.27 * fem,
                        ),
                        width: double.infinity,
                        child: TextField(
                          obscureText: true,
                          controller: senhaController,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            hintText: 'Senha',
                            hintStyle: TextStyle(color: Color(0xff9d9d9d)),
                          ),
                          style: TextStyle(
                            fontSize: 14 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0 * fem,
                          0 * fem,
                          1 * fem,
                          7 * fem,
                        ),
                        padding: EdgeInsets.fromLTRB(
                          0.72 * fem,
                          0 * fem,
                          0.72 * fem,
                          0 * fem,
                        ),
                        width: 329 * fem,
                        height: 4 * fem,
                        child: Container(
                          width: double.infinity,
                          height: 1.5 * fem,
                          color: Colors.black, // Adjust color as needed
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          0 * fem,
                          0 * fem,
                          0.77 * fem,
                          26.01 * fem,
                        ),
                        child: TextButton(
                          onPressed: () {
                            realizarLogin(context);
                          },
                          child: Container(
                            width: 329.23 * fem,
                            height: 43.32 * fem,
                            decoration: BoxDecoration(
                              color: const Color(0xff148a8a),
                              borderRadius:
                                  BorderRadius.circular(4.1376318932 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'Entrar',
                                style: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xfff3f3f3),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                          67 * fem,
                          0 * fem,
                          64.16 * fem,
                          0 * fem,
                        ),
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                0 * fem,
                                0 * fem,
                                6.84 * fem,
                                0.47 * fem,
                              ),
                              child: Text(
                                'Não tem conta?',
                                style: TextStyle(
                                  fontSize: 14 * ffem,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5 * ffem / fem,
                                  color: const Color(0xff9d9d9d),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(
                                0 * fem,
                                0.47 * fem,
                                0 * fem,
                                0 * fem,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()),
                                  );
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  'Criar conta',
                                  style: TextStyle(
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: const Color(0xff148a8a),
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
