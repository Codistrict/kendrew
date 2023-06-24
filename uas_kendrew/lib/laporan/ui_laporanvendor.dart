import 'dart:ui';

import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:uas_kendrew/themes/colors.dart';

import '../themes/floatingactionwidget.dart';



class ImageLaporanVendorPage extends StatefulWidget {
  const ImageLaporanVendorPage({super.key});

  @override
  State<ImageLaporanVendorPage> createState() => _ImageLaporanVendorPageState();
}

class _ImageLaporanVendorPageState extends State<ImageLaporanVendorPage> {
  List<Asset> _selectedImages = [];

  Future<void> _pickImages() async {
    List<Asset> resultList = [];
    String error = '';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: _selectedImages,
      );
    } catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      _selectedImages = resultList;
      if (error.isNotEmpty) {
        // Handle error if necessary
      }
    });
  }

  void _deleteImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gambar",
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                  child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                children: List.generate(3, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("lib/assets/images/logo.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(),
                    ),
                  );
                }),
              )),
              SizedBox(height: 25),
              Text(
                "Tambah Gambar",
                style: GoogleFonts.notoSans(
                  color: darkText,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(_selectedImages.length, (index) {
                    Asset asset = _selectedImages[index];
                    return Stack(
                      children: [
                        AssetThumb(
                          asset: asset,
                          width: 300,
                          height: 300,
                        ),
                        Positioned(
                          top: 1,
                          right: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: lightText,
                            ),
                            onPressed: () {
                              _deleteImage(index);
                            },
                          ),
                        ),
                      ],
                    );
                  }),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _pickImages,
                    child: Text(
                      "Upload Gambar",
                      style: GoogleFonts.notoSans(
                        color: lightText,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.all(15),
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
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LaporanVendorPage extends StatefulWidget {
  const LaporanVendorPage({super.key});

  @override
  State<LaporanVendorPage> createState() => _LaporanVendorPageState();
}

class _LaporanVendorPageState extends State<LaporanVendorPage> {
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

   List lt1 = [
    [
      'tsk101',
      'Pondasi Plat setempat',
      '25%',
    ],
    [
      'tsk102',
      'Urug tanah Keseluruhan (t=70 cm)',
      '20%',
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
              MaterialPageRoute(builder: (context) => TambahLaporanVendorPage()));
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
                                child: Center(
                                  child: Text(
                                    "ID Laporan",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Tanggal Pelaporan",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Status Laporan",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Center(
                                  child: Text(
                                    "Sisa Pembayaran",
                                    style: GoogleFonts.nunito(
                                      fontSize: 15,
                                      letterSpacing: 0.125,
                                      fontWeight: FontWeight.w700,
                                      color: buttonColor,
                                    ),
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
                                                  child: Center(
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
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "12-05-2023",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                    child: Text(
                                                      "OK",
                                                      style: GoogleFonts.nunito(
                                                        fontSize: 15,
                                                        letterSpacing: 0.125,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: darkText,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: darkText,
                                                                width: 0.4,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
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
                                                      SizedBox(width: 10),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          EditLaporanVendorPage()));
                                                        },
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: darkText,
                                                                width: 0.4,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          height: 40,
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.edit,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: darkText,
                                                                width: 0.4,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          height: 40,
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.check_box,
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(width: 10),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          ImageLaporanVendorPage()));
                                                        },
                                                        child: Container(
                                                          width: 40,
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: darkText,
                                                                width: 0.4,
                                                                style:
                                                                    BorderStyle
                                                                        .solid),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          height: 40,
                                                          child: const Center(
                                                            child: Icon(
                                                              Icons.image,
                                                              size: 20,
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
                                                "Detail Laporan",
                                                style: GoogleFonts.nunito(
                                                  fontSize: 25,
                                                  letterSpacing: 0.125,
                                                  fontWeight: FontWeight.w400,
                                                  color: darkText,
                                                ),
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
                                                              "Id Task",
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
                                                              "Nama Sub Pekerjaan",
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
                                                                  ScrollConfiguration.of(
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
                                                                      itemCount:
                                                                          lt1.length,
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
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      child: Text(
                                                        "Laporan",
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 15,
                                                                color: darkText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w800),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 10,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          color:
                                                              scaffoldBackgroundColor,
                                                          border: Border.all(
                                                            color: darkText,
                                                          ),
                                                          borderRadius:
                                                              const BorderRadius
                                                                      .all(
                                                                  Radius
                                                                      .circular(
                                                                          3))),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .fromLTRB(
                                                                10, 10, 10, 50),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Text(
                                                            "Tidak Bisa Dilakukan Karena Adanya Hujan",
                                                            style: GoogleFonts.inter(
                                                                fontSize: 13,
                                                                color: darkText,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                          ),
                                                        ),
                                                      ),
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

class TambahLaporanVendorPage extends StatefulWidget {
  const TambahLaporanVendorPage({super.key});

  @override
  State<TambahLaporanVendorPage> createState() => _TambahLaporanVendorPageState();
}

class _TambahLaporanVendorPageState extends State<TambahLaporanVendorPage> {
  DateTime _selectedDateTglLap = DateTime.now();
  String _formattedDateTglLap = "";
  String _dateEditTglLap = "";

  bool cekDate = true;

  final ctrlLaporan = TextEditingController();

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

  Future<void> selectFilterDateTglLaporan(context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDateTglLap,
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
    if (picked != null && picked != _selectedDateTglLap) {
      if (mounted) {
        _selectedDateTglLap = picked;
        _formattedDateTglLap =
            DateFormat('dd-MM-yyyy').format(_selectedDateTglLap);
        _dateEditTglLap = _formattedDateTglLap;

        setState(() {});
      }
    }
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
            padding: const EdgeInsets.fromLTRB(35, 20, 35, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masukkan Tanggal Laporan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: deviceWidth / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: darkText, width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _dateEditTglLap,
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                          GestureDetector(
                              onTap: () {
                                selectFilterDateTglLaporan(context)
                                    .whenComplete(() => setState(() {}));
                              },
                              child: const Icon(Icons.calendar_month)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
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
                                  datCol("ID"),
                                  datCol("Nama Tugas"),
                                  datCol("Progress Sekarang"),
                                ],
                                rows: List.generate(
                                  2,
                                  (index) {
                                    return DataRow(
                                      cells: [
                                        datRow1(""),
                                        datRow1(""),
                                        datRow1(""),
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
                            datCol(""),
                          ],
                          rows: List.generate(
                            2,
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.check_box,
                                                size: 20,
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
                const SizedBox(height: 20),
                Text(
                  "Laporan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  minLines: 6,
                  maxLines: 6,
                  readOnly: false,
                  controller: ctrlLaporan,
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1,
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
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
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

class EditLaporanVendorPage extends StatefulWidget {
  const EditLaporanVendorPage({super.key});

  @override
  State<EditLaporanVendorPage> createState() => _EditLaporanVendorPageState();
}

class _EditLaporanVendorPageState extends State<EditLaporanVendorPage> {
  bool cekDate = true;
  final ctrlLaporanEdit = TextEditingController();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Masukkan Tanggal Laporan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: deviceWidth / 2,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: darkText, width: 1, style: BorderStyle.solid),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(9),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "12-05-2023",
                            style: GoogleFonts.notoSans(
                              color: darkText,
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
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
                                  datCol("ID"),
                                  datCol("Nama Tugas"),
                                  datCol("Progress Sekarang"),
                                ],
                                rows: List.generate(
                                  2,
                                  (index) {
                                    return DataRow(
                                      cells: [
                                        datRow1(""),
                                        datRow1(""),
                                        datRow1(""),
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
                            datCol(""),
                          ],
                          rows: List.generate(
                            2,
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
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            height: 40,
                                            child: const Center(
                                              child: Icon(
                                                Icons.check_box,
                                                size: 20,
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
                const SizedBox(height: 20),
                Text(
                  "Laporan",
                  style: GoogleFonts.notoSans(
                    color: darkText,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  minLines: 6,
                  maxLines: 6,
                  readOnly: false,
                  controller: ctrlLaporanEdit,
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
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 1,
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
                ),
                const SizedBox(height: 50),
                Align(
                  alignment: Alignment.center,
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
