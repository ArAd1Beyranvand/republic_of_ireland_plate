FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Ireland to view examples:

https://platexample.ir/#/discover/republicofireland

# republic_of_ireland_plate

Republic of Ireland's licence plates for the `plate_core` library. The standard and electric plates, black on white with the EU band, and an advisory validator.

## Install

```yaml
dependencies:
  plate_core: ^0.12.0
  republic_of_ireland_plate: ^0.1.0
```

## Use

```dart
import 'package:plate_core/plate_core.dart';
import 'package:republic_of_ireland_plate/republic_of_ireland_plate.dart';

PlateCanvas(
  spec: RepublicOfIrelandPlates.standard,
  theme: RepublicOfIrelandThemes.standard,
  validator: const RepublicOfIrelandValidator(),
  autoValidate: true,
  onChooseCharacter: noCharacterChooser,
);
```

## Contains

- `RepublicOfIrelandCountry` — country panel: `republic_of_ireland`.
- `RepublicOfIrelandPlates` — 2 plate specs: `standard`, `electric`.
- `RepublicOfIrelandThemes` — 1 theme: `standard`.
- `RepublicOfIrelandValidator` — advisory validator; flags the frame, never blocks a keystroke.

## Plates

The Irish plate, `YYH-CC-NNNNN`, with the Irish-language county name above
the number and the EU band at the left.

The caption follows the typed county code
(`RepublicOfIrelandAlphabets.countyNames`); the county field holds one or
two letters and the serial one to six digits. Groups `year`, `county`, `serial`. Both pair with
`RepublicOfIrelandThemes.standard`.

`electric` adds the optional green strip at the right edge, from July 2025.
Not implemented, for lack of a measured reference: the square-plate variant
(green under the euroband), the ZZ temporary, diplomatic, trade and historic
plates, and the 1987–2012 `YY-CC-NNNNNN` format.

## Part of plate

Painted by [`plate_core`](https://pub.dev/packages/plate_core); alphabets shared through [`plate_alphabet`](https://pub.dev/packages/plate_alphabet); optional character picker in [`plate_keypad`](https://pub.dev/packages/plate_keypad).

