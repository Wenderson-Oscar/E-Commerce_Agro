import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page/listing.dart';
import 'package:myapp/controller/menu.dart';

class RegisterAccount extends StatelessWidget {
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
          'Cadastro',
          style: GoogleFonts.inter(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Color(0xff215426),
          ),
        ),
      ),
      drawer: MenuDrawer(),
      body: Container(
        width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 348 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      left: 11 * fem,
                      top: 256 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 352 * fem,
                          height: 38 * fem,
                          child: Container(
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
                                hintText: 'Link do Instagram',
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
                        ),
                      ),
                    ),
                    Positioned(
                      left: 11 * fem,
                      top: 310 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 352 * fem,
                          height: 38 * fem,
                          child: Container(
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
                                hintText: 'Link do Whatsapp',
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
                        ),
                      ),
                    ),
                    Positioned(
                      left: 67.5 * fem,
                      top: 119 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 241 * fem,
                          height: 107 * fem,
                          child: Text(
                            'Cadastrar \nLinks',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(
                              fontSize: 44 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.2125 * ffem / fem,
                              color: Color(0xff215426),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(
                    22 * fem, 31 * fem, 23.77 * fem, 0 * fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 73.1 * fem),
                      width: double.infinity,
                      height: 42.9 * fem,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4.1376318932 * fem),
                      ),
                      child: TextButton(
                        onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => ListerProducts()),
                                    );
                                  },
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
                  ],
                ),
              ),
            ],
          ),
        ),
      );
  }
}
