import 'package:flutter/material.dart';
import 'package:stunting_web/widgets/forms/ReactiveRadioGroup.dart';

class FormIbu extends StatelessWidget {
  const FormIbu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Posisi Anak Dalam Keluarga",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Anak ke berapa dalam keluarga ini?"),
        ReactiveRadioGroup<String>(
          formControlName: 'posisi_anak',
          options: [
            {'value': 'Anak pertama', 'label': 'Anak Pertama'},
            {'value': 'Anak Kedua', 'label': 'Anak Kedua'},
            {
              'value': 'Anak ketiga atau lebih',
              'label': 'Anak ketiga atau lebih',
            },
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Usia Ibu Saat Kehamilan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Saat usia berapa ibu hamil anak ini?"),
        ReactiveRadioGroup<String>(
          formControlName: 'ibu_hamil',
          options: [
            {'value': '< 20 tahun', 'label': '< 20 tahun'},
            {'value': '20 - 35 tahun', 'label': '20 - 35 tahun'},
            {'value': '>35', 'label': '> 35 tahun'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Pendidikan Ibu",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Apa pendidikan terakhir ibu?"),
        ReactiveRadioGroup<String>(
          formControlName: 'pendidikan_ibu',
          options: [
            {'value': 'SD / SMP', 'label': 'SD / SMP'},
            {'value': 'SMA', 'label': 'SMA'},
            {'value': 'Perguruan Tinggi', 'label': 'Perguruan Tinggi'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Kondisi Ekonomi",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Berapa rata-rata penghasilan keluarga per bulan?"),
        ReactiveRadioGroup<String>(
          formControlName: 'kondisi_ekonomi',
          options: [
            {'value': '< Rp 1 juta', 'label': '< Rp 1 juta'},
            {'value': 'Rp 1 - 3 juta', 'label': 'Rp 1 - 3 juta'},
            {'value': '> Rp 3 juta', 'label': '> Rp 3 juta'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Pemeriksaan Rutin",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Berapa kali Ibu memeriksakan kehamilan selama masa mengandung?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'pemeriksaan_rutin',
          options: [
            {'value': '< 4 kali', 'label': '< 4 kali'},
            {'value': '4 - 7 kali', 'label': '4 - 7 kali'},
            {'value': '≥ 8 kali', 'label': '≥ 8 kali'},
          ],
        ),

        const SizedBox(height: 24),
        const Text("Istirahat", style: TextStyle(fontWeight: FontWeight.bold)),
        const Text(
          "Apakah Ibu merasa cukup istirahat selama masa kehamilan atau setelah melahirkan?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'istirahat',
          options: [
            {'value': 'Kurang', 'label': 'Kurang'},
            {'value': 'Cukup', 'label': 'Cukup'},
            {'value': 'Sangat Cukup', 'label': 'Sangat Cukup'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Menghindari Rokok",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Apakah Ibu atau anggota keluarga lain merokok di dalam rumah?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'menghindari_rokok',
          options: [
            {'value': 'Sering terpapar', 'label': 'Sering terpapar'},
            {'value': 'Kadang', 'label': 'Kadang'},
            {'value': 'Tidak ada paparan', 'label': 'Tidak ada paparan'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Kesehatan Mental",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Apakah Ibu pernah merasa stres berlebihan selama kehamilan atau setelah melahirkan?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'kesehatan_mental',
          options: [
            {'value': 'Sangat stres', 'label': 'Sangat stres'},
            {'value': 'Kadang stres', 'label': 'Kadang stres'},
            {'value': 'Tidak stres', 'label': 'Tidak stres'},
          ],
        ),

        const SizedBox(height: 24),
        const Text("Persalinan", style: TextStyle(fontWeight: FontWeight.bold)),
        const Text(
          "Di mana Ibu melahirkan anak terakhir? Siapa yang membantu proses persalinan Ibu (bidan, dokter, dukun bayi)?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'persalinan',
          options: [
            {'value': 'Dukun bayi', 'label': 'Dukun bayi'},
            {'value': 'Bidan', 'label': 'Bidan'},
            {'value': 'Dokter RS', 'label': 'Dokter RS'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Layanan Kesehatan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text(
          "Apakah ibu dan keluarga memiliki jaminan kesehatan seperti BPJS?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'layanan_kesehatan',
          options: [
            {'value': 'Tidak punya jaminan', 'label': 'Tidak punya jaminan'},
            {'value': 'Punya BPJS', 'label': 'Punya BPJS'},
            {'value': 'Punya asuransi lain', 'label': 'Punya asuransi lain'},
          ],
        ),

        const SizedBox(height: 24),
        const Text("ASI", style: TextStyle(fontWeight: FontWeight.bold)),
        const Text(
          "Apakah Ibu memberikan ASI eksklusif selama 6 bulan pertama?",
        ),
        ReactiveRadioGroup<String>(
          formControlName: 'asi',
          options: [
            {'value': 'Tidak sama sekali', 'label': 'Tidak sama sekali'},
            {'value': 'Sebagian', 'label': 'Sebagian'},
            {'value': 'Lengkap 6 bulan', 'label': 'Lengkap 6 bulan'},
          ],
        ),

        const SizedBox(height: 24),
        const Text(
          "Makanan Pendamping ASI",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const Text("Kapan Ibu mulai memberikan MPASI kepada anak?"),
        ReactiveRadioGroup<String>(
          formControlName: 'pendamping_asi',
          options: [
            {'value': '< 6 bulan', 'label': '< 6 bulan'},
            {'value': '6 bulan', 'label': '6 bulan'},
            {'value': '> 6 bulan', 'label': '> 6 bulan'},
          ],
        ),
      ],
    );
  }
}
