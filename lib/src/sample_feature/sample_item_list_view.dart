import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:surah_lazim/src/util/nombor_rawak.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'package:quran/quran.dart' as quran;

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
  });

  static const routeName = '/';

  final List<SampleItem> items;

  @override
  Widget build(BuildContext context) {
    final (surah_1, surah_2) = dapatkanSurahRawak();

    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.appTitle),
          actions: [
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '2  ${quran.getSurahNameArabic(surah_2)}',
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    '1  ${quran.getSurahNameArabic(surah_2)}',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
