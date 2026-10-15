import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:republic_of_ireland_plate/republic_of_ireland_plate.dart';
import 'package:plate_core/plate_core.dart';

/// One golden per category, drawn with real bold faces so the ink can be
/// measured against the references (`platekit golden-check`).
///
/// Regenerate with `flutter test --update-goldens` after a deliberate change.
void main() {
  setUpAll(() async {
    final FontLoader loader = FontLoader('Roboto');
    for (final String path in const <String>[
      '/usr/share/fonts/truetype/dejavu/DejaVuSans-Bold.ttf',
    ]) {
      final File face = File(path);
      if (!face.existsSync()) continue;
      loader.addFont(face.readAsBytes().then((b) => ByteData.view(b.buffer)));
    }
    await loader.load();
  });

  /// category id -> (spec, theme, space-separated sample value, one per field)
  final Map<String, (PlateSpec, PlateTheme, String)> cases =
      <String, (PlateSpec, PlateTheme, String)>{
        'standard': (
          RepublicOfIrelandPlates.standard,
          RepublicOfIrelandThemes.standard,
          '252 D 23456',
        ),
        'electric': (
          RepublicOfIrelandPlates.electric,
          RepublicOfIrelandThemes.standard,
          '252 D 23456',
        ),
        'clare_short_serial': (
          RepublicOfIrelandPlates.standardFor('CE'),
          RepublicOfIrelandThemes.standard,
          '241 CE 6',
        ),
        'six_digit_serial': (
          RepublicOfIrelandPlates.standard,
          RepublicOfIrelandThemes.standard,
          '131 W 123456',
        ),
      };

  for (final MapEntry<String, (PlateSpec, PlateTheme, String)> c
      in cases.entries) {
    testWidgets(c.key, (tester) async {
      final (PlateSpec spec, PlateTheme theme, String values) = c.value;
      final PlateController controller = PlateController.fromValues(
        spec,
        values.split(' '),
      );
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 680,
                height: 300,
                child: PlateThemeScope(
                  theme: theme,
                  child: PlateView(
                    controller: controller,
                    theme: theme,
                    country: RepublicOfIrelandCountry.republic_of_ireland,
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await expectLater(
        find.byType(PlateView),
        matchesGoldenFile('goldens/ie_${c.key}.png'),
      );
      await tester.pumpWidget(const SizedBox.shrink());
      controller.dispose();
    });
  }

  test('fields are one slot each and complete at their minimum', () {
    final PlateSpec spec = RepublicOfIrelandPlates.standardFor('CE');
    expect(spec.slots.map((PlateSlot s) => s.length), <int>[3, 2, 6]);
    expect(spec.slots.map((PlateSlot s) => s.minLength), <int>[3, 1, 1]);
    PlateController c = PlateController.fromValues(spec, ['241', 'C', '6']);
    expect(c.isCompleted, isTrue);
    c.dispose();
    c = PlateController.fromValues(spec, ['241', 'C', null]);
    expect(c.isCompleted, isFalse);
    c.dispose();
    c = PlateController.fromValues(spec, ['24', 'CE', '6']);
    expect(c.isCompleted, isFalse);
    c.dispose();
  });
}
