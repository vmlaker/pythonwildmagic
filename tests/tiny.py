import wm5

# Perform a simple translation.
trans = wm5.Transform()
trans.SetTranslate(wm5.APoint(1, 2, 3))
point = wm5.APoint(1, 1, 1)
print point.X(), point.Y(), point.Z()  # 1.0 1.0 1.0
point = trans * point                
print point.X(), point.Y(), point.Z()  # 2.0 3.0 4.0

# Create a ray.
origin = wm5.Vector3d(9999.9, 0, 0)
direction = wm5.Vector3d(-1, 0, 0)
ray = wm5.Ray3d(origin, direction)

# Create a sphere.
center = wm5.Vector3d(-1.0, 0, 0)
radius = 3.0
sphere = wm5.Sphere3d(center, radius)

# Intersect the ray and sphere.
intr = wm5.IntrRay3Sphere3d(ray, sphere)
print intr.Find()                 
for index in range(intr.GetQuantity()):
    point = intr.GetPoint(index)

    #  2.0 0.0 0.0
    #  -4.0 0.0 0.0
    print point.X(), point.Y(), point.Z()

