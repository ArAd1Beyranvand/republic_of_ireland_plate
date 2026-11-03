import 'package:flutter/widgets.dart';
import 'package:plate_core/plate_core.dart';
import 'package:republic_of_ireland_plate/republic_of_ireland_plate.dart';

void main() => runApp(
  PlateExampleApp(
    spec: RepublicOfIrelandPlates.standard,
    theme: RepublicOfIrelandThemes.standard,
  ),
);
