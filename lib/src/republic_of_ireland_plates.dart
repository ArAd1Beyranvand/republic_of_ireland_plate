import 'package:flutter/widgets.dart' show EdgeInsets;
import 'package:plate_alphabet/plate_alphabet.dart';
import 'package:plate_core/plate_core.dart';

import 'republic_of_ireland_colors.dart';
import 'republic_of_ireland_country.dart';

/// Where the ink sits, in plate units. Measured off the flattened references
/// (`Ireland_license_plate__EV_`, `Revised_format_Republic_of_Ireland_numberplate__2013-_`),
/// both normalised to the 520×110 mm the article gives (4 px per unit, and a
/// 1-unit margin around the frame that is left in).
///
/// Serial row: ink y 27.8–96.0 (68.2 tall, centre 61.9). Cells of `252-D-23456`
/// are centred 71.4, 114.0, 156.6 | hyphen 190.0 | 223.5 | hyphen 257.0 |
/// 288.4, 331.0, 373.4, 416.3, 458.7: pitch 42.5 inside a group, 33.4 from a
/// group's last character to a hyphen and 33.5 beyond it (31.4 before the
/// number). Ink is 35 wide. Hyphens are 22 × 9.4 at y 60.8–70.2.
///
/// The ink is 68 tall on a 110 canvas; a box that tall would need ~124, so the
/// box is capped at the largest that stays on the canvas (96.2 about the
/// ink's centre) and the ink lands near 72% of reference.
///
/// Caption (Irish county name): cap height 12.0, y 11.2–23.2, centred on the
/// field between the euroband and the right edge (265 with the electric strip,
/// 280 without). `IRL`: white, y 67.8–87.2, x 11.5–40.2. Stars: x 9–43,
/// y 18.5–51.8, FFCC00.
///
/// Background: a blue column ending at x = 46 (blue measured 6.0–45.8 inside
/// the frame; the frame paints over the outer part). The electric plate adds a
/// green column from x = 484.5 (measured 484.5–514.2) to the edge.
abstract final class _Layout {
  static const double width = 520, height = 110;
  static const double bandEnd = 46, stripStart = 484.5;

  static const double serialCy = 61.9, serialBox = 96;
  static const double pitch = 42.5;
  static const double firstCx = 71.4, lastCx = 458.7;
  static const double toHyphen = 33.4, fromHyphen = 33.5, toNumber = 31.4;

  static const double hyphenWidth = 22, hyphenTop = 60.8, hyphenHeight = 9.4;

  static const double captionCy = 17.2, captionBox = 24, captionGlyph = 23.5;
  static const double captionWidth = 300;

  static const double irlLeft = 2.85, irlTop = 65.5, irlWidth = 46;
  static const double irlHeight = 24, irlGlyph = 26;
}

/// The Irish plate, `YYH-CC-NNNNN`, with the Irish-language county name above
/// the number and the EU band at the left.
///
/// [standard] and [electric] are Dublin's; [standardFor] and [electricFor] take
/// any county code from [RepublicOfIrelandAlphabets.countyNames], which fixes
/// both the caption and whether the code takes one slot or two. Groups `year`,
/// `county`, `serial`. Both pair with [RepublicOfIrelandThemes.standard].
///
/// [electric] is the optional green strip at the right edge, from July 2025.
/// Not implemented: the square-plate variant (green under the euroband), the
/// ZZ temporary, diplomatic, trade and historic plates, for which no reference
/// was measured, and the 1987–2012 `YY-CC-NNNNNN` format. The red plate in the
/// photo set is not Irish and is not used. The article names no Israel-specific
/// value.
abstract final class RepublicOfIrelandPlates {
  static final PlateSpec standard = standardFor('D');
  static final PlateSpec electric = electricFor('D');

  static PlateSpec standardFor(String county) => _spec(county, electric: false);

  static PlateSpec electricFor(String county) => _spec(county, electric: true);

  static List<PlateSpec> get all => <PlateSpec>[standard, electric];

  static PlateSpec _spec(String county, {required bool electric}) {
    final String? caption = RepublicOfIrelandAlphabets.countyNames[county];
    if (caption == null) {
      throw ArgumentError.value(county, 'county', 'Not a county code');
    }
    final int letters = county.length;

    // Cell centres, in reading order, then squeezed so the number still ends at
    // lastCx when the county takes two letters.
    final List<double> raw = <double>[0, _Layout.pitch, 2 * _Layout.pitch];
    raw.add(raw.last + _Layout.toHyphen + _Layout.fromHyphen);
    for (int i = 1; i < letters; i++) {
      raw.add(raw.last + _Layout.pitch);
    }
    raw.add(raw.last + _Layout.toHyphen + _Layout.toNumber);
    for (int i = 1; i < 5; i++) {
      raw.add(raw.last + _Layout.pitch);
    }
    final double scale = (_Layout.lastCx - _Layout.firstCx) / raw.last;
    final List<double> cx = <double>[
      for (final double r in raw) _Layout.firstCx + r * scale,
    ];
    final double pitch = _Layout.pitch * scale;
    final int countyAt = 3, serialAt = 3 + letters;

    PlateSlot slot(PlateAlphabet a, double c) => PlateSlot(
      alphabet: a,
      box: PlateBox(
        c - pitch / 2,
        _Layout.serialCy - _Layout.serialBox / 2,
        pitch,
        _Layout.serialBox,
      ),
    );

    PlateRule hyphen(double c) => PlateRule(
      box: PlateBox(
        c - _Layout.hyphenWidth / 2,
        _Layout.hyphenTop,
        _Layout.hyphenWidth,
        _Layout.hyphenHeight,
      ),
    );

    final double fieldEnd = electric ? _Layout.stripStart : _Layout.width;
    final double captionCx = (_Layout.bandEnd + fieldEnd) / 2;

    return PlateSpec(
      id: 'ie.${electric ? 'electric' : 'standard'}.$county',
      country: RepublicOfIrelandCountry.republic_of_ireland,
      canvasWidth: _Layout.width,
      canvasHeight: _Layout.height,
      panel: const PlatePanel(
        box: PlateBox(0, 0, _Layout.bandEnd, 70.4),
        padding: EdgeInsets.zero,
      ),
      background: PlateSection.columns(<PlatePart>[
        const PlatePart(
          PlateSection.fill(PlateFill.panel),
          end: _Layout.bandEnd,
        ),
        PlatePart(PlateSection.plain, end: electric ? fieldEnd : null),
        if (electric)
          const PlatePart(
            PlateSection.fill(PlateFill.color(RepublicOfIrelandColors.green)),
          ),
      ]),
      slots: <PlateSlot>[
        for (int i = 0; i < 3; i++)
          slot(RepublicOfIrelandAlphabets.digits, cx[i]),
        for (int i = 0; i < letters; i++)
          slot(RepublicOfIrelandAlphabets.countyLetters, cx[countyAt + i]),
        for (int i = 0; i < 5; i++)
          slot(RepublicOfIrelandAlphabets.digits, cx[serialAt + i]),
      ],
      rules: <PlateRule>[
        hyphen((cx[2] + cx[3]) / 2),
        hyphen((cx[serialAt - 1] + cx[serialAt]) / 2),
      ],
      labels: <PlateLabel>[
        PlateLabel(
          text: caption,
          box: PlateBox(
            captionCx - _Layout.captionWidth / 2,
            _Layout.captionCy - _Layout.captionBox / 2,
            _Layout.captionWidth,
            _Layout.captionBox,
          ),
          glyphHeight: _Layout.captionGlyph,
        ),
        const PlateLabel(
          text: 'IRL',
          box: PlateBox(
            _Layout.irlLeft,
            _Layout.irlTop,
            _Layout.irlWidth,
            _Layout.irlHeight,
          ),
          glyphHeight: _Layout.irlGlyph,
          color: RepublicOfIrelandColors.white,
        ),
      ],
      textGroups: <PlateTextGroup>[
        const PlateTextGroup(<int>[0, 1, 2], key: 'year'),
        PlateTextGroup(<int>[
          for (int i = 0; i < letters; i++) countyAt + i,
        ], key: 'county'),
        PlateTextGroup(<int>[
          for (int i = 0; i < 5; i++) serialAt + i,
        ], key: 'serial'),
      ],
    );
  }
}
