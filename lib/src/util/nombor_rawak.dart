// ignore_for_file: constant_identifier_names

import 'dart:math';
import 'package:quran/quran.dart' as quran;

(int surah_1, int surah_2) dapatkanSurahRawak() {
  const an_naba = 78;

  final rawak = Random();
  final surah_1 = an_naba + rawak.nextInt(quran.totalSurahCount - an_naba);
  final surah_2 = surah_1 + rawak.nextInt(quran.totalSurahCount - surah_1) + 1;

  return (surah_1, surah_2);
}
