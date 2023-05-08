// ignore_for_file: todo
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';

int angkacek = 0;

class VendorPage extends StatefulWidget {
  const VendorPage({super.key});

  @override
  State<VendorPage> createState() => _VendorPageState();
}

class _VendorPageState extends State<VendorPage> {
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
        child: Center(
          child: Text(
            value1,
            style: GoogleFonts.notoSans(
              color: darkText,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const ClampingScrollPhysics(),
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                          border: TableBorder.all(
                            color: Colors.black.withOpacity(0.5),
                            style: BorderStyle.solid,
                          ),
                          headingRowHeight: 50,
                          dataRowHeight: 50,
                          columns: [
                            datCol("Id Vendor"),
                            datCol("Nomor Kontrak"),
                            datCol("Nama Vendor"),
                            datCol("Total Nilai Kontrak"),
                            datCol("Nominal Pembayaran"),
                            datCol("Jenis Pekerjaan"),
                            datCol("Durasi Kontrak"),
                            datCol("Sisa Pembayaran"),
                          ],
                          rows: List.generate(5, (index) {
                            return DataRow(cells: [
                              datRow1("S001"),
                              datRow1("Samsong"),
                              datRow1("Delivery"),
                              datRow1("Cash"),
                              datRow1("-"),
                              datRow1("Nama Lembaga"),
                              datRow1("18/04/23"),
                              datRow1("22/04/23")
                            ]);
                          })),
                    ),
                  ),
                  DataTable(
                    border: TableBorder(
                        top: BorderSide(color: Colors.black.withOpacity(0.5)),
                        bottom:
                            BorderSide(color: Colors.black.withOpacity(0.5)),
                        right: BorderSide(color: Colors.black.withOpacity(0.5)),
                        horizontalInside: BorderSide(
                            color: Colors.black.withOpacity(0.5),
                            style: BorderStyle.solid)),
                    headingRowHeight: 50,
                    dataRowHeight: 50,
                    columns: [
                      datCol(""),
                    ],
                    rows: List.generate(
                      5,
                      (index) {
                        return DataRow(
                          cells: [
                            DataCell(
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 40,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: darkText,
                                            width: 0.4,
                                            style: BorderStyle.solid),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      height: 40,
                                      child: const Center(
                                        child: Icon(
                                          Icons.delete,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  Container(
                                    width: 40,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          color: darkText,
                                          width: 0.4,
                                          style: BorderStyle.solid),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    height: 40,
                                    child: const Center(
                                      child: Icon(
                                        Icons.wallet,
                                        size: 20,
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
            ),
          ),
        ));
  }
}
