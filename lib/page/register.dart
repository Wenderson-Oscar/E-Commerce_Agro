import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/page/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmarpasswordController =
      TextEditingController();

  Future<void> cadastrar(BuildContext context) async {
    final name = nameController.text;
    final email = emailController.text;
    final phone = phoneController.text;
    final password = passwordController.text;
    final confirmarpassword = confirmarpasswordController.text;

    if (password != confirmarpassword) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('As senhas não correspondem.'),
        ),
      );
      return;
    }

    final url = Uri.parse('http://10.8.30.139:8000/create_user/');

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'email': email,
          'phone': phone,
          'password': password,
        }));

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cadastro realizado com sucesso!'),
        ),
      );
      Timer(Duration(seconds: 2), () {
        Navigator.of(context).pop();
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Falha ao cadastrar. Tente novamente.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:
                    EdgeInsets.fromLTRB(11 * fem, 119 * fem, 12 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 83 * fem),
                      child: Text(
                        'Cadastro',
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
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 16 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        border: Border.all(color: Color(0xff148a8a)),
                      ),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 9 * fem),
                          hintText: 'nome',
                          hintStyle: TextStyle(color: Color(0xb2000000)),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        border: Border.all(color: Color(0xff148a8a)),
                      ),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 9 * fem),
                          hintText: 'Número de telefone',
                          hintStyle: TextStyle(color: Color(0xb2000000)),
                        ),
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
                        controller: emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 9 * fem),
                          hintText: 'E-mail',
                          hintStyle: TextStyle(color: Color(0xb2000000)),
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
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 9 * fem),
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Color(0xb2000000)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 45 * fem),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        border: Border.all(color: Color(0xff148a8a)),
                      ),
                      child: TextField(
                        obscureText: true,
                        controller: confirmarpasswordController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(
                              10 * fem, 10 * fem, 10 * fem, 9 * fem),
                          hintText: 'Repita a Senha',
                          hintStyle: TextStyle(color: Color(0xb2000000)),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          10 * fem, 0 * fem, 12.77 * fem, 0 * fem),
                      width: double.infinity,
                      height: 42.9 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.1376318932 * fem),
                      ),
                      child: TextButton(
                        onPressed: () => cadastrar(context),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff148a8a),
                            borderRadius:
                                BorderRadius.circular(4.1376318932 * fem),
                          ),
                          child: Center(
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
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30 * fem),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Voltar',
                          style: TextStyle(
                            color: Color(0xff148a8a),
                            fontSize: 16, // Define o tamanho da fonte como 16
                            fontWeight: FontWeight
                                .bold, // Define o peso da fonte como negrito
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10 * fem),
                            side: BorderSide(color: Color(0xff148a8a)),
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
