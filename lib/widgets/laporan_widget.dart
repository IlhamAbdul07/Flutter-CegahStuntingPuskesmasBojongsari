import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:data_table_2/data_table_2.dart';

class LaporanWidget extends StatefulWidget {
  const LaporanWidget({super.key});

  @override
  State<LaporanWidget> createState() => _LaporanWidgetState();
}

class _LaporanWidgetState extends State<LaporanWidget> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          key: _scaffoldKey,
          body: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                width: double.infinity,
                height: 50.0,
                color: CustomColor.greenMain,
                child: Center(
                  child: Text(
                    "INI LAPORAN PAGES",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 450.0,
                color: CustomColor.bgSecondary,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: DataTable2(
                    columns: [
                      DataColumn2(label: Text('Tanggal'), size: ColumnSize.L),
                      DataColumn(label: Text('Nama Anak')),
                      DataColumn(label: Text('Jenis Kelamin')),
                      DataColumn(label: Text('Usia Anak')),
                      DataColumn(label: Text('Aksi'), numeric: true),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          DataCell(Text('18 Agustus 2025')),
                          DataCell(Text('Ilham')),
                          DataCell(Text('Laki-Laki')),
                          DataCell(Text('5 Tahun 6 Bulan')),
                          DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.visibility,
                                    color: Colors.blue,
                                  ),
                                  tooltip: "Detail",
                                  onPressed: () {
                                    // aksi detail
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  tooltip: "Hapus",
                                  onPressed: () {
                                    // aksi hapus
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
