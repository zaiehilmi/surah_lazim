import 'package:june/june.dart';
import 'package:surah_lazim/src/util/nombor_rawak.dart';

class SurahRawak extends JuneState {
  int surah_1 = 0;
  int surah_2 = 0;

  SurahRawak() {
    rombakBaru();
  }

  rombakBaru() {
    final (surah_1, surah_2) = dapatkanSurahRawak();
    this.surah_1 = surah_1;
    this.surah_2 = surah_2;
  }
}
