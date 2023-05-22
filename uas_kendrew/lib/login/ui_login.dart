// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_kendrew/global_var.dart';
import 'package:uas_kendrew/home/ui_home.dart';
import 'package:uas_kendrew/login/service_login.dart';
import 'package:uas_kendrew/themes/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final ctrlUsername = TextEditingController();
  final ctrlPassword = TextEditingController();

  AuthService authService = AuthService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ctrlUsername.dispose();
    ctrlPassword.dispose();
  }

  // ========== Write/Read SharedPref ========== //
  Future<void> setAuthPref(String userID, int userStatus) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', userID);
    await prefs.setInt('userStatus', userStatus);
  }

  Future<void> getAuthPref() async {
    final prefs = await SharedPreferences.getInstance();

    userID = prefs.getString('userID') ?? "";
    userStatus = prefs.getInt('userStatus') ?? 0;
  }
  // ========== Write/Read SharedPref ========== //

  textFieldLogin(texthint, controller) {
    return TextField(
      readOnly: false,
      controller: controller,
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

  // ========== Func Login ========== //
  Future login(context, TextEditingController username,
      TextEditingController password) async {
    var response = await authService.login(
      username.text,
      password.text,
    );
    if (response[0] == 200) {
      // Write Pref
      setAuthPref(
        response[2]['id_user'],
        response[2]['status_akun'],
      ).then((value) {
        // then navigate to Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      });
    } else {
      // Show snackbar message if user not found
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "User not found",
          ),
        ),
      );
    }
  }
  // ========== Func Login ========== //

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
                      textFieldLogin("Masukkan Nama Pengguna", ctrlUsername),
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
                      textFieldLogin("Masukkan Kata Sandi", ctrlPassword),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: TextButton.styleFrom(
                                padding:
                                    const EdgeInsets.only(top: 17, bottom: 17),
                                backgroundColor: buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                // ========== Call Func Login ========== //
                                login(context, ctrlUsername, ctrlPassword);
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
