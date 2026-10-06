import 'package:plate_core/plate_core.dart';

import 'republic_of_ireland_colors.dart';

/// Ireland as a `PlateCountry`: the EU band. The twelve stars are drawn into
/// the asset (generated from their geometry, no image was downloaded); the
/// `IRL` beneath them is a [PlateLabel] on each spec, so it can be placed
/// where it was measured, and [captionLines] is left empty to avoid printing it
/// twice.
abstract final class RepublicOfIrelandCountry {
  // ignore: constant_identifier_names
  static const PlateCountry republic_of_ireland = PlateCountry(
    code: 'ie',
    captionLines: <String>[],
    panelColor: RepublicOfIrelandColors.blue,
    panelTextColor: RepublicOfIrelandColors.white,
    flagAspectRatio: 46 / 70.4,
    flag: SvgPlateAsset(
      'assets/flags/Flag_of_Europe.svg',
      package: 'republic_of_ireland_plate',
    ),
  );
}
