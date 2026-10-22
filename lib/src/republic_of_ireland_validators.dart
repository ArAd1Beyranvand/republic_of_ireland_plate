import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

/// Judges a plate in the form `YYH-CC-NNNNN`: a year and half-year (`131` is
/// the first half of 2013), a county code from the article's tables, and the
/// sequence number. Reports, never bars a keystroke.
///
/// The sequence is one to six digits (six on re-registered imports).
class RepublicOfIrelandValidator extends GatedPlateValidator {
  const RepublicOfIrelandValidator();

  @override
  String get gateGroup => 'serial';

  static final RegExp _year = RegExp(r'^\d\d[12]$');

  static const String reasonYear = 'The year is two digits and a half-year, 1 or 2.';
  static const String reasonCounty = 'That is not a county code.';
  static const String reasonSerial = 'The number is one to six digits.';

  @override
  PlateValidation judge(PlateEntry entry) {
    if (!_year.hasMatch(entry.group('year'))) {
      return const PlateValidation.invalid(reasonYear);
    }
    if (!RepublicOfIrelandAlphabets.countyNames.containsKey(entry.group('county'))) {
      return const PlateValidation.invalid(reasonCounty);
    }
    final String serial = entry.group('serial');
    if (!isDigits(serial) || serial.length > 6) {
      return const PlateValidation.invalid(reasonSerial);
    }
    return const PlateValidation.valid();
  }
}
