
from math import pi, cos, sin

def spirograph_points(center_x, center_y, R, r, a, n, step_size=0.01):
    points = []
    t = 0
    while t < n*pi:
        t += step_size
        x = ((R+r)*cos((r/R)*t) - a*cos((1+r/R)*t))*0.0004
        y = ((R+r)*sin((r/R)*t) - a*sin((1+r/R)*t))*0.0004
        x += center_x
        y += center_y
        points.append((x, y))
    return points

# Center coordinates
center_x, center_y = -118.285449301237, 34.02057575094647

# Parameters for the spirograph
R = 6
r = 1
a = 8
num_points = 12

points = spirograph_points(center_x, center_y, R, r, a, num_points)
# print(points)
print(len(points))
head = '''
<kml xmlns="http://earth.google.com/kml/2.0">
<Document>

<Placemark>
<Point>
<coordinates>
-118.285449301237,
34.02057575094647
</coordinates>
</Point>
</Placemark>
<Placemark>
    <name></name>
    <LineString>
     <coordinates>

'''

tail = '''
 </coordinates>
    </LineString>
  </Placemark>
</Document>
</kml>
'''



content = "".join([
" "+str(point[0])+','+str(point[1])+" "
    for point in points
])


with open('spiro.kml', 'w') as f:
    f.write(head+content+tail)