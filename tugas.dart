// Nama file: main.dart
// Tugas: Dart Essentials
// Deskripsi: Program input data diri, list mata kuliah, harapan nilai, dan kata motivasi (asynchronous)

import 'dart:io';
import 'dart:async';

void main() async {
  print('============================');
  print('     TUGAS DART ESSENTIALS   ');
  print('============================\n');

  // ==== Input Data Diri ====
  stdout.write('Nama Lengkap   : ');
  String nama = stdin.readLineSync() ?? '';

  stdout.write('NIM            : ');
  String nim = stdin.readLineSync() ?? '';

  stdout.write('Program Studi  : ');
  String prodi = stdin.readLineSync() ?? '';

  stdout.write('Email Akademik : ');
  String email = stdin.readLineSync() ?? '';

  print('\nData diri berhasil disimpan!\n');

  // ==== Input Mata Kuliah ====
  stdout.write('Masukkan jumlah mata kuliah yang diambil: ');
  int jumlah = int.parse(stdin.readLineSync() ?? '0');

  List<String> matkul = [];
  List<String> harapanNilai = [];

  for (int i = 0; i < jumlah; i++) {
    print('\nMata kuliah ke-${i + 1}:');
    stdout.write('Nama mata kuliah : ');
    String namaMatkul = stdin.readLineSync() ?? '';

    stdout.write('Harapan nilai    : ');
    String nilai = stdin.readLineSync() ?? '';

    matkul.add(namaMatkul);
    harapanNilai.add(nilai);
  }

  // ==== Menampilkan Data ====
  print('\n============================');
  print('        DATA MAHASISWA      ');
  print('============================');
  print('Nama   : $nama');
  print('NIM    : $nim');
  print('Prodi  : $prodi');
  print('Email  : $email');
  print('\nMata Kuliah dan Harapan Nilai:');

  if (matkul.isEmpty) {
    print('- Tidak ada mata kuliah yang diinput.');
  } else {
    for (int i = 0; i < matkul.length; i++) {
      print('  ${i + 1}. ${matkul[i]} → Harapan Nilai: ${harapanNilai[i]}');
    }
  }

  // ==== Asynchronous Kata Motivasi ====
  print('\nMenunggu kata motivasi...');
  String motivasi = await ambilMotivasi();
  print('\nKata Motivasi Hari Ini:');
  print('"$motivasi"');
}

// Fungsi async untuk ambil kata motivasi
Future<String> ambilMotivasi() async {
  await Future.delayed(Duration(seconds: 1)); // simulasi delay
  List<String> kata = [
    'Terus belajar, jangan takut gagal!',
    'Setiap baris kode adalah langkah menuju sukses.',
    'Kesuksesan lahir dari konsistensi, bukan kebetulan.',
    'Jangan menyerah sebelum titik koma terakhir.',
    'Kegigihanmu hari ini menentukan hasil besok.',
  ];
  return kata[DateTime.now().second % kata.length];
}
