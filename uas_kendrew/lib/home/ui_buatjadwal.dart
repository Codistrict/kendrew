import 'dart:ui';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../themes/colors.dart';
import '../themes/floatingactionwidget.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage({super.key});

  @override
  State<JadwalPage> createState() => _JadwalPagePageState();
}

class _JadwalPagePageState extends State<JadwalPage> {
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
                onTap: () {},
                label: 'Generate Gant Chart',
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  color: lightText,
                  fontWeight: FontWeight.w500,
                ),
                labelBackgroundColor: buttonColor),
            // FAB 2
            SpeedDialChild(
                child: const Icon(
                  Icons.add,
                  color: lightText,
                ),
                backgroundColor: buttonColor,
                onTap: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BuatJadwalPage(),
                    ),
                  );
                },
                label: 'Tambah Data',
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
                            "Tanggal Dimulai Pekerjaan",
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
                            ": 06-06-2022",
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
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nyemen",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints:
                                    BoxConstraints(minWidth: deviceWidth),
                                child: DataTable(
                                    border: TableBorder.all(
                                      color: Colors.black.withOpacity(0.5),
                                      style: BorderStyle.solid,
                                    ),
                                    headingRowHeight: 50,
                                    dataRowHeight: 50,
                                    columns: [
                                      datCol("Id"),
                                      datCol("Nama Pekerjaan"),
                                      datCol("Lama Pengerjaan"),
                                      datCol("Depedencies"),
                                    ],
                                    rows: List.generate(3, (index) {
                                      return DataRow(cells: [
                                        datRow1("P-1"),
                                        datRow1("fwfawgawgagaha"),
                                        datRow1("100"),
                                        datRow1("10000"),
                                      ]);
                                    })),
                              ),
                            ),
                          ),
                          DataTable(
                            border: TableBorder(
                                top: BorderSide(
                                    color: Colors.black.withOpacity(0.5)),
                                bottom: BorderSide(
                                    color: Colors.black.withOpacity(0.5)),
                                right: BorderSide(
                                    color: Colors.black.withOpacity(0.5)),
                                horizontalInside: BorderSide(
                                    color: Colors.black.withOpacity(0.5),
                                    style: BorderStyle.solid)),
                            headingRowHeight: 50,
                            dataRowHeight: 50,
                            columns: [
                              datCol("Aksi"),
                            ],
                            rows: List.generate(
                              3,
                              (index) {
                                return DataRow(
                                  cells: [
                                    DataCell(
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      const AddDepenPage(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 0, 8, 0),
                                              //width: 40,
                                              decoration: BoxDecoration(
                                                color: buttonColor,
                                                border: Border.all(
                                                    color: buttonColor,
                                                    width: 0.4,
                                                    style: BorderStyle.solid),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              height: 40,
                                              child: Center(
                                                child: Row(
                                                  children: const [
                                                    Icon(
                                                      Icons.add,
                                                      size: 20,
                                                      color: lightText,
                                                    ),
                                                    SizedBox(width: 6),
                                                    Text(
                                                      "Depedencies",
                                                      style: TextStyle(
                                                          color: lightText),
                                                    )
                                                  ],
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
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class AddDepenPage extends StatefulWidget {
  const AddDepenPage({super.key});

  @override
  State<AddDepenPage> createState() => _AddDepenPageState();
}

class _AddDepenPageState extends State<AddDepenPage> {
  List<dynamic> data = [
    {"Name": "John", "Age": 28, "Role": "Senior Supervisor", "checked": false},
    {"Name": "Jane", "Age": 32, "Role": "Administrator", "checked": false},
  ];
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
                          SizedBox(height: 5),
                          Text(
                            "Id Pekerjaan",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
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
                          SizedBox(height: 5),
                          Text(
                            ": 006",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 5),
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
                  SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nyemen",
                        style: GoogleFonts.notoSans(
                          color: darkText,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ClampingScrollPhysics(),
                              controller: ScrollController(),
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints:
                                    BoxConstraints(minWidth: deviceWidth),
                                child: DataTable(
                                    showCheckboxColumn: true,
                                    border: TableBorder.all(
                                      color: Colors.black.withOpacity(0.5),
                                      style: BorderStyle.solid,
                                    ),
                                    headingRowHeight: 50,
                                    dataRowHeight: 50,
                                    columns: [
                                      datCol("Id"),
                                      datCol("Nama Tugas"),
                                    ],
                                    rows: List.generate(3, (index) {
                                      final item = data[index];
                                      return DataRow(
                                          cells: [
                                            datRow1(""),
                                            datRow1(""),
                                          ],
                                          selected: item['checked'],
                                          onSelectChanged: (bool? value) {
                                            setState(() {
                                              data[index]['checked'] = value!;
                                            });
                                            debugPrint(data.toString());
                                          });
                                    })),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class BuatJadwalPage extends StatefulWidget {
  const BuatJadwalPage({super.key});

  @override
  State<BuatJadwalPage> createState() => _BuatJadwalPageState();
}

class _BuatJadwalPageState extends State<BuatJadwalPage> {
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
                            SizedBox(height: 5),
                            DropdownSearch<String>(
                              dropdownDecoratorProps: DropDownDecoratorProps(
                                  textAlign: TextAlign.left,
                                  dropdownSearchDecoration: InputDecoration(
                                    filled: true,
                                    fillColor: lightText,
                                    iconColor: darkText,
                                    contentPadding:
                                        const EdgeInsets.symmetric(
                                            vertical: 0, horizontal: 10),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: darkText,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
                                        color: darkText,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide(
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
                              items: const [
                                "Harian",
                                "Mingguan",
                                "Bulanan",
                              ],
                              onChanged: (val) {
                                setState(() {});
                              },
                              selectedItem: "Harian",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
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
                            SizedBox(height: 5),
                            TextFieldYa(),
                          ],
                        ),
                      ),
                      SizedBox(width: 15),
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
                            SizedBox(height: 5),
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
                  SizedBox(height: 100),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.fromLTRB(30, 17, 30, 17),
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
