import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_web/constants/config.dart';
import 'package:googleapis/sheets/v4.dart';
import 'package:googleapis_auth/auth_io.dart';

class GSheetHelper {
  static Future<SheetsApi> getSheetsApi() async {
    // get credentials service account from spreadsheet
    final range = "'WHO_DATA'!U2";
    final url = Uri.parse(
      'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$gsheetApiKey',
    );
    var credentialsJson = "";
    final resCredential = await http.get(url);
    if (resCredential.statusCode == 200) {
      final decoded = jsonDecode(resCredential.body);
      final rows = decoded['values'] as List<dynamic>? ?? [];
      for (var i = 0; i < rows.length; i++) {
        final row = rows[i] as List<dynamic>;
        credentialsJson = (row.isNotEmpty) ? row[0].toString() : '';
      }
    }
    final credentials = ServiceAccountCredentials.fromJson(
      json.decode(credentialsJson),
    );

    final scopes = [SheetsApi.spreadsheetsScope];

    final client = await clientViaServiceAccount(credentials, scopes);

    return SheetsApi(client);
  }

  static Future<List<Map<String, dynamic>>> fetchFromSheet({
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

      final List<Map<String, dynamic>> results = [];

      for (var i = 0; i < rows.length; i++) {
        final row = rows[i] as List<dynamic>;
        final rowNumber = i + 2;
        final tgl = (row.length > 0) ? row[0].toString() : '';
        final nama = (row.length > 1) ? row[1].toString() : '';
        final jenis_kelamin = (row.length > 2) ? row[2].toString() : '';
        final usia = (row.length > 3) ? row[3].toString() : '';

        results.add({
          'row': rowNumber,
          'tgl': tgl,
          'nama': nama,
          'jenis_kelamin': jenis_kelamin,
          'usia': usia,
        });
      }

      print('✅ Import dari Sheet selesai: ${rows.length} baris');
      return results;
    } else {
      print('⚠️ Gagal fetch: ${res.statusCode} ${res.body}');
      return []; // return kosong biar tetap aman
    }
  }

  static Future<Map<String, dynamic>> fetchOneFromSheet({
    required String spreadsheetId,
    required String apiKey,
    required int rowNumber,
  }) async {
    // Data dari form data setengah mateng
    final range = "'Form data setengah mateng'!A$rowNumber:AF$rowNumber";
    final url = Uri.parse(
      'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey',
    );
    final res = await http.get(url);

    // Data dari form data siap olah
    // final rangeHasil = "'form data siap olah (naive bayes)'!A$rowNumber:AF$rowNumber";
    // final urlHasil = Uri.parse(
    //   'https://sheets.googleapis.com/v4/spreadsheets/$spreadsheetId/values/$range?key=$apiKey',
    // );
    // final resHasil = await http.get(url);

    if (res.statusCode == 200) {
      final decoded = jsonDecode(res.body);
      final rows = decoded['values'] as List<dynamic>? ?? [];

      if (rows.isEmpty) {
        return {}; // kalau row kosong, balikin map kosong
      }

      final row = rows.first as List<dynamic>;
      final tgl = (row.length > 0) ? row[0].toString() : '';
      final nama = (row.length > 1) ? row[1].toString() : '';
      final jenis_kelamin = (row.length > 2) ? row[2].toString() : '';
      final usia = (row.length > 3) ? row[3].toString() : '';

      final data = {
        'row': rowNumber,
        'tgl': tgl,
        'nama': nama,
        'jenis_kelamin': jenis_kelamin,
        'usia': usia,
        // tambahin field lain sesuai kebutuhan
      };

      print('✅ Berhasil fetch 1 baris dari Sheet');
      return data;
    } else {
      print('⚠️ Gagal fetch: ${res.statusCode} ${res.body}');
      return {}; // tetap return map biar aman
    }
  }

  static Future<int?> pushItemToSheet(
    String spreadsheetId,
    Map<String, dynamic> data,
  ) async {
    final sheetsApi = await getSheetsApi();

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

    final response = await sheetsApi.spreadsheets.values.append(
      ValueRange.fromJson({"values": values}),
      spreadsheetId,
      nameFormResponses1,
      valueInputOption: "RAW",
    );

    // Ambil row number dari updatedRange
    final updatedRange = response.updates?.updatedRange;
    if (updatedRange != null) {
      // contoh: "'Form data setengah mateng'!A45:AF45"
      final match = RegExp(r'[A-Z]+(\d+):').firstMatch(updatedRange);
      if (match != null) {
        final rowNumber = int.tryParse(match.group(1)!);
        return rowNumber; // misal 45
      }
    }

    return null; // kalau gagal parse
  }

  static Future<void> clearItemFromSheet(
    String spreadsheetId,
    int rowIndex,
  ) async {
    final sheetsApi = await getSheetsApi();

    final request = BatchUpdateSpreadsheetRequest.fromJson({
      "requests": [
        {
          "deleteDimension": {
            "range": {
              "sheetId": gidFormResponses1,
              "dimension": "ROWS",
              "startIndex": rowIndex - 1,
              "endIndex": rowIndex,
            },
          },
        },
      ],
    });

    await sheetsApi.spreadsheets.batchUpdate(request, spreadsheetId);
  }
}
