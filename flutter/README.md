FREE PALESTINE 🇮🇷🇵🇸 پاینده ایران

GO VEGAN 🌱

==================================

From the mighty people of Iran to the welcoming people of Ireland to view examples:

https://platexample.ir/#/discover/republicofireland:flutter

# republic_of_ireland_plate

Republic of Ireland's licence plates for plate_core: the standard white plate and the green-strip electric plate, with the EU band and Irish county names, and more.

## Languages

| Language | Folder | Example |
| --- | --- | --- |
| Flutter / Dart | [`flutter/`](https://github.com/ArAd1Beyranvand/republic_of_ireland_plate/tree/main/flutter) | [platexample](https://platexample.ir/#/discover/republicofireland:flutter) |
| Kotlin | [`kotlin/`](https://github.com/ArAd1Beyranvand/republic_of_ireland_plate/tree/main/kotlin) | [platexample](https://platexample.ir/#/discover/republicofireland:kotlin) |
| Python | [`python/`](https://github.com/ArAd1Beyranvand/republic_of_ireland_plate/tree/main/python) | [platexample](https://platexample.ir/#/discover/republicofireland:python) |
| TypeScript | [`typescript/`](https://github.com/ArAd1Beyranvand/republic_of_ireland_plate/tree/main/typescript) | [platexample](https://platexample.ir/#/discover/republicofireland:typescript) |

## Quick start

### Install

```yaml
dependencies:
  plate_core: ^0.12.0
  republic_of_ireland_plate: ^0.1.0
```

### Use

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

## Specs

Each spec is one plate layout.

- `RepublicOfIrelandPlates.standard`
- `RepublicOfIrelandPlates.electric`

## Themes

- `RepublicOfIrelandThemes.standard`

## Change it

`PlateCanvas` takes `spec:` (an entry of `RepublicOfIrelandPlates`) and `theme:` (an entry of `RepublicOfIrelandThemes`). Set `validator:` to `RepublicOfIrelandValidator()` and `autoValidate: true` to show validation hints.

## Also included

- `RepublicOfIrelandCountry` — the country panel.
- `RepublicOfIrelandValidator` — the plate validator.

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

## License

See [LICENSE](https://github.com/ArAd1Beyranvand/republic_of_ireland_plate/blob/main/LICENSE).
