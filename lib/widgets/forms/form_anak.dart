import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormAnak extends StatelessWidget {
  const FormAnak({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Berat Badan
        ReactiveTextField<double>(
          formControlName: 'berat_badan',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // izinkan angka + titik/koma satu kali
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([.,]\d*)?$')),
          ],
          decoration: const InputDecoration(
            labelText: 'Berat Badan (Kg)',
            hintText: "Masukan Berat Badan Anak",
            helperText: "Contoh : 3,7",
            border: OutlineInputBorder(),
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Berat badan wajib diisi',
          },
        ),
        const SizedBox(height: 16),

        //Tinggi Badan
        ReactiveTextField<double>(
          formControlName: 'tinggi_badan',
          decoration: const InputDecoration(
            labelText: 'Tinggi Badan (cm)',
            helperText: "Contoh : 104.5",
            hintText: "Masukan Tinggi Badan Anak",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        //Lingkar Kepala
        ReactiveTextField<double>(
          formControlName: 'lingkar_kepala',
          decoration: const InputDecoration(
            labelText: 'Lingkar Kepala (cm)',
            helperText: "Contoh : 36,5",
            hintText: "Masukan Ukuran Lingkar Kepala Anak",
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        //Lingkar Lengan
        ReactiveTextField<double>(
          formControlName: 'lingkar_lengan',
          decoration: const InputDecoration(
            labelText: 'Lingkar Lengan (cm)',
            hintText: "Masukan Lingkar Tangan Anak",
            helperText: "Contoh : 12,5",
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
