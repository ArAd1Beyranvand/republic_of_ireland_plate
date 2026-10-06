import 'package:flutter/widgets.dart';

/// The colours of the current Irish plate, each sampled from the flattened
/// reference `Ireland_license_plate__EV_` (modal pixel of the region): the
/// euroband `003399`, its stars `FFCC00`, the electric-vehicle strip `00B74F`.
/// The field and ink read `FFFFFF` and `000000` in the same photo.
abstract final class RepublicOfIrelandColors {
  static const Color blue = Color(0xFF003399);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color green = Color(0xFF00B74F);
  static const Color inactive = Color(0xFFB0B0B0);
}
