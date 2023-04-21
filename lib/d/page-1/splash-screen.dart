import 'package:flutter/material.dart';

class Scene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 430;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Container(
      width: double.infinity,
      child: Container(
        // splashscreenHZA (0:14)
        width: double.infinity,
        height: 932 * fem,
        decoration: BoxDecoration(
          color: Color(0xfff2f2f2),
        ),
        child: Stack(
          children: [
            Positioned(
              // bgint (0:15)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 430 * fem,
                  height: 932 * fem,
                  child: Image.asset(
                    'assets/page-1/images/bg.png',
                    width: 430 * fem,
                    height: 932 * fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // rectangle79yyi (0:18)
              left: 0 * fem,
              top: 0 * fem,
              child: Align(
                child: SizedBox(
                  width: 430 * fem,
                  height: 932 * fem,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0, -1),
                        end: Alignment(0, 1),
                        colors: <Color>[Color(0xff0582ca), Color(0xff020d12)],
                        stops: <double>[0, 1],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // frame37dYU (0:19)
              left: 0 * fem,
              top: 0 * fem,
              child: Container(
                width: 474.53 * fem,
                height: 1037.63 * fem,
                child: Stack(
                  children: [
                    Positioned(
                      // group15o5a (0:20)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Container(
                        width: 474.53 * fem,
                        height: 1034.27 * fem,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              // Jo2 (0:35)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 9.71 * fem, 0 * fem),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // rectangle335hJ (0:36)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 152.07 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-33.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle66zZN (0:38)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 25.15 * fem),
                                    width: 152.07 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-66.png',
                                    ),
                                  ),
                                  Container(
                                    // rectangle37WGp (0:39)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 152.07 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-37.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle42SAU (0:37)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 152.07 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-42.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle47jQU (0:41)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10.78 * fem),
                                    width: 152.07 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-47.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle70T5a (0:40)
                                    width: 152.07 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-70.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // nde (0:28)
                              margin: EdgeInsets.fromLTRB(
                                  0 * fem, 0 * fem, 10.78 * fem, 75.49 * fem),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // rectangle34K7n (0:29)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-34.png',
                                    ),
                                  ),
                                  Container(
                                    // rectangle67FGL (0:31)
                                    margin: EdgeInsets.fromLTRB(0 * fem,
                                        0 * fem, 0 * fem, 100.65 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-67.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle38yi8 (0:32)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-38.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle43SLp (0:30)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10.78 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-43.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle45aC8 (0:34)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-45.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle716RN (0:33)
                                    width: 150.99 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-71.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              // EXa (0:21)
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    // rectangle35r3A (0:23)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-35.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle68aUx (0:25)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 25.15 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-68.png',
                                    ),
                                  ),
                                  Container(
                                    // rectangle39i5N (0:26)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-39.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle44pu6 (0:24)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 9.71 * fem),
                                    width: 150.99 * fem,
                                    height: 152.07 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-44.png',
                                    ),
                                  ),
                                  Container(
                                    // rectangle48Zbn (0:22)
                                    margin: EdgeInsets.fromLTRB(
                                        0 * fem, 0 * fem, 0 * fem, 10.78 * fem),
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-48.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    // rectangle72gwJ (0:27)
                                    width: 150.99 * fem,
                                    height: 150.99 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-72.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      // rectangle82RP6 (0:42)
                      left: 0 * fem,
                      top: 0 * fem,
                      child: Align(
                        child: SizedBox(
                          width: 430 * fem,
                          height: 786 * fem,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0, -1),
                                end: Alignment(0, 1),
                                colors: <Color>[
                                  Color(0x00020d12),
                                  Color(0xff021f2e)
                                ],
                                stops: <double>[0, 1],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              // buttonsJBz (0:48)
              left: 75 * fem,
              top: 847 * fem,
              child: Container(
                width: 280 * fem,
                height: 51 * fem,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3f000000),
                      offset: Offset(10 * fem, 14 * fem),
                      blurRadius: 22 * fem,
                    ),
                  ],
                ),
                child: Container(
                  // buttonselectedn7A (I0:48;1:1105)
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xfff2f2f2)),
                    color: Color(0xff0582ca),
                    borderRadius: BorderRadius.circular(10 * fem),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x26000000),
                        offset: Offset(2 * fem, 2 * fem),
                        blurRadius: 5 * fem,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      'Get Start',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color(0xfff2f2f2),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // shareyourbusinesswithbrandingp (0:49)
              left: 40 * fem,
              top: 720 * fem,
              child: Align(
                child: SizedBox(
                  width: 350 * fem,
                  height: 90 * fem,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 32 * ffem,
                        fontWeight: FontWeight.w600,
                        height: 1.5 * ffem / fem,
                        color: Color(0xffeaeaea),
                      ),
                      children: [
                        TextSpan(
                          text: 'Share Your Business\n',
                          style: TextStyle(
                            fontSize: 34 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: Color(0xfffe8116),
                          ),
                        ),
                        TextSpan(
                          text: 'with Branding Post...',
                          style: TextStyle(
                            fontSize: 26 * ffem,
                            fontWeight: FontWeight.w600,
                            height: 1.5 * ffem / fem,
                            color: Color(0xffeaeaea),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
