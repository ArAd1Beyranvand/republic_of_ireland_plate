import 'package:plate_core/plate_core.dart';

import 'republic_of_ireland_colors.dart';

/// The EU band. The `IRL` beneath the stars is a [PlateLabel] on each spec so
/// it sits where it was measured, and [captionLines] is empty to avoid
/// printing it twice.
abstract final class RepublicOfIrelandCountry {
  // ignore: constant_identifier_names
  static const PlateCountry republic_of_ireland = PlateCountry(
    code: 'ie',
    captionLines: <String>[],
    panelColor: RepublicOfIrelandColors.blue,
    panelTextColor: RepublicOfIrelandColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: EuropeanStars.band,
  );
}
