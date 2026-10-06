import 'package:plate_core/plate_core.dart';

import 'republic_of_ireland_colors.dart';

/// Black ink on a white field. The reference frame is 4.75 of 110 thick
/// (0.043) and its corner arc about 10 (0.09), both measured off the flattened
/// photo.
abstract final class RepublicOfIrelandThemes {
  static final PlateTheme standard = PlateTheme.monochrome(
    field: RepublicOfIrelandColors.white,
    ink: RepublicOfIrelandColors.black,
    inactive: RepublicOfIrelandColors.inactive,
    borderWidthRatio: 0.043,
    plateRadiusRatio: 0.09,
  );
}
