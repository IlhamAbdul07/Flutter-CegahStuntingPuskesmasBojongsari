import 'package:flutter/material.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:stunting_web/constants/config.dart';
import 'package:stunting_web/constants/gsheet_helper.dart';

class HasilSurvey extends StatefulWidget {
  final int row;

  const HasilSurvey({super.key, required this.row});

  @override
  State<HasilSurvey> createState() => _HasilSurveyState();
}

class _HasilSurveyState extends State<HasilSurvey> {
  late Future<Map<String, dynamic>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = GSheetHelper.fetchOneFromSheet(
      spreadsheetId: spreadsheetId,
      apiKey: gsheetApiKey,
      rowNumber: widget.row,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blueSecondary,
      appBar: AppBar(
        title: const Text(
          "Detail Hasil Survey",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: CustomColor.bgMain,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Data tidak ditemukan"));
          }

          final data = snapshot.data!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Header
                        Text(
                          "📋 Hasil Survey Anak",
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: CustomColor.scaffoldBg,
                              ),
                        ),
                        const SizedBox(height: 16),

                        // Render data
                        ...data.entries.map((e) {
                          final key = e.key.replaceAll("_", " ").toUpperCase();
                          final value = e.value.toString();

                          // Highlight field khusus
                          final isHighlight = [
                            "indikasi_awal",
                            "probabilitas_stunting",
                            "probabilitas_normal",
                            "indikasi",
                            "rekomendasi",
                          ].contains(e.key);

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    key,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 6,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: isHighlight
                                          ? CustomColor.blueSecondary
                                                .withOpacity(0.2)
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      value.isEmpty ? "-" : value,
                                      style: TextStyle(
                                        color: isHighlight
                                            ? CustomColor.bluePrimary
                                            : Colors.black87,
                                        fontWeight: isHighlight
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
