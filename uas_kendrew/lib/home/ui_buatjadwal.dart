import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:uas_kendrew/ui_calendar.dart';

import '../themes/colors.dart';
import '../themes/floatingactionwidget.dart';
import 'service_home.dart';

class JadwalPage extends StatefulWidget {
  final String uid;
  const JadwalPage({super.key, required this.uid});

  @override
  State<JadwalPage> createState() => _JadwalPagePageState();
}

class _JadwalPagePageState extends State<JadwalPage> {
  HomeService homeService = HomeService();
  late Future judulPenawaran;
  late Future childPenawaran;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    judulPenawaran = homeService.readJudulPenawaran(widget.uid);
    childPenawaran = homeService.readPenawaran(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List lt1 = [
    [
      'bj101',
      'Pondasi Plat setempat',
      '14',
    ],
    [
      'bj102',
      'Urug tanah Keseluruhan (t=70 cm)',
      '14',
    ],
    [
      'bj103',
      'Cor Kolom struktur (20/30)',
      '7',
    ],
    [
      'bj104',
      'Cor Blok strruktur (30/30)',
      '7',
    ],
    [
      'bj105',
      'Cor sloof (20/20)',
      '7',
    ],
    [
      'bj106',
      'Cor Kolom praktis (15/15)',
      '7',
      
    ],
    [
      'bj107',
      'Cor Rabatan lantai (t=7 cm)',
      '7',
    ],
    [
      'bj108',
      'Cor Balok Tangga + Trap Tangga',
      '7',
    ],
    [
      'bj109',
      'Pasang bata putih untuk dinding dan bawah sloof',
      '14',
    ],
    [
      'bj110',
      'Plester dinding, kolom, balok, plat lantai 2 ( tanpa plafon), tangga',
      '7',
    ],
    [
      'bj111',
      'Acian dinding, kolom, balok, plat lantai 2 (tanpa plafon), tangga',
      '7',
    ],
  ];

  TextFieldYa() {
    return TextField(
      readOnly: false,
      // controller:
      //     _controllerJumlahBarangTambahPenjualan,
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

  datCol(value) {
    return DataColumn(
      label: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  datRow1(
    value1,
  ) {
    return DataCell(
      GestureDetector(
        child: Text(
          value1,
          style: GoogleFonts.notoSans(
            color: darkText,
            fontWeight: FontWeight.w500,
            fontSize: 14,
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
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.arrow_forward,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadJadwalPage(uid: widget.uid),
                    ));
              },
              label: 'Generate Gant Chart',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          // FAB 2
          // SpeedDialChild(
          //     child: const Icon(
          //       Icons.add,
          //       color: lightText,
          //     ),
          //     backgroundColor: buttonColor,
          //     onTap: () async {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => BuatJadwalPage(uid: widget.uid),
          //         ),
          //       ).whenComplete(() {
          //         judulPenawaran = homeService
          //             .readJudulPenawaran(widget.uid)
          //             .whenComplete(() => setState(() {}));
          //       });
          //     },
          //     label: 'Tambah Data',
          //     labelStyle: GoogleFonts.inter(
          //       fontSize: 16,
          //       color: lightText,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     labelBackgroundColor: buttonColor),
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Buat Jadwal",
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                flex: 3,
                child: Container(
                  child: FutureBuilder(
                    future: childPenawaran,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List snapData = snapshot.data! as List;
                        if (snapData[0] != 404) {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            physics: const ClampingScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExpansionTile(
                                    maintainState: true,
                                    initiallyExpanded: true,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    expandedAlignment: Alignment.centerLeft,
                                    textColor: darkText,
                                    iconColor: darkText,
                                    collapsedTextColor: darkText,
                                    collapsedIconColor: darkText,
                                    title: Row(
                                      children: [
                                        Text(
                                          "Lantai 1",
                                          style: GoogleFonts.notoSans(
                                            color: darkText,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: buttonColor,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          const ClampingScrollPhysics(),
                                                      controller:
                                                          ScrollController(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints(
                                                                minWidth:
                                                                    deviceWidth),
                                                        child: DataTable(
                                                          border:
                                                              TableBorder.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                          headingRowHeight: 50,
                                                          dataRowHeight: 50,
                                                          columns: [
                                                            datCol("Id"),
                                                            datCol(
                                                                "Nama Sub Pekerjaan"),
                                                            datCol(
                                                                "Lama Pengerjaan"),
                                                          ],
                                                          rows: List.generate(
                                                            lt1.length,
                                                            (indexItem) {
                                                              return DataRow(
                                                                cells: [
                                                                  datRow1(
                                                                      lt1[indexItem][0]),
                                                                  datRow1(
                                                                      lt1[indexItem][1]),
                                                                  datRow1(lt1[indexItem][2]),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataTable(
                                                    border: TableBorder(
                                                        top: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        bottom: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        right: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                    headingRowHeight: 50,
                                                    dataRowHeight: 50,
                                                    columns: [
                                                      datCol(""),
                                                    ],
                                                    rows: List.generate(
                                                      lt1.length,
                                                      (index) {
                                                        return DataRow(
                                                          cells: [
                                                            DataCell(
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                TambahDurasiPage(),
                                                                          ));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                darkText,
                                                                            width:
                                                                                0.4,
                                                                            style:
                                                                                BorderStyle.solid),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .timer,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width:
                                                                          10),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                AddDepenPage(
                                                                              uid: widget.uid,
                                                                            ),
                                                                          ));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                darkText,
                                                                            width:
                                                                                0.4,
                                                                            style:
                                                                                BorderStyle.solid),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .menu,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            //datRow3(2, context)
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Depedencies",
                                                    style: GoogleFonts.notoSans(
                                                      color: darkText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    ": Cor Beton, Pasang Rum",
                                                    style: GoogleFonts.notoSans(
                                                      color: darkText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("No data found"),
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ),
              // Expanded(
              //   child: FutureBuilder(
              //     future: judulPenawaran,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         List snapData = snapshot.data! as List;
              //         if (snapData[0] != 404) {
              //           return ListView.builder(
              //             shrinkWrap: true,
              //             controller: ScrollController(),
              //             physics: const ClampingScrollPhysics(),
              //             itemCount: 1,
              //             itemBuilder: (context, index) {
              //               return Column(
              //                 crossAxisAlignment: CrossAxisAlignment.start,
              //                 children: [
              //                   Text(
              //                     "${snapData[2][index]['judul_penawaran']}",
              //                     style: GoogleFonts.notoSans(
              //                       color: darkText,
              //                       fontWeight: FontWeight.w700,
              //                       fontSize: 15,
              //                     ),
              //                   ),
              //                   const SizedBox(height: 10),
              //                   FutureBuilder(
              //                     future: homeService.readTaskPenawaran(
              //                         widget.uid,
              //                         snapData[2][index]['id_penawaran']),
              //                     builder: (context, snapshot) {
              //                       if (snapshot.hasData) {
              //                         List snapTask = snapshot.data! as List;
              //                         if (snapTask[0] != 404) {
              //                           return Row(
              //                             mainAxisAlignment:
              //                                 MainAxisAlignment.spaceBetween,
              //                             crossAxisAlignment:
              //                                 CrossAxisAlignment.start,
              //                             children: [
              //                               Expanded(
              //                                 child: SingleChildScrollView(
              //                                   physics:
              //                                       const ClampingScrollPhysics(),
              //                                   controller: ScrollController(),
              //                                   scrollDirection:
              //                                       Axis.horizontal,
              //                                   child: ConstrainedBox(
              //                                     constraints: BoxConstraints(
              //                                         minWidth: deviceWidth),
              //                                     child: DataTable(
              //                                       border: TableBorder.all(
              //                                         color: Colors.black
              //                                             .withOpacity(0.5),
              //                                         style: BorderStyle.solid,
              //                                       ),
              //                                       headingRowHeight: 50,
              //                                       dataRowHeight: 50,
              //                                       columns: [
              //                                         datCol("Id"),
              //                                         datCol("Nama Pekerjaan"),
              //                                         datCol("Lama Pengerjaan"),
              //                                         datCol("Depedencies"),
              //                                       ],
              //                                       rows: List.generate(
              //                                         snapTask[2].length,
              //                                         (indexItem) {
              //                                           return DataRow(
              //                                             cells: [
              //                                               datRow1(
              //                                                   "${snapTask[2][indexItem]['id_penjadwalan']}"),
              //                                               datRow1(
              //                                                   "${snapTask[2][indexItem]['nama_task']}"),
              //                                               datRow1(
              //                                                   "${snapTask[2][indexItem]['durasi_task']}"),
              //                                               datRow1(
              //                                                   "${snapTask[2][indexItem]['dependentcies']}"),
              //                                             ],
              //                                           );
              //                                         },
              //                                       ),
              //                                     ),
              //                                   ),
              //                                 ),
              //                               ),
              //                               DataTable(
              //                                 border: TableBorder(
              //                                     top: BorderSide(
              //                                         color: Colors.black
              //                                             .withOpacity(0.5)),
              //                                     bottom: BorderSide(
              //                                         color: Colors.black
              //                                             .withOpacity(0.5)),
              //                                     right: BorderSide(
              //                                         color: Colors.black
              //                                             .withOpacity(0.5)),
              //                                     horizontalInside: BorderSide(
              //                                         color: Colors.black
              //                                             .withOpacity(0.5),
              //                                         style:
              //                                             BorderStyle.solid)),
              //                                 headingRowHeight: 50,
              //                                 dataRowHeight: 50,
              //                                 columns: [
              //                                   datCol("Aksi"),
              //                                 ],
              //                                 rows: List.generate(
              //                                   snapTask[2].length,
              //                                   (indexItem) {
              //                                     return DataRow(
              //                                       cells: [
              //                                         DataCell(
              //                                           Row(
              //                                             mainAxisAlignment:
              //                                                 MainAxisAlignment
              //                                                     .spaceBetween,
              //                                             children: [
              //                                               GestureDetector(
              //                                                 onTap: () {
              //                                                   Navigator.push(
              //                                                     context,
              //                                                     MaterialPageRoute(
              //                                                       builder:
              //                                                           (context) =>
              //                                                               AddDepenPage(
              //                                                         uidJadwal:
              //                                                             "${snapTask[2][indexItem]['id_penjadwalan']}",
              //                                                         uid: widget
              //                                                             .uid,
              //                                                       ),
              //                                                     ),
              //                                                   );
              //                                                 },
              //                                                 child: Container(
              //                                                   padding:
              //                                                       const EdgeInsets
              //                                                               .fromLTRB(
              //                                                           8,
              //                                                           0,
              //                                                           8,
              //                                                           0),
              //                                                   //width: 40,
              //                                                   decoration:
              //                                                       BoxDecoration(
              //                                                     color:
              //                                                         buttonColor,
              //                                                     border: Border.all(
              //                                                         color:
              //                                                             buttonColor,
              //                                                         width:
              //                                                             0.4,
              //                                                         style: BorderStyle
              //                                                             .solid),
              //                                                     borderRadius:
              //                                                         BorderRadius
              //                                                             .circular(
              //                                                                 5),
              //                                                   ),
              //                                                   height: 40,
              //                                                   child: Center(
              //                                                     child: Row(
              //                                                       children: [
              //                                                         Icon(
              //                                                           Icons
              //                                                               .add,
              //                                                           size:
              //                                                               20,
              //                                                           color:
              //                                                               lightText,
              //                                                         ),
              //                                                         SizedBox(
              //                                                             width:
              //                                                                 6),
              //                                                         Text(
              //                                                           "Depedencies",
              //                                                           style: TextStyle(
              //                                                               color:
              //                                                                   lightText),
              //                                                         )
              //                                                       ],
              //                                                     ),
              //                                                   ),
              //                                                 ),
              //                                               ),
              //                                             ],
              //                                           ),
              //                                         ),
              //                                         //datRow3(2, context)
              //                                       ],
              //                                     );
              //                                   },
              //                                 ),
              //                               ),
              //                             ],
              //                           );
              //                         }
              //                       }
              //                       return Container();
              //                     },
              //                   ),
              //                 ],
              //               );
              //             },
              //           );
              //         } else {
              //           const Center(
              //             child: Text("No Data Found"),
              //           );
              //         }
              //       }
              //       return const Center(
              //         child: CircularProgressIndicator(),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class TambahDurasiPage extends StatefulWidget {
  const TambahDurasiPage({super.key});

  @override
  State<TambahDurasiPage> createState() => _TambahDurasiPageState();
}

class _TambahDurasiPageState extends State<TambahDurasiPage> {
  HomeService homeService = HomeService();

  final ctrlOptimis = TextEditingController();
  final ctrlPesimis = TextEditingController();
  final ctrlRealistis = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ctrlOptimis.dispose();
    ctrlPesimis.dispose();
    ctrlRealistis.dispose();
  }

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

  TextFieldYa3() {
    return TextField(
      readOnly: true,
      showCursor: false,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: false,
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
            color: lightText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: lightText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: lightText,
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
                              "Waktu Optimis",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlOptimis),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Waktu Pesimis",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlPesimis),
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
                              "Waktu Realistis",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlRealistis),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Harga",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: lightText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa3(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 150),
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
        ));
  }
}

class AddDepenPage extends StatefulWidget {
  final String uid;
  //final String uidJadwal;
  const AddDepenPage({super.key, required this.uid});

  @override
  State<AddDepenPage> createState() => _AddDepenPageState();
}

class _AddDepenPageState extends State<AddDepenPage> {
  HomeService homeService = HomeService();
  late Future futureDep;
  List listCheck = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLen(widget.uid);
    futureDep = homeService.readDep(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getLen(uid) async {
    var response = await homeService.readDep(uid);
    if (response[0] == 200) {
      listCheck = List.generate(response[2].length, (index) => "");
    }
  }

  // Future updateDep(context) async {
  //   String tempDep = "";
  //   for (var element in listCheck) {
  //     if (element != "") {
  //       tempDep += "|$element|";
  //     }
  //   }
  //   var response =
  //       await homeService.inputDepedentcies(widget.uidJadwal, tempDep);
  //   if (response[0] == 200) {
  //     Navigator.pop(context);
  //   }
  // }

  datCol(value) {
    return DataColumn(
      label: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  datRow1(
    value1,
  ) {
    return DataCell(
      GestureDetector(
        child: Text(
          value1,
          style: GoogleFonts.notoSans(
            color: darkText,
            fontWeight: FontWeight.w500,
            fontSize: 14,
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
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   //updateDep(context);
      // }),
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
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Judul",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Id Pekerjaan",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Nama Tugas",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 55),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ": Nyemen",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          ": 006",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          ": nama tugase opo iki",
                          style: GoogleFonts.notoSans(
                            color: darkText,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                FutureBuilder(
                  future: futureDep,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List snapData = snapshot.data! as List;
                      if (snapData[0] != 404) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ExpansionTile(
                              maintainState: true,
                              initiallyExpanded: true,
                              expandedCrossAxisAlignment:
                                  CrossAxisAlignment.start,
                              expandedAlignment: Alignment.centerLeft,
                              textColor: darkText,
                              iconColor: darkText,
                              collapsedTextColor: darkText,
                              collapsedIconColor: darkText,
                              title: Text(
                                "Lantai 1",
                                style: GoogleFonts.notoSans(
                                  color: darkText,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 15,
                                ),
                              ),
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SingleChildScrollView(
                                        physics: const ClampingScrollPhysics(),
                                        controller: ScrollController(),
                                        scrollDirection: Axis.horizontal,
                                        child: ConstrainedBox(
                                          constraints: BoxConstraints(
                                              minWidth: deviceWidth),
                                          child: DataTable(
                                            showCheckboxColumn: true,
                                            border: TableBorder.all(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              style: BorderStyle.solid,
                                            ),
                                            headingRowHeight: 50,
                                            dataRowHeight: 50,
                                            columns: [
                                              datCol("Id"),
                                              datCol("Nama Tugas"),
                                            ],
                                            rows: List.generate(
                                              snapData[2].length,
                                              (index) {
                                                return DataRow(
                                                  cells: [
                                                    datRow1(
                                                        "${snapData[2][index]['id_penjadwalan']}"),
                                                    datRow1(
                                                        "${snapData[2][index]['nama_penjadwalan']}"),
                                                  ],
                                                  selected:
                                                      listCheck[index] != ""
                                                          ? true
                                                          : false,
                                                  onSelectChanged: (value) {
                                                    if (value!) {
                                                      listCheck[index] =
                                                          snapData[2][index][
                                                              'id_penjadwalan'];
                                                    } else {
                                                      listCheck[index] = "";
                                                    }
                                                    setState(() {});
                                                    debugPrint(
                                                        listCheck.toString());
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    }
                    return Container();
                  },
                ),
                SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.fromLTRB(50, 17, 50, 17),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      "Simpan",
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

class BuatJadwalPage extends StatefulWidget {
  final String uid;
  const BuatJadwalPage({super.key, required this.uid});

  @override
  State<BuatJadwalPage> createState() => _BuatJadwalPageState();
}

class _BuatJadwalPageState extends State<BuatJadwalPage> {
  HomeService homeService = HomeService();

  List<String> listIdPenawaran = List.empty(growable: true);
  String selectedIdPenawaran = "";
  final controllerWaktuOptimis = TextEditingController();
  final controllerPesimis = TextEditingController();
  final controllerRealistis = TextEditingController();
  final controllerNamaTask = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIdPenawaran(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getIdPenawaran(uid) async {
    var response = await homeService.readJudulPenawaran(uid);
    if (response[0] == 200) {
      for (var element in response[2]) {
        listIdPenawaran.add(element['id_penawaran']);
      }
    } else {
      debugPrint("Gagal Menagmbil Data");
    }
  }

  Future inputTaskPenawaran(context, idPenjadwalan, ipProyek, namaTask,
      waktuOptimis, waktuPesimis, waktuRealistis) async {
    var response = await homeService.inputTaskPenawaran(
        idPenjadwalan,
        ipProyek,
        namaTask.text,
        waktuOptimis.text,
        waktuPesimis.text,
        waktuRealistis.text);
    if (response[0] == 200) {
      Navigator.pop(context);
    } else {
      debugPrint("Failed");
    }
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
                            "Id Penawaran",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          DropdownSearch<String>(
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlign: TextAlign.left,
                                dropdownSearchDecoration: InputDecoration(
                                  filled: true,
                                  fillColor: lightText,
                                  iconColor: darkText,
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 10),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
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
                                )),
                            popupProps: const PopupProps.menu(
                              fit: FlexFit.loose,
                              showSelectedItems: false,
                              menuProps: MenuProps(
                                backgroundColor: Color(0xffE5E5E5),
                              ),
                            ),
                            items: listIdPenawaran,
                            onChanged: (val) {
                              selectedIdPenawaran = val!;
                              setState(() {});
                            },
                            selectedItem: selectedIdPenawaran,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Task",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerNamaTask),
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
                            "Waktu Optimis",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerWaktuOptimis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Waktu Pesimis",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerPesimis),
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
                            "Waktu Realistis",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: darkText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextFieldYa(controllerRealistis),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "",
                            style: GoogleFonts.notoSans(
                              fontSize: 15,
                              color: lightText,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          TextField(
                            readOnly: true,
                            showCursor: false,
                            style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              fillColor: lightText,
                              hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  width: 1.5,
                                  color: lightText,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: lightText,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: const BorderSide(
                                  color: lightText,
                                ),
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
                      inputTaskPenawaran(
                          context,
                          selectedIdPenawaran,
                          widget.uid,
                          controllerNamaTask,
                          controllerWaktuOptimis,
                          controllerPesimis,
                          controllerRealistis);
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
      ),
    );
  }
}

class ReadJadwalPage extends StatefulWidget {
  final String uid;
  const ReadJadwalPage({super.key, required this.uid});

  @override
  State<ReadJadwalPage> createState() => _ReadJadwalPagePageState();
}

class _ReadJadwalPagePageState extends State<ReadJadwalPage> {
  HomeService homeService = HomeService();
  late Future judulPenawaran;
  late Future childPenawaran;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    judulPenawaran = homeService.readJudulPenawaran(widget.uid);
    childPenawaran = homeService.readPenawaran(widget.uid);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  List lt1 = [
    [
      'bj101',
      'Pondasi Plat setempat',
      '14',
      '25-06-2023',
      '08-07-2023',
    ],
    [
      'bj102',
      'Urug tanah Keseluruhan (t=70 cm)',
      '14',
      '09-07-2023',
      '22-07-2023',
    ],
    [
      'bj103',
      'Cor Kolom struktur (20/30)',
      '7',
      '23-07-2023',
      '29-07-2023',
    ],
    [
      'bj104',
      'Cor Blok strruktur (30/30)',
      '7',
      '30-07-2023',
      '05-08-2023',
    ],
    [
      'bj105',
      'Cor sloof (20/20)',
      '7',
      '06-08-2023',
      '12-08-2023',
    ],
    [
      'bj106',
      'Cor Kolom praktis (15/15)',
      '7',
      '13-08-2023',
      '19-08-2023',
    ],
    [
      'bj107',
      'Cor Rabatan lantai (t=7 cm)',
      '7',
      '20-08-2023',
      '26-08-2023',
    ],
    [
      'bj108',
      'Cor Balok Tangga + Trap Tangga',
      '7',
      '27-08-2023',
      '02-09-2023',
    ],
    [
      'bj109',
      'Pasang bata putih untuk dinding dan bawah sloof',
      '14',
      '03-09-2023',
      '16-09-2023',
    ],
    [
      'bj110',
      'Plester dinding, kolom, balok, plat lantai 2 ( tanpa plafon), tangga',
      '7',
      '17-09-2023',
      '23-09-2023',
    ],
    [
      'bj111',
      'Acian dinding, kolom, balok, plat lantai 2 (tanpa plafon), tangga',
      '7',
      '24-09-2023',
      '30-09-2023',
    ],
  ];

  TextFieldYa() {
    return TextField(
      readOnly: false,
      // controller:
      //     _controllerJumlahBarangTambahPenjualan,
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

  datCol(value) {
    return DataColumn(
      label: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                value,
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  datRow1(
    value1,
  ) {
    return DataCell(
      GestureDetector(
        child: Text(
          value1,
          style: GoogleFonts.notoSans(
            color: darkText,
            fontWeight: FontWeight.w500,
            fontSize: 14,
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
      floatingActionButton: CustomFAB(
        icon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
              child: const Icon(
                Icons.arrow_forward,
                color: lightText,
              ),
              backgroundColor: buttonColor,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CalendarSf(uid: widget.uid),
                    ));
              },
              label: 'Lihat Calender',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),

          SpeedDialChild(
              child: const Icon(
                Icons.edit,
                color: buttonColor,
              ),
              backgroundColor: buttonColor,
              onTap: () {},
              label: 'Generate Jadwal',
              labelStyle: GoogleFonts.inter(
                fontSize: 16,
                color: lightText,
                fontWeight: FontWeight.w500,
              ),
              labelBackgroundColor: buttonColor),
          // FAB 2
          // SpeedDialChild(
          //     child: const Icon(
          //       Icons.add,
          //       color: lightText,
          //     ),
          //     backgroundColor: buttonColor,
          //     onTap: () async {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => BuatJadwalPage(uid: widget.uid),
          //         ),
          //       ).whenComplete(() {
          //         judulPenawaran = homeService
          //             .readJudulPenawaran(widget.uid)
          //             .whenComplete(() => setState(() {}));
          //       });
          //     },
          //     label: 'Tambah Data',
          //     labelStyle: GoogleFonts.inter(
          //       fontSize: 16,
          //       color: lightText,
          //       fontWeight: FontWeight.w500,
          //     ),
          //     labelBackgroundColor: buttonColor),
        ],
      ),
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
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 20, 35, 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Read Jadwal",
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w800,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 40),
              Expanded(
                flex: 3,
                child: Container(
                  child: FutureBuilder(
                    future: childPenawaran,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List snapData = snapshot.data! as List;
                        if (snapData[0] != 404) {
                          return ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            physics: const ClampingScrollPhysics(),
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ExpansionTile(
                                    maintainState: true,
                                    initiallyExpanded: true,
                                    expandedCrossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    expandedAlignment: Alignment.centerLeft,
                                    textColor: darkText,
                                    iconColor: darkText,
                                    collapsedTextColor: darkText,
                                    collapsedIconColor: darkText,
                                    title: Row(
                                      children: [
                                        Text(
                                          "Lantai 1",
                                          style: GoogleFonts.notoSans(
                                            color: darkText,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                              color: buttonColor,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(8))),
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          const ClampingScrollPhysics(),
                                                      controller:
                                                          ScrollController(),
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: ConstrainedBox(
                                                        constraints:
                                                            BoxConstraints(
                                                                minWidth:
                                                                    deviceWidth),
                                                        child: DataTable(
                                                          border:
                                                              TableBorder.all(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5),
                                                            style: BorderStyle
                                                                .solid,
                                                          ),
                                                          headingRowHeight: 50,
                                                          dataRowHeight: 50,
                                                          columns: [
                                                            datCol("Id"),
                                                            datCol(
                                                                "Nama Sub Pekerjaan"),
                                                            datCol(
                                                                "Lama Pengerjaan"),
                                                            datCol("Start"),
                                                            datCol("End"),
                                                          ],
                                                          rows: List.generate(
                                                            lt1.length,
                                                            (indexItem) {
                                                              return DataRow(
                                                                cells: [
                                                                  datRow1(
                                                                      lt1[indexItem][0]),
                                                                  datRow1(
                                                                      lt1[indexItem][1]),
                                                                  datRow1(lt1[indexItem][2]),
                                                                  datRow1(lt1[indexItem][3]),
                                                                  datRow1(lt1[indexItem][4]),
                                                                ],
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  DataTable(
                                                    border: TableBorder(
                                                        top: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        bottom: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        right: BorderSide(
                                                            color: Colors.black
                                                                .withOpacity(
                                                                    0.5)),
                                                        horizontalInside:
                                                            BorderSide(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.5),
                                                                style:
                                                                    BorderStyle
                                                                        .solid)),
                                                    headingRowHeight: 50,
                                                    dataRowHeight: 50,
                                                    columns: [
                                                      datCol(""),
                                                    ],
                                                    rows: List.generate(
                                                      lt1.length,
                                                      (index) {
                                                        return DataRow(
                                                          cells: [
                                                            DataCell(
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => EditJadwalDurasiPage()));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                darkText,
                                                                            width:
                                                                                0.4,
                                                                            style:
                                                                                BorderStyle.solid),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .edit,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 8),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => AddDepenPage(
                                                                                    uid: widget.uid,
                                                                                  )));
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      width: 40,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                darkText,
                                                                            width:
                                                                                0.4,
                                                                            style:
                                                                                BorderStyle.solid),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      height:
                                                                          40,
                                                                      child:
                                                                          const Center(
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .menu,
                                                                          size:
                                                                              20,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            //datRow3(2, context)
                                                          ],
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(height: 15),
                                              Row(
                                                children: [
                                                  Text(
                                                    "Depedencies",
                                                    style: GoogleFonts.notoSans(
                                                      color: darkText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Text(
                                                    ": Cor Beton, Pasang Rum",
                                                    style: GoogleFonts.notoSans(
                                                      color: darkText,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: Text("No data found"),
                          );
                        }
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
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

class EditJadwalDurasiPage extends StatefulWidget {
  const EditJadwalDurasiPage({super.key});

  @override
  State<EditJadwalDurasiPage> createState() => _EditJadwalDurasiPageState();
}

class _EditJadwalDurasiPageState extends State<EditJadwalDurasiPage> {
  HomeService homeService = HomeService();

  DateTime _selectedDate = DateTime.now();
  String _formattedDate = "";
  String _dateEdit = "";

  Future<void> selectFilterDate(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
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
    if (picked != null && picked != _selectedDate) {
      if (mounted) {
        _selectedDate = picked;
        _formattedDate = DateFormat('dd-MM-yyyy').format(_selectedDate);
        _dateEdit = _formattedDate;

        setState(() {});
      }
    }
  }

  final ctrlDurasi = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ctrlDurasi.dispose();
  }

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

  TextFieldYa3() {
    return TextField(
      readOnly: true,
      showCursor: false,
      style: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
      onChanged: (value) {},
      decoration: InputDecoration(
        filled: false,
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
            color: lightText,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: lightText,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: lightText,
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: scaffoldBackgroundColor,
                        border: Border.all(
                          color: darkText,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(3))),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Informasi Task (Sub Pekerjaan)",
                              style: GoogleFonts.inter(
                                  fontSize: 23,
                                  color: darkText,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(height: 25),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Id Penjadwalan",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Durasi",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Tanggal Pengerjaan Dimulai",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Tanggal Pengerjaan Berakhir",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Depedencies",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      ": AS-001",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ": 12",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ": 05-06-2023",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ": 05-06-2023",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      ": Cor Beton",
                                      style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        letterSpacing: 0.125,
                                        fontWeight: FontWeight.w500,
                                        color: darkText,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Durasi",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFieldYa(ctrlDurasi),
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Masukkan Tanggal Mulai Pekerjaan",
                              style: GoogleFonts.notoSans(
                                fontSize: 15,
                                color: darkText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: darkText,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      _dateEdit,
                                      style: GoogleFonts.notoSans(
                                        color: darkText,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          selectFilterDate(context)
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
                  const SizedBox(height: 150),
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
        ));
  }
}
