/// Republic of Ireland's licence plates for the `plate_core` library.
///
/// The standard and electric plates, black on white with the EU band, and an
/// advisory validator.
library;

// TODO(py): [D5] one module `plates.countries.republic_of_ireland`; assets via importlib.resources.
// TODO(ts): [D5] one subpath export `./countries/republic_of_ireland`; tree-shakable.
// TODO(kt): [D5] package `countries.republic_of_ireland` in the countries module.
export 'package:plate_alphabet/plate_alphabet.dart'
    show RepublicOfIrelandAlphabets;

export 'src/republic_of_ireland_colors.dart';
export 'src/republic_of_ireland_country.dart';
export 'src/republic_of_ireland_plates.dart';
export 'src/republic_of_ireland_themes.dart';
export 'src/republic_of_ireland_validators.dart';
