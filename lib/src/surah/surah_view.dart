import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:june/june.dart';
import 'package:surah_lazim/src/surah/surah_rawak.dart';
import 'package:surah_lazim/src/util/nombor_rawak.dart';

import '../settings/settings_view.dart';
import 'package:quran/quran.dart' as quran;

/// Displays a list of SampleItems.
class SurahView extends StatelessWidget {
  const SurahView({
    super.key,
  });

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          actions: [
            IconButton(
              onPressed: () {
                June.getState(SurahRawak())
                  ..rombakBaru()
                  ..setState();
              },
              icon: const Icon(Icons.update_rounded),
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                quran.basmala,
                style: TextStyle(fontSize: 40),
              ),

              // paparan nama surah
              JuneBuilder(
                () => SurahRawak(),
                builder: (vm) => Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _paparNamaSurah(vm.surah_2, 2),
                    _paparNamaSurah(vm.surah_1, 1),
                  ],
                ),
              ),

              // paparan surah
              Expanded(
                child: JuneBuilder(
                  () => SurahRawak(),
                  builder: (vm) => Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(child: _paparSurah(vm.surah_2)),
                      Expanded(child: _paparSurah(vm.surah_1)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Row _paparNamaSurah(int surah, int susunan) => Row(
        children: [
          Container(
            color: Colors.white24,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              quran.getSurahNameArabic(surah),
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 32),
            ),
          ),
          // const SizedBox(width: 15),
          Container(
            color: Colors.lightGreen,
            width: 40,
            child: Center(
              child: Text(
                susunan.toString(),
                textDirection: TextDirection.rtl,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      );

  ListView _paparSurah(int surah) => ListView.builder(
      itemCount: quran.getVerseCount(surah),
      itemBuilder: (context, index) => ListTile(
            title: Text(
              quran.getVerse(surah, index + 1, verseEndSymbol: false),
              textDirection: TextDirection.rtl,
              style: const TextStyle(fontSize: 50),
            ),
          ));
}
