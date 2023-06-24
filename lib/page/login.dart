import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:myapp/page/listing.dart';
import 'package:myapp/controller/utils.dart';
import 'package:myapp/page/register.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupic8c3Ta (FccFgX1EveY3NEXrFsic8C)
              padding: EdgeInsets.fromLTRB(63.5 * fem, 168 * fem, 83.5 * fem, 31 * fem),
              width: double.infinity,
              child: Align(
                // comrcioagroLha (14:409)
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: 228 * fem,
                    ),
                    child: Text(
                      'Comércio Agro',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 48 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.2125 * ffem / fem,
                        color: Color(0xdd003a06),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              // autogroupslrpYoe (FccGS5azLeJ4g9uz5SsLrp)
              padding: EdgeInsets.fromLTRB(22 * fem, 15.01 * fem, 23 * fem, 169.59 * fem),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // group10sL8 (14:393)
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 21.53 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // group68QMz (14:404)
                          margin: EdgeInsets.fromLTRB(9.63 * fem, 0 * fem, 20.56 * fem, 7.27 * fem),
                          width: double.infinity,
                          child: TextField(
                            obscureText: false,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Color(0xff9d9d9d)),
                            ),
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // linecampk2Y (14:410)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 29.73 * fem),
                          padding: EdgeInsets.fromLTRB(0.72 * fem, 0 * fem, 0.72 * fem, 0 * fem),
                          width: 329 * fem,
                          height: 4 * fem,
                          child: Container(
                            // autogroup4xmiFzt (FccH3tteMxqbogPH3R4xmi)
                            width: double.infinity,
                            height: 1.5 * fem,
                          ),
                        ),
                        Container(
                          // group68QMz (14:404)
                          margin: EdgeInsets.fromLTRB(9.63 * fem, 0 * fem, 20.56 * fem, 7.27 * fem),
                          width: double.infinity,
                          child: TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintText: 'Senha',
                              hintStyle: TextStyle(color: Color(0xff9d9d9d)),
                            ),
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xff000000),
                            ),
                          ),
                        ),
                        Container(
                          // linecampsmN (14:414)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 1 * fem, 7 * fem),
                          padding: EdgeInsets.fromLTRB(0.72 * fem, 0 * fem, 0.72 * fem, 0 * fem),
                          width: 329 * fem,
                          height: 4 * fem,
                          child: Container(
                            // autogroupdfreo9E (FccHDDxS9Mk4FvFpSMdfRE)
                            width: double.infinity,
                            height: 1.5 * fem,
                          ),
                        ),
                        Container(
                          // group60RwJ (14:396)
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0.77 * fem, 26.01 * fem),
                          child: TextButton(
                            onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ListerProducts()),
                                    );
                                  },
                            child: Container(
                              width: 329.23 * fem,
                              height: 43.32 * fem,
                              decoration: BoxDecoration(
                                color: Color(0xff148a8a),
                                borderRadius: BorderRadius.circular(4.1376318932 * fem),
                              ),
                              child: Center(
                                child: Text(
                                  'Entrar',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xfff3f3f3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          // group127T7J (14:401)
                          margin: EdgeInsets.fromLTRB(67 * fem, 0 * fem, 64.16 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // notemcontaZRE (14:403)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 6.84 * fem, 0.47 * fem),
                                child: Text(
                                  'Não tem conta?',
                                  style: SafeGoogleFont(
                                    'Poppins',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w400,
                                    height: 1.5 * ffem / fem,
                                    color: Color(0xff9d9d9d),
                                  ),
                                ),
                              ),
                              Container(
                                // criarcontasB2 (14:402)
                                margin: EdgeInsets.fromLTRB(0 * fem, 0.47 * fem, 0 * fem, 0 * fem),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Register()),
                                    );
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Text(
                                    'Criar conta',
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.5 * ffem / fem,
                                      color: Color(0xff148a8a),
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
