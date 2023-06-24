import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page/login.dart';

class Register extends StatelessWidget {
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
                  padding: EdgeInsets.fromLTRB(11 * fem, 119 * fem, 12 * fem, 0 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 83 * fem),
                        child: Text(
                          'Cadastro',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            fontSize: 44 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff215426),
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
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Nome',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff000000),
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
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Número',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(11 * fem, 17 * fem, 12 * fem, 213.1 * fem),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 16 * fem),
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
                            contentPadding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'E-mail',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff000000),
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
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Senha',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 45 * fem),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10 * fem),
                          border: Border.all(color: Color(0xff148a8a)),
                        ),
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(10 * fem, 10 * fem, 10 * fem, 9 * fem),
                            hintText: 'Repita a Senha',
                            hintStyle: TextStyle(color: Color(0xb2000000)),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff000000),
                          ),
                        ),
                      ),
                      Container(
                        
                        margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 12.77 * fem, 0 * fem),
                        width: double.infinity,
                        height: 42.9 * fem,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.1376318932 * fem),
                        ),
                        child: TextButton(
                          onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => Login()),
                                    );
                                  },
                          child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xff148a8a),
                              borderRadius: BorderRadius.circular(4.1376318932 * fem),
                            ),
                            child: Center(
                              child: Text(
                                'Cadastrar',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
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
                      margin: EdgeInsets.only(bottom: 30 * fem),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Voltar',
                          style: GoogleFonts.inter(
                            fontSize: 15 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.2125 * ffem / fem,
                            color: Color(0xff215426),
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
