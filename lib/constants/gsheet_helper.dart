import 'dart:convert';
import 'package:http/http.dart' as http;

// import 'package:stunting_web/constants/config.dart';
import 'db_helper.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:googleapis/sheets/v4.dart';
// import 'package:googleapis_auth/auth_io.dart';

class GSheetHelper {
  // static Future<SheetsApi> getSheetsApi() async {
  //   final credentialsJson = await rootBundle.loadString('assets/credentials.json');
  //   final credentials = ServiceAccountCredentials.fromJson(json.decode(credentialsJson));

  //   final scopes = [SheetsApi.spreadsheetsScope];

  //   final client = await clientViaServiceAccount(credentials, scopes);

  //   return SheetsApi(client);
  // }

  static Future<void> fetchFromSheet({
    required String spreadsheetId,
    required String apiKey,
  }) async {
    final range = "'Form data setengah mateng'!A2:D";
    final url = Uri.parse(
      'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey',
    );

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final decoded = jsonDecode(res.body);
      final rows = decoded['values'] as List<dynamic>? ?? [];

      for (var i = 0; i < rows.length; i++) {
        final row = rows[i] as List<dynamic>;
        final rowNumber = i + 2;
        final tgl = (row.length > 0) ? row[0].toString() : '';
        final nama_anak = (row.length > 1) ? row[1].toString() : '';
        final jenis_kelamin = (row.length > 2) ? row[2].toString() : '';
        final usia_anak = (row.length > 3) ? row[3].toString() : '';

        final data = {
          'row': rowNumber,
          'tgl': tgl,
          'nama_anak': nama_anak,
          'jenis_kelamin': jenis_kelamin,
          'usia_anak': usia_anak,
        };

        await DBHelper.create(data);
      }
      print('✅ Import dari Sheet selesai: ${rows.length} baris');
    } else {
      print('⚠️ Gagal fetch: ${res.statusCode} ${res.body}');
    }
  }

  static Future<void> fetchOneFromSheet({
    required String spreadsheetId,
    required String apiKey,
    required int rowNumber,
  }) async {
    final range = "'Form data setengah mateng'!A$rowNumber:AF$rowNumber";
    final url = Uri.parse(
      'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey',
    );

    final res = await http.get(url);

    if (res.statusCode == 200) {
      final decoded = jsonDecode(res.body);
      final rows = decoded['values'] as List<dynamic>? ?? [];

      for (var i = 0; i < rows.length; i++) {
        final row = rows[i] as List<dynamic>;
        final tgl = (row.length > 0) ? row[0].toString() : '';
        final nama_anak = (row.length > 1) ? row[1].toString() : '';
        final jenis_kelamin = (row.length > 2) ? row[2].toString() : '';
        final usia_anak = (row.length > 3) ? row[3].toString() : '';

        final data = {
          'row': rowNumber,
          'tgl': tgl,
          'nama_anak': nama_anak,
          'jenis_kelamin': jenis_kelamin,
          'usia_anak': usia_anak,
          // samain dengan data yg diperlukan
        };

        await DBHelper.createItemDetail(data);
      }
      print('✅ Import dari Sheet selesai: ${rows.length} baris');
    } else {
      print('⚠️ Gagal fetch: ${res.statusCode} ${res.body}');
    }
  }

  static Future<void> pushItemToSheet(
    String webAppUrl,
    Map<String, dynamic> data,
  ) async {
    try {
      final values = [
        [
          data['tgl'] ?? "",
          data["nama"] ?? "",
          data["jenis_kelamin"] ?? "",
          data['tanggal_lahir'] ?? "",
          data["berat_badan"] ?? "",
          data["tinggi_badan"] ?? "",
          data["lingkar_kepala"] ?? "",
          data["lingkar_lengan"] ?? "",
          data["posisi_anak"] ?? "",
          data["ibu_hamil"] ?? "",
          data["pendidikan_ibu"] ?? "",
          data["kondisi_ekonomi"] ?? "",
          data["pemeriksaan_rutin"] ?? "",
          data["istirahat"] ?? "",
          data["menghindari_rokok"] ?? "",
          data["riwayat_penyakit"] ?? "",
          data["kesehatan_mental"] ?? "",
          data["persalinan"] ?? "",
          data["layanan_kesehatan"] ?? "",
          data["asi"] ?? "",
          data["pendamping_asi"] ?? "",
          data["kualitas_mpasi"] ?? "",
          data["makan_anak"] ?? "",
          data["pola_makan"] ?? "",
          data["status_gizi"] ?? "",
          data["riwayat_imunisasi"] ?? "",
          data["kebersihan_lingkungan"] ?? "",
          data["kebersihan_diri"] ?? "",
          data["olahraga"] ?? "",
          data["dukungan_keluarga"] ?? "",
          data["pola_asuh"] ?? "",
        ],
      ];

      final requestData = {'type': "push", 'values': values};

      final res = await http.post(
        Uri.parse(webAppUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      if (res.statusCode == 200) {
        print('✅ Success: ${res.body}');
        // final decoded = jsonDecode(res.body);
        // final row = decoded['row'] as int? ?? 0;
      } else {
        print('⚠️ Failed with status ${res.statusCode}: ${res.body}');
      }
    } catch (e, stackTrace) {
      print('❌ Error when sending data: $e');
      print('StackTrace: $stackTrace');
    }
  }

  static Future<void> clearItemToSheet(String webAppUrl, int row) async {
    try {
      final requestData = {'type': "clear", 'values': row};

      final res = await http.post(
        Uri.parse(webAppUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestData),
      );

      if (res.statusCode == 200) {
        print('✅ Success: ${res.body}');
        // final decoded = jsonDecode(res.body);
        // final row = decoded['row'] as int? ?? 0;
      } else {
        print('⚠️ Failed with status ${res.statusCode}: ${res.body}');
      }
    } catch (e, stackTrace) {
      print('❌ Error when sending data: $e');
      print('StackTrace: $stackTrace');
    }
  }

  // static Future<void> clearItemFromSheet(String spreadsheetId, int rowIndex) async {
  //   final sheetsApi = await getSheetsApi();

  //   final request = BatchUpdateSpreadsheetRequest.fromJson({
  //     "requests": [
  //       {
  //         "deleteDimension": {
  //           "range": {
  //             "sheetId": gidFormResponses1,
  //             "dimension": "ROWS",
  //             "startIndex": rowIndex - 1,
  //             "endIndex": rowIndex
  //           }
  //         }
  //       }
  //     ]
  //   });

  //   await sheetsApi.spreadsheets.batchUpdate(request, spreadsheetId);
  // }
}
