import json
import random

places = [
    ('Home', 'POINT(-118.28917519590489 34.065875257511)'),
    ('SCA', 'POINT(-118.2863307695277 34.02363796963184)'),
    ('ASC', 'POINT(-118.28619245720276 34.02168816909867)'),
    ('VHE', 'POINT(-118.2880697586744 34.0200898563807)'),
    ('WAH', 'POINT(-118.28756223443736 34.019132559219486)'),
    ('HAR', 'POINT(-118.28711682010284 34.01911990254569)'),
    ('HOH', 'POINT(-118.28548159461309 34.0187623305564)'),
    ('LAW', 'POINT(-118.28444940155117 34.018998257958394)'),
    ('RGL', 'POINT(-118.28357307340833 34.01951719188072)'),
    ('DEN', 'POINT(-118.28576976444413 34.02359215080181)'),
    ('MCC', 'POINT(-118.28738103418613 34.024621091868234)'),
    ('KAP', 'POINT(-118.29054761688998 34.022555016012966)'),
    ('GER', 'POINT(-118.29057657302621 34.02014078369238)')
]

json_data = []

for place in places:
    name = place[0]
    loc_str = place[1].replace('POINT(', '').replace(')', '')
    loc = [float(x) for x in loc_str.split()]
    popularity = random.randint(0, 100)
    json_data.append({
        'name': name,
        'popularity': popularity,
        'loc': loc
    })

json_str = json.dumps(json_data, indent=2)
print(json_str)