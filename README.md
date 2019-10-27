# gcode
Simple Python [G-code](https://en.wikipedia.org/wiki/G-code) generator

## Example usage

```python
from gcode import gcode

g = gcode(material = "ACRYLIC")
g.drill(0, 0, -3.5)
g.circular_pocket(-7, 7, r = 4, depth = -4, finishing_pass = 0.05)
g.circular_profile(-10, -10, r = 4, depth = -4, finishing_pass = 0.05)
g.circular_profile(-10, -10, r = 5, depth = -4, inside = False, finishing_pass = 0.05)
g.rectangular_pocket(3, 11, 3, 11, depth = -3, finishing_pass = 0.05)
g.rectangular_profile(6, 14, -14, -6, depth = -3, finishing_pass = 0.05)
g.rectangular_profile(5, 15, -15, -5, depth = -3, inside = False, finishing_pass = 0.05)
g.end()
g.save("gcode/demo.gcode")
```
