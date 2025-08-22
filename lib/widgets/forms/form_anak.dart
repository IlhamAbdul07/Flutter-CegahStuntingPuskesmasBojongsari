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
        ReactiveTextField<String>(
          formControlName: 'berat_badan',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // izinkan angka + titik/koma satu kali
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([,]\d*)?$')),
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
        ReactiveTextField<String>(
          formControlName: 'tinggi_badan',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // izinkan angka + titik/koma satu kali
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([,]\d*)?$')),
          ],
          decoration: const InputDecoration(
            labelText: 'Tinggi Badan (cm)',
            helperText: "Contoh : 104.5",
            hintText: "Masukan Tinggi Badan Anak",
            border: OutlineInputBorder(),
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Masukan Tinggi Badan Anak',
          },
        ),
        const SizedBox(height: 16),

        //Lingkar Kepala
        ReactiveTextField<String>(
          formControlName: 'lingkar_kepala',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // izinkan angka + titik/koma satu kali
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([,]\d*)?$')),
          ],
          decoration: const InputDecoration(
            labelText: 'Lingkar Kepala (cm)',
            helperText: "Contoh : 36,5",
            hintText: "Masukan Ukuran Lingkar Kepala Anak",
            border: OutlineInputBorder(),
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Masukan Lingkar Kepala Anak',
          },
        ),
        const SizedBox(height: 16),

        //Lingkar Lengan
        ReactiveTextField<String>(
          formControlName: 'lingkar_lengan',
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            // izinkan angka + titik/koma satu kali
            FilteringTextInputFormatter.allow(RegExp(r'^\d*([,]\d*)?$')),
          ],
          decoration: const InputDecoration(
            labelText: 'Lingkar Lengan (cm)',
            hintText: "Masukan Lingkar Tangan Anak",
            helperText: "Contoh : 12,5",
            border: OutlineInputBorder(),
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Masukan Lingkar Tangan Anak',
          },
        ),
      ],
    );
  }
}
