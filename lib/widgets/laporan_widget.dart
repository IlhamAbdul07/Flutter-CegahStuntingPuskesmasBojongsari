import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:data_table_2/data_table_2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';

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
                height: 250.0,
                color: CustomColor.greenMain,
                child: Text(
                  "INI LAPORAN PAGES",
                  style: TextStyle(fontSize: 25),
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
                      DataColumn2(label: Text('Column A'), size: ColumnSize.L),
                      DataColumn(label: Text('Column B')),
                      DataColumn(label: Text('Column C')),
                      DataColumn(label: Text('Column D')),
                      DataColumn(label: Text('Column NUMBERS'), numeric: true),
                    ],
                    rows: List<DataRow>.generate(
                      100,
                      (index) => DataRow(
                        cells: [
                          DataCell(Text('A' * (10 - index % 10))),
                          DataCell(Text('B' * (10 - (index + 5) % 10))),
                          DataCell(Text('C' * (15 - (index + 5) % 10))),
                          DataCell(Text('D' * (15 - (index + 10) % 10))),
                          DataCell(Text(((index + 0.1) * 25.4).toString())),
                        ],
                      ),
                    ),
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
