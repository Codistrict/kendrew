// ignore_for_file: todo
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kendrew/themes/colors.dart';
import 'package:uas_kendrew/vendor/ui_vendor.dart';

import '../themes/floatingactionwidget.dart';

int angkacek = 0;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
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
                const SizedBox(width: 10),
                Text(
                  "PT.Softindo Putra Perkasa",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w400,
                    fontSize: 28,
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
                    SizedBox(height: 5),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(50, 25, 50, 25),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Tagihan",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Budgeting",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VendorPage(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(15),
                            decoration: const BoxDecoration(
                                color: cardColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))),
                            child: Row(
                              children: [
                                Icon(Icons.people_alt),
                                SizedBox(width: 15),
                                Text(
                                  "Vendor",
                                  style: GoogleFonts.notoSans(
                                    color: darkText,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Laporan",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: const BoxDecoration(
                              color: cardColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Icon(Icons.people_alt),
                              SizedBox(width: 15),
                              Text(
                                "Analisa",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 30),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                          decoration: const BoxDecoration(
                              color: buttonColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(360),
                                  ),
                                ),
                                child: Image.asset(
                                    "lib/assets/images/defaultprofile.png"),
                              ),
                              SizedBox(width: 20),
                              Text(
                                "PT. Softindo Putra Perkasa",
                                style: GoogleFonts.notoSans(
                                  color: lightText,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 20, 20, 50),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: buttonColor,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Informasi Proyek",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Lorem ipsum dolor sit amet consectetur. Quis aliquam faucibus blandit habitant. Habitant viverra ultricies enim odio proin fermentum nibh. Tempus faucibus vehicula aliquam ut morbi. Purus aliquam potenti sit gravida. Aenean gravida egestas mi enim in. Pharetra sed leo dolor morbi posuere sapien. Nulla ut faucibus purus hac quis. Risus ornare adipiscing elit augue lobortis eget volutpat imperdiet sem. At sit egestas id vel erat.",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 100),
              Visibility(
                visible: angkacek == 0 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      angkacek == 1;
                    });
                  },
                  child: Text(
                    "Buat Penawaran",
                    style: GoogleFonts.notoSans(
                      color: lightText,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: angkacek == 1 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      angkacek == 2;
                    });
                  },
                  child: Text(
                    "Buat Jadwal",
                    style: GoogleFonts.notoSans(
                      color: lightText,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: angkacek == 2 ? true : false,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(17),
                    backgroundColor: buttonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      angkacek == 0;
                    });
                  },
                  child: Text(
                    "Edit Jadwal",
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
    );
  }
}
