"""Port of republic_of_ireland_plate/lib/src/republic_of_ireland_validators.dart. Hand-ported; codegen never overwrites this file."""
from __future__ import annotations

import re
from dataclasses import dataclass

from plates.core.validators.plate_validator import GatedPlateValidator, PlateEntry, PlateValidation, is_digits

_YEAR = re.compile(r'[0-9][0-9][12]')
_COUNTIES = frozenset(('C CE CN CW D DL G KE KK KY L LD LH LM LS MH MN MO OY RN SO T W WH WX WW '
                       'LK TN TS WD').split())

REASON_YEAR = 'The year is two digits and a half-year, 1 or 2.'
REASON_COUNTY = 'That is not a county code.'
REASON_SERIAL = 'The number is one to six digits.'


@dataclass(frozen=True)
class RepublicOfIrelandValidator(GatedPlateValidator):
    gate_group = 'serial'

    def judge(self, entry: PlateEntry) -> PlateValidation:
        if not _YEAR.fullmatch(entry.group('year')):
            return PlateValidation.invalid(REASON_YEAR)
        if entry.group('county') not in _COUNTIES:
            return PlateValidation.invalid(REASON_COUNTY)
        serial = entry.group('serial')
        if not is_digits(serial) or len(serial) > 6:
            return PlateValidation.invalid(REASON_SERIAL)
        return PlateValidation.valid()
