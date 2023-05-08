// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_kendrew/home/ui_home.dart';
import 'package:uas_kendrew/themes/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  textFieldLogin(texthint) {
    return TextField(
      readOnly: false,
      // controller:
      //     _controllerJumlahBarangTambahPenjualan,
      showCursor: false,
      style: GoogleFonts.notoSans(
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintText: texthint,
        hintStyle: GoogleFonts.notoSans(
          fontWeight: FontWeight.w500,
          fontSize: 15,
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: darkText, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: darkText, width: 0.5),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(color: darkText, width: 0.5),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  height: 120,
                  image: AssetImage(
                    "lib/assets/images/logo.jpg",
                  ),
                ),
                Center(
                  child: Text(
                    "LOG IN",
                    style: GoogleFonts.notoSans(
                      fontSize: 35,
                      color: darkText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(115, 80, 115, 50),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Username",
                        style: GoogleFonts.notoSans(
                          fontSize: 18,
                          color: darkText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      textFieldLogin("Masukkan Nama Pengguna"),
                      const SizedBox(height: 30),
                      Text(
                        "Kata Sandi",
                        style: GoogleFonts.notoSans(
                          fontSize: 18,
                          color: darkText,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      textFieldLogin("Masukkan Kata Sandi"),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.only(top: 17, bottom: 17),
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const HomePage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Masuk",
                                style: GoogleFonts.notoSans(
                                  color: lightText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
