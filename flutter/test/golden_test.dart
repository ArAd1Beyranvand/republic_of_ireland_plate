import 'package:flutter_test/flutter_test.dart';
import 'package:plate_core/plate_core.dart';
import 'package:plate_core/testing.dart';
import 'package:republic_of_ireland_plate/republic_of_ireland_plate.dart';

void main() {
  plateGoldens(
    'ie',
    RepublicOfIrelandCountry.republic_of_ireland,
    <String, PlateGoldenCase>{
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
        RepublicOfIrelandPlates.standard,
        RepublicOfIrelandThemes.standard,
        '241 CE 6',
      ),
      'six_digit_serial': (
        RepublicOfIrelandPlates.standard,
        RepublicOfIrelandThemes.standard,
        '131 W 123456',
      ),
    },
  );

  test('fields are one slot each and complete at their minimum', () {
    final PlateSpec spec = RepublicOfIrelandPlates.standard;
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
