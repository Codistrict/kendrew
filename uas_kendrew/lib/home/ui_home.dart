// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas_kendrew/home/service_home.dart';
import 'package:uas_kendrew/home/ui_detail_proyek.dart';
import 'package:uas_kendrew/login/ui_login.dart';
import 'package:uas_kendrew/themes/colors.dart';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';

import '../global_var.dart';
import '../themes/floatingactionwidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeService homeService = HomeService();
  late Future allProject;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    // Read all project
    allProject = homeService.readProject();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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

  // ========== Func Finish Project ========== //
  Future finishProject(context, projectID) async {
    var response = await homeService.finishProject(projectID);
    if (response[0] == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response[1],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      );
      allProject =
          homeService.readProject().whenComplete(() => setState(() {}));
    } else {}
  }
  // ========== Func Finish Project ========== //

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.exit_to_app,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {
                setAuthPref("", 0).whenComplete(() {
                  getAuthPref().whenComplete(() {
                    debugPrint(userID);
                    debugPrint("$userStatus");
                  });
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                });
              },
              label: 'Logout',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          SpeedDialChild(
              child: const Icon(
                Icons.add,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuatProjekPage(),
                  ),
                );
              },
              label: 'Tambah Proyek',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          // FAB 2
          SpeedDialChild(
              child: const Icon(
                Icons.history,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () async {},
              label: 'History',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          SpeedDialChild(
              child: const Icon(
                Icons.add,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MasterVendorPage(),
                  ),
                );
              },
              label: 'Master Vendor',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
        ],
      ),
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Kendrew Tandiono",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "Felmel@gmail.com",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(right: 14),
            ),
            Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(360),
                ),
              ),
              child: Image.asset("lib/assets/images/defaultprofile.png"),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(25, 35, 25, 30),
        child: FutureBuilder(
          future: allProject,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List snapData = snapshot.data! as List;
              if (snapData[0] != 404) {
                return ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: GridView.builder(
                    itemCount: snapData[2].length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 6 / 3.5,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailPage(
                                uid: snapData[2][index]['id_proyek'],
                                namaProyek: snapData[2][index]['nama_proyek'],
                              ),
                            ),
                          ).whenComplete(
                            () => allProject = homeService
                                .readProject()
                                .whenComplete(() => setState(() {})),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: darkText,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                "lib/assets/images/back.jpeg"),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8))),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      snapData[2][index]['nama_proyek'],
                                      style: GoogleFonts.notoSans(
                                        fontSize: 14,
                                        color: darkText,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    PopupMenuButton(
                                        color: buttonColor,
                                        itemBuilder: (context) {
                                          return [
                                            PopupMenuItem<int>(
                                              onTap: () {
                                                finishProject(
                                                    context,
                                                    snapData[2][index]
                                                        ['id_proyek']);
                                              },
                                              value: 0,
                                              child: Text(
                                                "Done",
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 13,
                                                  color: lightText,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem<int>(
                                              onTap: () {},
                                              value: 1,
                                              child: Text(
                                                "Edit",
                                                style: GoogleFonts.notoSans(
                                                  fontSize: 13,
                                                  color: lightText,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ];
                                        },
                                        onSelected: (value) {}),
                                  ],
                                ),
                                Text(
                                  snapData[2][index]['penanggungjawab']
                                      .toString(),
                                  style: GoogleFonts.notoSans(
                                    fontSize: 12,
                                    color: darkText,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              } else {
                const Center(
                  child: Text(
                    "Currently no project",
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class BuatProjekPage extends StatefulWidget {
  const BuatProjekPage({super.key});

  @override
  State<BuatProjekPage> createState() => _BuatProjekPageState();
}

class _BuatProjekPageState extends State<BuatProjekPage> {
  HomeService homeService = HomeService();

  final ctrlNamaProyek = TextEditingController();
  final ctrlNamaPerusahaan = TextEditingController();
  final ctrlAlamatPerusahaan = TextEditingController();
  final ctrlJenisGedung = TextEditingController();
  final ctrlJumlahLantai = TextEditingController();
  final ctrlLuasTanah = TextEditingController();
  final ctrlPenanggungJawab = TextEditingController();

  DateTime _selectedDateTglMulaiPekerjaan = DateTime.now();
  String _formattedDateTglMulaiPekerjaan = "";
  String _dateEditTglMulaiPekerjaan = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ctrlNamaProyek.dispose();
    ctrlNamaPerusahaan.dispose();
    ctrlAlamatPerusahaan.dispose();
    ctrlJenisGedung.dispose();
    ctrlJumlahLantai.dispose();
    ctrlLuasTanah.dispose();
    ctrlPenanggungJawab.dispose();
  }

  Future<void> selectFilterDateTglMulaiPekerjaan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglMulaiPekerjaan,
      firstDate: _selectedDateTglMulaiPekerjaan,
      lastDate: DateTime(DateTime.now().year + 10, 12, 31),
      builder: (context, child) {
        return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xff13293D),
                onPrimary: lightText,
                onSurface: darkText,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: Color(0xff13293D), // button text color
                ),
              ),
            ),
            child: child!);
      },
    );
    if (picked != null && picked != _selectedDateTglMulaiPekerjaan) {
      if (mounted) {
        _selectedDateTglMulaiPekerjaan = picked;
        _formattedDateTglMulaiPekerjaan =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglMulaiPekerjaan);
        _dateEditTglMulaiPekerjaan = _formattedDateTglMulaiPekerjaan;

        setState(() {});
      }
    }
  }

  // ========== Func Create Project ========== //
  Future createProject(
      context,
      userID,
      TextEditingController namaProyek,
      TextEditingController jumlahLantai,
      TextEditingController luasTanah,
      TextEditingController penanggungJawab) async {
    var response = await homeService.createProject(
      userID,
      namaProyek.text,
      jumlahLantai.text,
      luasTanah.text,
      penanggungJawab.text,
    );
    if (response[0] == 200) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            response[1],
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Failed to create project",
            overflow: TextOverflow.ellipsis,
            softWrap: true,
          ),
        ),
      );
    }
  }
  // ========== Func Create Project ========== //

  TextFieldYa(text) {
    return TextField(
      readOnly: false,
      controller: text,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  TextFieldYa2(text) {
    return TextField(
      readOnly: false,
      controller: text,
      keyboardType: TextInputType.number,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: lightText,
          //diisi warna nek wes sesuai
          automaticallyImplyLeading: false,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: darkText,
                      size: 50,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Kendrew Tandiono",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Felmel@gmail.com",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 14),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(360),
                      ),
                    ),
                    child: Image.asset("lib/assets/images/defaultprofile.png"),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                  ),
                ],
              ),
            ],
          ),
          //elevation: 0,
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(10),
            child: Divider(
              thickness: 3,
              color: darkText,
            ),
          ),
        ),
        body: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Nama Projek",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlNamaProyek),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Nama Perusahaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlNamaPerusahaan),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Alamat Perusahaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlAlamatPerusahaan),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Jenis Gedung",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlJenisGedung),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Luas Tanah",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa2(ctrlLuasTanah),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Jumlah Lantai",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa2(ctrlJumlahLantai),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Penanggung Jawab",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlPenanggungJawab),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Tanggal Dimulai Pekerjaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: darkText,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(9),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _dateEditTglMulaiPekerjaan,
                                      style: GoogleFonts.notoSans(
                                        color: darkText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          selectFilterDateTglMulaiPekerjaan(
                                                  context)
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                        child:
                                            const Icon(Icons.calendar_month)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                        backgroundColor: buttonColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (ctrlNamaProyek.text != "" &&
                            ctrlJumlahLantai.text != "" &&
                            ctrlLuasTanah.text != "" &&
                            ctrlPenanggungJawab.text != "") {
                          createProject(
                                  context,
                                  userID,
                                  ctrlNamaProyek,
                                  ctrlJumlahLantai,
                                  ctrlLuasTanah,
                                  ctrlPenanggungJawab)
                              .then((value) {
                            ctrlNamaProyek.clear();
                            ctrlJumlahLantai.clear();
                            ctrlLuasTanah.clear();
                            ctrlPenanggungJawab.clear();
                          });
                        }
                      },
                      child: Text(
                        "Submit",
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
            ),
          ),
        ));
  }
}

class MasterVendorPage extends StatefulWidget {
  const MasterVendorPage({Key? key}) : super(key: key);

  @override
  State<MasterVendorPage> createState() => _MasterVendorPageState();
}

class _MasterVendorPageState extends State<MasterVendorPage> {
  HomeService homeService = HomeService();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List lt1 = [
    [
      'pv101',
      'Pembangunan Rumah',
      '45%',
    ],
    [
      'pv102',
      'Nyemen',
      '0%',
    ],
  ];

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => BuatMasterVendorPage()));
        },
        backgroundColor: buttonColor,
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: lightText,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: darkText,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kendrew Tandiono",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Felmel@gmail.com",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(360),
                    ),
                  ),
                  child: Image.asset("lib/assets/images/defaultprofile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    elevation: 15,
                    shadowColor: Colors.black87,
                    color: buttonColor,
                    child: ExpansionTile(
                      maintainState: true,
                      initiallyExpanded: false,
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      expandedAlignment: Alignment.centerLeft,
                      iconColor: buttonColor,
                      collapsedIconColor: buttonColor,
                      title: Column(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  "ID Vendor",
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    letterSpacing: 0.125,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Nama Vendor",
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    letterSpacing: 0.125,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(
                                  "Pekerjaan Vendor",
                                  style: GoogleFonts.nunito(
                                    fontSize: 15,
                                    letterSpacing: 0.125,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: ScrollController(),
                      child: ScrollConfiguration(
                        behavior: ScrollConfiguration.of(context).copyWith(
                          dragDevices: {
                            PointerDeviceKind.touch,
                            PointerDeviceKind.mouse,
                          },
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(),
                          physics: const ClampingScrollPhysics(),
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: scaffoldBackgroundColor,
                                    border: Border.all(
                                      color: darkText,
                                    ),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8))),
                                child: ExpansionTile(
                                  maintainState: true,
                                  initiallyExpanded: true,
                                  expandedCrossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  expandedAlignment: Alignment.centerLeft,
                                  textColor: darkText,
                                  iconColor: darkText,
                                  collapsedTextColor: darkText,
                                  collapsedIconColor: darkText,
                                  title: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: SizedBox(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    "001",
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 15,
                                                      letterSpacing: 0.125,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: darkText,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    "Saga",
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 15,
                                                      letterSpacing: 0.125,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: darkText,
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Text(
                                                    "Wallpaper",
                                                    style: GoogleFonts.nunito(
                                                      fontSize: 15,
                                                      letterSpacing: 0.125,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: darkText,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  children: [
                                    Column(
                                      children: [
                                        const Divider(
                                          thickness: 1,
                                          color: darkText,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              15, 5, 15, 0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Informasi Vendor",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 25,
                                                  letterSpacing: 0.125,
                                                  fontWeight: FontWeight.w400,
                                                  color: darkText,
                                                ),
                                              ),
                                              SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Proyek Selesai",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        "Proyek Dalam Pengerjaan",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(width: 15),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        ": 0",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        ": 1",
                                                        style:
                                                            GoogleFonts.nunito(
                                                          fontSize: 15,
                                                          letterSpacing: 0.125,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: darkText,
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    15, 10, 20, 10),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Expanded(
                                                          flex: 1,
                                                          child: Center(
                                                            child: Text(
                                                              "Id Proyek",
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color:
                                                                      darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Center(
                                                            child: Text(
                                                              "Nama Proyek",
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color:
                                                                      darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          flex: 1,
                                                          child: Center(
                                                            child: Text(
                                                              "Progress",
                                                              style: GoogleFonts.inter(
                                                                  fontSize: 15,
                                                                  color:
                                                                      darkText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      height: 15,
                                                    ),
                                                    FDottedLine(
                                                      color: darkText,
                                                      width: deviceWidth,
                                                      strokeWidth: 1,
                                                      dottedLength: 8,
                                                      space: 2,
                                                    ),
                                                    Container(
                                                      padding:
                                                          EdgeInsets.fromLTRB(
                                                              15, 10, 20, 0),
                                                      child: Column(
                                                        children: [
                                                          ScrollConfiguration(
                                                              behavior:
                                                                  ScrollConfiguration
                                                                          .of(
                                                                              context)
                                                                      .copyWith(
                                                                dragDevices: {
                                                                  PointerDeviceKind
                                                                      .touch,
                                                                  PointerDeviceKind
                                                                      .mouse,
                                                                },
                                                              ),
                                                              child: ListView
                                                                  .builder(
                                                                      shrinkWrap:
                                                                          true,
                                                                      scrollDirection:
                                                                          Axis
                                                                              .vertical,
                                                                      controller:
                                                                          ScrollController(),
                                                                      physics:
                                                                          const ClampingScrollPhysics(),
                                                                      itemCount: lt1
                                                                          .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              index) {
                                                                        return Column(
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      lt1[index][0],
                                                                                      style: GoogleFonts.inter(fontSize: 12, color: darkText, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      lt1[index][1],
                                                                                      style: GoogleFonts.inter(fontSize: 12, color: darkText, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Expanded(
                                                                                  flex: 1,
                                                                                  child: Center(
                                                                                    child: Text(
                                                                                      lt1[index][2],
                                                                                      style: GoogleFonts.inter(fontSize: 12, color: darkText, fontWeight: FontWeight.w400),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            const SizedBox(
                                                                              height: 10,
                                                                            ),
                                                                          ],
                                                                        );
                                                                      }))
                                                        ],
                                                      ),
                                                    ),
                                                    FDottedLine(
                                                      color: darkText,
                                                      width: deviceWidth,
                                                      strokeWidth: 1,
                                                      dottedLength: 8,
                                                      space: 2,
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BuatMasterVendorPage extends StatefulWidget {
  const BuatMasterVendorPage({Key? key}) : super(key: key);

  @override
  State<BuatMasterVendorPage> createState() => _BuatMasterVendorPageState();
}

class _BuatMasterVendorPageState extends State<BuatMasterVendorPage> {
  final controllerNamaVen = TextEditingController();
  final controllerPekerjaanVen = TextEditingController();

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

  TextFieldYa(controller) {
    return TextField(
      readOnly: false,
      controller: controller,
      showCursor: true,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: true,
        fillColor: lightText,
        hintStyle: GoogleFonts.inter(
          fontWeight: FontWeight.w500,
          fontSize: 13,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            width: 1.5,
            color: darkText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: darkText,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightText,
        //diisi warna nek wes sesuai
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: darkText,
                    size: 50,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Kendrew Tandiono",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "Felmel@gmail.com",
                      style: GoogleFonts.notoSans(
                        color: darkText,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 14),
                ),
                Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(360),
                    ),
                  ),
                  child: Image.asset("lib/assets/images/defaultprofile.png"),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                ),
              ],
            ),
          ],
        ),
        //elevation: 0,
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(10),
          child: Divider(
            thickness: 3,
            color: darkText,
          ),
        ),
      ),
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
            dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse}),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Vendor",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerNamaVen),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pekerjaan Vendor",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerPekerjaanVen),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 100),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(30, 17, 30, 17),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Submit",
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
          ),
        ),
      ),
    );
  }
}
