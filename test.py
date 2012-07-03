import wm5

t1 = wm5.Transform()
t1.SetTranslate(wm5.APoint(1, 2, 3))
p1 = wm5.APoint(1, 1, 1)
print p1.X(), p1.Y(), p1.Z()  # 1.0 1.0 1.0
p1 = t1 * p1                  # Translate the point
print p1.X(), p1.Y(), p1.Z()  # 2.0 3.0 4.0
