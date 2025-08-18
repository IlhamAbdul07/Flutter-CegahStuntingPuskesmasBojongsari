import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';

class FormDiri extends StatelessWidget {
  const FormDiri({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Nama
        ReactiveTextField<String>(
          formControlName: 'nama',
          decoration: const InputDecoration(
            labelText: '* Nama Anak',
            helperText: "sebutkan nama anak anda",
            border: OutlineInputBorder(),
          ),
          validationMessages: {
            ValidationMessage.required: (_) => 'Nama wajib diisi',
          },
        ),
        const SizedBox(height: 16),

        // Dropdown jenis kelamin
        ReactiveDropdownField<String>(
          formControlName: 'jenis_kelamin',
          decoration: const InputDecoration(
            labelText: '* Jenis Kelamin',
            helperText: "Pilih Jenis Kelamin",
            border: OutlineInputBorder(),
          ),
          items: const [
            DropdownMenuItem(value: 'Laki-laki', child: Text('Laki-laki')),
            DropdownMenuItem(value: 'Perempuan', child: Text('Perempuan')),
          ],
          validationMessages: {
            ValidationMessage.required: (_) => 'Pilih jenis kelamin',
          },
        ),
        const SizedBox(height: 24),

        // Umur
        ReactiveDatePicker<DateTime>(
          formControlName: 'tanggal_lahir',
          fieldLabelText: "* Usia Anak",
          helpText: "Masukkan Tanggal Lahir Anak",
          firstDate: DateTime(2000),
          lastDate: DateTime.now(),
          builder: (context, picker, child) {
            return InkWell(
              onTap: picker.showPicker,
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Usia Anak',
                  border: OutlineInputBorder(),
                ),
                child: picker.value == null
                    ? const Text('Pilih tanggal')
                    : Text(
                        // Format hanya date, tanpa jam
                        "${picker.value!.day}-${picker.value!.month}-${picker.value!.year}",
                      ),
              ),
            );
          },
        ),
      ],
    );
  }
}
