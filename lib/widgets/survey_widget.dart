import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:stunting_web/constants/colors.dart';
import 'package:flutter/services.dart';
import 'package:stunting_web/widgets/forms/form_anak.dart';
import 'package:stunting_web/widgets/forms/form_diri.dart';
import 'package:stunting_web/widgets/forms/form_ibu.dart';
import 'package:stunting_web/widgets/forms/form_survey.dart';

class SurveyWidget extends StatefulWidget {
  const SurveyWidget({super.key});

  @override
  State<SurveyWidget> createState() => _SurveyWidgetState();
}

class _SurveyWidgetState extends State<SurveyWidget> {
  final formStunting = FormGroup({
    'nama': FormControl<String>(
      validators: [
        Validators.required,
        Validators.minLength(5),
        Validators.maxLength(50),
      ],
    ),
    'tanggal_lahir': FormControl<DateTime>(validators: [Validators.required]),
    'jenis_kelamin': FormControl<String>(validators: [Validators.required]),
    'berat_badan': FormControl<double>(),
    'tinggi_badan': FormControl<double>(),
    'lingkar_kepala': FormControl<double>(),
    'lingkar_lengan': FormControl<double>(),
    'posisi_anak': FormControl<String>(validators: [Validators.required]),
    'ibu_hamil': FormControl<String>(validators: [Validators.required]),
    'pendidikan_ibu': FormControl<String>(validators: [Validators.required]),
    'kondisi_ekonomi': FormControl<String>(validators: [Validators.required]),
    'pemeriksaan_rutin': FormControl<String>(validators: [Validators.required]),
    'istirahat': FormControl<String>(validators: [Validators.required]),
    'menghindari_rokok': FormControl<String>(validators: [Validators.required]),
    'riwayat_penyakit': FormControl<String>(validators: [Validators.required]),
    'kesehatan_mental': FormControl<String>(validators: [Validators.required]),
    'persalinan': FormControl<String>(validators: [Validators.required]),
    'layanan_kesehatan': FormControl<String>(validators: [Validators.required]),
    'asi': FormControl<String>(validators: [Validators.required]),
    'pendamping_asi': FormControl<String>(validators: [Validators.required]),
    'kualitas_mpasi': FormControl<String>(validators: [Validators.required]),
    'makan_anak': FormControl<String>(validators: [Validators.required]),
    'pola_makan': FormControl<String>(validators: [Validators.required]),
    'status_gizi': FormControl<String>(validators: [Validators.required]),
    'riwayat_imunisasi': FormControl<String>(validators: [Validators.required]),
    'kebersihan_lingkungan': FormControl<String>(
      validators: [Validators.required],
    ),
    'kebersihan_diri': FormControl<String>(validators: [Validators.required]),
    'olahraga': FormControl<String>(validators: [Validators.required]),
    'dukungan_keluarga': FormControl<String>(validators: [Validators.required]),
    'pola_asuh': FormControl<String>(validators: [Validators.required]),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.blueSecondary,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            // biar form tetap di tengah
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: ReactiveForm(
                  formGroup: formStunting,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // HEADER
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: CustomColor.greenMain,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            topRight: Radius.circular(10.0),
                          ),
                        ),
                        child: Column(
                          children: [
                            Icon(
                              Icons.assignment,
                              size: 40,
                              color: Colors.white,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Form Survey Stunting",
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      // === FORM FIELDS ===
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FormDiri(),
                            const SizedBox(height: 16),
                            FormAnak(),
                            const SizedBox(height: 16),
                            FormIbu(),
                            const SizedBox(height: 16),
                            FormSurvey(),
                            const SizedBox(height: 16),
                            // Tombol submit
                            Center(
                              child: SizedBox(
                                width: 500,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColor.bluePrimary,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 16,
                                    ),
                                  ),
                                  onPressed: () {
                                    final data = formStunting.value;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Sukses: $data")),
                                    );
                                    print("ini data: $data");

                                    // if (formStunting.valid) {
                                    //   // final data = formStunting.value;
                                    //   ScaffoldMessenger.of(
                                    //     context,
                                    //   ).showSnackBar(
                                    //     SnackBar(content: Text("Sukses")),
                                    //   );
                                    // } else {
                                    //   formStunting.markAllAsTouched();
                                    // }
                                  },
                                  child: const Text(
                                    "Simpan",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
