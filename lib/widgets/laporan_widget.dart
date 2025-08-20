import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:stunting_web/constants/config.dart';
import 'package:stunting_web/constants/gsheet_helper.dart';

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
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: GSheetHelper.fetchFromSheet(
                    spreadsheetId: spreadsheetId,
                    apiKey: gsheetApiKey,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("Error: ${snapshot.error}"));
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text("Tidak ada data"));
                    }

                    final data = snapshot.data!;

                    return DataTable2(
                      columns: const [
                        DataColumn2(
                          label: Text('Tanggal Survey'),
                          size: ColumnSize.L,
                        ),
                        DataColumn(label: Text('Nama')),
                        DataColumn(label: Text('Jenis Kelamin')),
                        DataColumn(label: Text('Usia')),
                        DataColumn(label: Text('Aksi'), numeric: true),
                      ],
                      rows: data.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Text(item['tgl'] ?? '')),
                            DataCell(Text(item['nama'] ?? '')),
                            DataCell(Text(item['jenis_kelamin'] ?? '')),
                            DataCell(Text(item['usia'] ?? '')),
                            DataCell(
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.blue,
                                    ),
                                    tooltip: "Detail",
                                    onPressed: () {
                                      // aksi detail
                                    },
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    tooltip: "Hapus",
                                    onPressed: () async {
                                      await GSheetHelper.clearItemFromSheet(
                                        spreadsheetId,
                                        item['row'] ?? 100,
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            "Data berhasil dihapus",
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
