from wm5 import Vector3d, Ray3d, Sphere3d, IntrRay3Sphere3d

# Create a ray.
origin = Vector3d(9999.9, 0, 0)
direction = Vector3d(-1, 0, 0)
ray = Ray3d(origin, direction)

# Create a sphere.
center = Vector3d(-1.0, 0, 0)
radius = 3.0
sphere = Sphere3d(center, radius)

# Intersect the ray and sphere.
intr = IntrRay3Sphere3d(ray, sphere)
intr.Find()
for index in range(intr.GetQuantity()):
    point = intr.GetPoint(index)
    #  (2.0 0.0 0.0)
    #  (-4.0 0.0 0.0)
    print(point.X(), point.Y(), point.Z())

