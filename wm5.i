//////////////////////////////////////////////////
//
//  SWIG Library File for building Python wrappers
//  of Geometric Tools' Wild Magic C++ Libraries.
//
//////////////////////////////////////////////////

%module wm5
%{

//  LibCore
#include "Wm5Core.h"
#include "Wm5CoreLIB.h"
#include "Wm5CorePCH.h"
//  LibCore/Assert
#include "Wm5Assert.h"
//  LibCore/DataTypes
#include "Wm5MinHeap.h"
#include "Wm5Table.h"
#include "Wm5Tuple.h"
//  LibCore/InputOutput
#include "Wm5BufferIO.h"
#include "Wm5Endian.h"
#include "Wm5Environment.h"
#include "Wm5FileIO.h"
//  LibCore/Memory
#include "Wm5Memory.h"
#include "Wm5SmartPointer.h"
//  LibCore/ObjectSystems
#include "Wm5InStream.h"
#include "Wm5InitTerm.h"
#include "Wm5Names.h"
#include "Wm5Object.h"
#include "Wm5OutStream.h"
#include "Wm5Rtti.h"
#include "Wm5Stream.h"
//  LibCore/Threading
#include "Wm5Mutex.h"
#include "Wm5MutexType.h"
#include "Wm5ScopedCS.h"
#include "Wm5Thread.h"
#include "Wm5ThreadType.h"
//  LibCore/Time
#include "Wm5Time.h"
//  LibMathematics
#include "Wm5Mathematics.h"
#include "Wm5MathematicsLIB.h"
#include "Wm5MathematicsPCH.h"
//  LibMathematics/Algebra
#include "Wm5APoint.h"
#include "Wm5AVector.h"
#include "Wm5BandedMatrix.h"
#include "Wm5GMatrix.h"
#include "Wm5GVector.h"
#include "Wm5HMatrix.h"
#include "Wm5HPlane.h"
#include "Wm5HPoint.h"
#include "Wm5HQuaternion.h"
#include "Wm5Matrix2.h"
#include "Wm5Matrix3.h"
#include "Wm5Matrix4.h"
#include "Wm5Polynomial1.h"
#include "Wm5Quaternion.h"
#include "Wm5Vector2.h"
#include "Wm5Vector3.h"
#include "Wm5Vector4.h"
//  LibMathematics/Approximation
#include "Wm5ApprCircleFit2.h"
#include "Wm5ApprCylinderFit3.h"
#include "Wm5ApprEllipseByArcs2.h"
#include "Wm5ApprEllipseFit2.h"
#include "Wm5ApprEllipsoidFit3.h"
#include "Wm5ApprGaussPointsFit2.h"
#include "Wm5ApprGaussPointsFit3.h"
#include "Wm5ApprGreatCircleFit3.h"
#include "Wm5ApprLineFit2.h"
#include "Wm5ApprLineFit3.h"
#include "Wm5ApprParaboloidFit3.h"
#include "Wm5ApprPlaneFit3.h"
#include "Wm5ApprPolyFit2.h"
#include "Wm5ApprPolyFit3.h"
#include "Wm5ApprPolyFit4.h"
#include "Wm5ApprPolynomialFit2.h"
#include "Wm5ApprPolynomialFit3.h"
#include "Wm5ApprPolynomialFit4.h"
#include "Wm5ApprQuadraticFit2.h"
#include "Wm5ApprQuadraticFit3.h"
#include "Wm5ApprSphereFit3.h"
//  LibMathematics/Base
#include "Wm5BitHacks.h"
#include "Wm5Float1.h"
#include "Wm5Float2.h"
#include "Wm5Float3.h"
#include "Wm5Float4.h"
#include "Wm5Math.h"
//  LibMathematics/ComputationalGeometry
#include "Wm5ConvexHull.h"
#include "Wm5ConvexHull1.h"
#include "Wm5ConvexHull2.h"
#include "Wm5ConvexHull3.h"
#include "Wm5Delaunay.h"
#include "Wm5Delaunay1.h"
#include "Wm5Delaunay2.h"
#include "Wm5Delaunay3.h"
#include "Wm5IncrementalDelaunay2.h"
#include "Wm5TriangulateEC.h"
//  LibMathematics/Containment
#include "Wm5ContBox2.h"
#include "Wm5ContBox3.h"
#include "Wm5ContCapsule3.h"
#include "Wm5ContCylinder3.h"
#include "Wm5ContEllipse2.h"
#include "Wm5ContEllipse2MinCR.h"
#include "Wm5ContEllipsoid3.h"
#include "Wm5ContEllipsoid3MinCR.h"
#include "Wm5ContLozenge3.h"
#include "Wm5ContMinBox2.h"
#include "Wm5ContMinBox3.h"
#include "Wm5ContMinCircle2.h"
#include "Wm5ContMinSphere3.h"
#include "Wm5ContPointInPolygon2.h"
#include "Wm5ContPointInPolyhedron3.h"
#include "Wm5ContScribeCircle2.h"
#include "Wm5ContScribeCircle3Sphere3.h"
#include "Wm5ContSeparatePoints2.h"
#include "Wm5ContSeparatePoints3.h"
#include "Wm5ContSphere3.h"
//  LibMathematics/CurvesSurfacesVolumes
#include "Wm5BSplineBasis.h"
#include "Wm5Curve2.h"
#include "Wm5Curve3.h"
#include "Wm5SingleCurve2.h"
#include "Wm5SingleCurve3.h"
#include "Wm5BSplineCurve2.h"
#include "Wm5BSplineCurve3.h"
#include "Wm5BSplineCurveFit.h"
#include "Wm5BSplineFitBasis.h"
#include "Wm5RiemannianGeodesic.h"
#include "Wm5ParametricSurface.h"
#include "Wm5BSplineGeodesic.h"
#include "Wm5BSplineRectangle.h"
#include "Wm5BSplineReduction.h"
#include "Wm5BSplineSurfaceFit.h"
#include "Wm5BSplineVolume.h"
#include "Wm5BezierCurve2.h"
#include "Wm5BezierCurve3.h"
#include "Wm5CubicPolynomialCurve2.h"
#include "Wm5CubicPolynomialCurve3.h"
#include "Wm5EllipsoidGeodesic.h"
#include "Wm5ImplicitSurface.h"
#include "Wm5MultipleCurve2.h"
#include "Wm5MultipleCurve3.h"
#include "Wm5NURBSCurve2.h"
#include "Wm5NURBSCurve3.h"
#include "Wm5NURBSRectangle.h"
#include "Wm5NaturalSpline1.h"
#include "Wm5NaturalSpline2.h"
#include "Wm5NaturalSpline3.h"
#include "Wm5PolynomialCurve2.h"
#include "Wm5PolynomialCurve3.h"
#include "Wm5QuadricSurface.h"
#include "Wm5Surface.h"
#include "Wm5TCBSpline2.h"
#include "Wm5TCBSpline3.h"
//  LibMathematics/Interpolation
#include "Wm5IntpAkima1.h"
#include "Wm5IntpAkimaNonuniform1.h"
#include "Wm5IntpAkimaUniform1.h"
#include "Wm5IntpAkimaUniform2.h"
#include "Wm5IntpAkimaUniform3.h"
#include "Wm5IntpBSplineUniform.h"
#include "Wm5IntpBSplineUniform1.h"
#include "Wm5IntpBSplineUniform2.h"
#include "Wm5IntpBSplineUniform3.h"
#include "Wm5IntpBSplineUniform4.h"
#include "Wm5IntpBSplineUniformN.h"
#include "Wm5IntpBicubic2.h"
#include "Wm5IntpBilinear2.h"
#include "Wm5IntpLinearNonuniform2.h"
#include "Wm5IntpLinearNonuniform3.h"
#include "Wm5IntpQdrNonuniform2.h"
#include "Wm5IntpSphere2.h"
#include "Wm5IntpThinPlateSpline2.h"
#include "Wm5IntpThinPlateSpline3.h"
#include "Wm5IntpTricubic3.h"
#include "Wm5IntpTrilinear3.h"
#include "Wm5IntpVectorField2.h"
//  LibMathematics/Intersection
#include "Wm5Intersector.h"
#include "Wm5Intersector1.h"
#include "Wm5IntrArc2Arc2.h"
#include "Wm5IntrArc2Circle2.h"
#include "Wm5IntrBox2Box2.h"
#include "Wm5IntrBox2Circle2.h"
#include "Wm5IntrBox3Box3.h"
#include "Wm5IntrBox3Frustum3.h"
#include "Wm5IntrBox3Sphere3.h"
#include "Wm5IntrCapsule3Capsule3.h"
#include "Wm5IntrCircle2Circle2.h"
#include "Wm5IntrCircle3Plane3.h"
#include "Wm5IntrEllipse2Ellipse2.h"
#include "Wm5IntrEllipsoid3Ellipsoid3.h"
#include "Wm5IntrHalfspace3Box3.h"
#include "Wm5IntrHalfspace3Segment3.h"
#include "Wm5IntrHalfspace3Sphere3.h"
#include "Wm5IntrHalfspace3Triangle3.h"
#include "Wm5IntrLine2Arc2.h"
#include "Wm5IntrLine2Box2.h"
#include "Wm5IntrLine2Circle2.h"
#include "Wm5IntrLine2Line2.h"
#include "Wm5IntrLine2Ray2.h"
#include "Wm5IntrLine2Segment2.h"
#include "Wm5IntrLine2Triangle2.h"
#include "Wm5IntrLine3Box3.h"
#include "Wm5IntrLine3Capsule3.h"
#include "Wm5IntrLine3Cone3.h"
#include "Wm5IntrLine3Cylinder3.h"
#include "Wm5IntrLine3Ellipsoid3.h"
#include "Wm5IntrLine3Lozenge3.h"
#include "Wm5IntrLine3Plane3.h"
#include "Wm5IntrLine3Sphere3.h"
#include "Wm5IntrLine3Torus3.h"
#include "Wm5IntrLine3Triangle3.h"
#include "Wm5IntrLozenge3Lozenge3.h"
#include "Wm5IntrPlane3Box3.h"
#include "Wm5IntrPlane3Capsule3.h"
#include "Wm5IntrPlane3Cylinder3.h"
#include "Wm5IntrPlane3Ellipsoid3.h"
#include "Wm5IntrPlane3Lozenge3.h"
#include "Wm5IntrPlane3Plane3.h"
#include "Wm5IntrPlane3Sphere3.h"
#include "Wm5IntrPlane3Triangle3.h"
#include "Wm5IntrRay2Arc2.h"
#include "Wm5IntrRay2Box2.h"
#include "Wm5IntrRay2Circle2.h"
#include "Wm5IntrRay2Ray2.h"
#include "Wm5IntrRay2Segment2.h"
#include "Wm5IntrRay2Triangle2.h"
#include "Wm5IntrRay3Box3.h"
#include "Wm5IntrRay3Capsule3.h"
#include "Wm5IntrRay3Cylinder3.h"
#include "Wm5IntrRay3Ellipsoid3.h"
#include "Wm5IntrRay3Lozenge3.h"
#include "Wm5IntrRay3Plane3.h"
#include "Wm5IntrRay3Sphere3.h"
#include "Wm5IntrRay3Triangle3.h"
#include "Wm5IntrSegment2Arc2.h"
#include "Wm5IntrSegment2Box2.h"
#include "Wm5IntrSegment2Circle2.h"
#include "Wm5IntrSegment2Segment2.h"
#include "Wm5IntrSegment2Triangle2.h"
#include "Wm5IntrSegment3Box3.h"
#include "Wm5IntrSegment3Capsule3.h"
#include "Wm5IntrSegment3Cylinder3.h"
#include "Wm5IntrSegment3Ellipsoid3.h"
#include "Wm5IntrSegment3Lozenge3.h"
#include "Wm5IntrSegment3Plane3.h"
#include "Wm5IntrSegment3Sphere3.h"
#include "Wm5IntrSegment3Triangle3.h"
#include "Wm5IntrSphere3Cone3.h"
#include "Wm5IntrSphere3Frustum3.h"
#include "Wm5IntrSphere3Sphere3.h"
#include "Wm5IntrTetrahedron3Tetrahedron3.h"
#include "Wm5IntrTriangle2Triangle2.h"
#include "Wm5IntrTriangle3Box3.h"
#include "Wm5IntrTriangle3Cone3.h"
#include "Wm5IntrTriangle3Cylinder3.h"
#include "Wm5IntrTriangle3Sphere3.h"
#include "Wm5IntrTriangle3Triangle3.h"
#include "Wm5IntrUtility3.h"
//  LibMathematics/Meshes
#include "Wm5BasicMesh.h"
#include "Wm5ConformalMap.h"
#include "Wm5ETManifoldMesh.h"
#include "Wm5ETNonmanifoldMesh.h"
#include "Wm5EdgeKey.h"
#include "Wm5MeshCurvature.h"
#include "Wm5MeshSmoother.h"
#include "Wm5PlanarGraph.h"
#include "Wm5TriangleKey.h"
#include "Wm5UniqueVerticesTriangles.h"
#include "Wm5VEManifoldMesh.h"
//  LibMathematics/Miscellaneous
#include "Wm5GridGraph2.h"
#include "Wm5NormalCompression.h"
#include "Wm5PerspProjEllipsoid.h"
#include "Wm5QuadToQuadTransforms.h"
#include "Wm5RandomHypersphere.h"
#include "Wm5TangentsToCircles.h"
//  LibMathematics/NumericalAnalysis
#include "Wm5Bisect1.h"
#include "Wm5Bisect2.h"
#include "Wm5Bisect3.h"
#include "Wm5BrentsMethod.h"
#include "Wm5EigenDecomposition.h"
#include "Wm5Integrate1.h"
#include "Wm5LinearSystem.h"
#include "Wm5Minimize1.h"
#include "Wm5MinimizeN.h"
#include "Wm5NoniterativeEigen3x3.h"
#include "Wm5OdeEuler.h"
#include "Wm5OdeImplicitEuler.h"
#include "Wm5OdeMidpoint.h"
#include "Wm5OdeRungeKutta4.h"
#include "Wm5OdeSolver.h"
#include "Wm5PolynomialRoots.h"
#include "Wm5PolynomialRootsR.h"
#include "Wm5SingularValueDecomposition.h"
//  LibMathematics/Objects2D
#include "Wm5Arc2.h"
#include "Wm5AxisAlignedBox2.h"
#include "Wm5Box2.h"
#include "Wm5Circle2.h"
#include "Wm5ConvexPolygon2.h"
#include "Wm5Ellipse2.h"
#include "Wm5Line2.h"
#include "Wm5Polygon2.h"
#include "Wm5Ray2.h"
#include "Wm5Segment2.h"
#include "Wm5Triangle2.h"
//  LibMathematics/Objects3D
#include "Wm5AxisAlignedBox3.h"
#include "Wm5Box3.h"
#include "Wm5Capsule3.h"
#include "Wm5Circle3.h"
#include "Wm5Cone3.h"
#include "Wm5ConvexPolyhedron3.h"
#include "Wm5Cylinder3.h"
#include "Wm5Ellipse3.h"
#include "Wm5Ellipsoid3.h"
#include "Wm5Frustum3.h"
#include "Wm5Line3.h"
#include "Wm5Lozenge3.h"
#include "Wm5Plane3.h"
#include "Wm5Polyhedron3.h"
#include "Wm5Ray3.h"
#include "Wm5Rectangle3.h"
#include "Wm5Segment3.h"
#include "Wm5Sphere3.h"
#include "Wm5Tetrahedron3.h"
#include "Wm5Torus3.h"
#include "Wm5Triangle3.h"
//  LibMathematics/Query
#include "Wm5Query.h"
#include "Wm5Query2.h"
#include "Wm5Query2Filtered.h"
#include "Wm5Query2Int64.h"
#include "Wm5Query2Integer.h"
#include "Wm5Query2Rational.h"
#include "Wm5Query3.h"
#include "Wm5Query3Filtered.h"
#include "Wm5Query3Int64.h"
#include "Wm5Query3Integer.h"
#include "Wm5Query3Rational.h"
//  LibMathematics/Rational
#include "Wm5IVector.h"
#include "Wm5IVector2.h"
#include "Wm5IVector3.h"
#include "Wm5Integer.h"
#include "Wm5RVector.h"
#include "Wm5RVector2.h"
#include "Wm5RVector3.h"
#include "Wm5Rational.h"
//  LibMathematics/Distance
#include "Wm5Distance.h"
#include "Wm5DistCircle3Circle3.h"
#include "Wm5DistLine2Line2.h"
#include "Wm5DistLine2Ray2.h"
#include "Wm5DistLine2Segment2.h"
#include "Wm5DistLine3Box3.h"
#include "Wm5DistLine3Circle3.h"
#include "Wm5DistLine3Line3.h"
#include "Wm5DistLine3Ray3.h"
#include "Wm5DistLine3Rectangle3.h"
#include "Wm5DistLine3Segment3.h"
#include "Wm5DistLine3Triangle3.h"
#include "Wm5DistPoint2Box2.h"
#include "Wm5DistPoint2Ellipse2.h"
#include "Wm5DistPoint2Line2.h"
#include "Wm5DistPoint2Ray2.h"
#include "Wm5DistPoint2Segment2.h"
#include "Wm5DistPoint3Box3.h"
#include "Wm5DistPoint3Circle3.h"
#include "Wm5DistPoint3Ellipsoid3.h"
#include "Wm5DistPoint3Frustum3.h"
#include "Wm5DistPoint3Line3.h"
#include "Wm5DistPoint3Plane3.h"
#include "Wm5DistPoint3Ray3.h"
#include "Wm5DistPoint3Rectangle3.h"
#include "Wm5DistPoint3Segment3.h"
#include "Wm5DistPoint3Tetrahedron3.h"
#include "Wm5DistPoint3Triangle3.h"
#include "Wm5DistRay2Ray2.h"
#include "Wm5DistRay2Segment2.h"
#include "Wm5DistRay3Box3.h"
#include "Wm5DistRay3Ray3.h"
#include "Wm5DistRay3Rectangle3.h"
#include "Wm5DistRay3Segment3.h"
#include "Wm5DistRay3Triangle3.h"
#include "Wm5DistRectangle3Rectangle3.h"
#include "Wm5DistSegment2Segment2.h"
#include "Wm5DistSegment3Box3.h"
#include "Wm5DistSegment3Rectangle3.h"
#include "Wm5DistSegment3Segment3.h"
#include "Wm5DistSegment3Triangle3.h"
#include "Wm5DistTriangle3Rectangle3.h"
#include "Wm5DistTriangle3Triangle3.h"
//  LibImagics
#include "Wm5Imagics.h"
#include "Wm5ImagicsLIB.h"
#include "Wm5ImagicsPCH.h"
//  LibImagics/Extraction
#include "Wm5ExtractCurveSquares.h"
#include "Wm5ExtractCurveTris.h"
#include "Wm5ExtractSurfaceCubes.h"
#include "Wm5ExtractSurfaceTetra.h"
//  LibImagics/Filters
#include "Wm5CurvatureFlow2.h"
#include "Wm5CurvatureFlow3.h"
#include "Wm5FastBlur.h"
#include "Wm5GaussianBlur2.h"
#include "Wm5GaussianBlur3.h"
#include "Wm5GradientAnisotropic2.h"
#include "Wm5GradientAnisotropic3.h"
#include "Wm5PdeFilter.h"
#include "Wm5PdeFilter2.h"
#include "Wm5PdeFilter3.h"
//  LibImagics/Images
#include "Wm5Element.h"
#include "Wm5ImageConvert.h"
#include "Wm5Images.h"
#include "Wm5Lattice.h"
#include "Wm5TImage.h"
#include "Wm5TImage2D.h"
#include "Wm5TImage3D.h"
//  LibImagics/BinaryOperations
#include "Wm5Binary2D.h"
#include "Wm5Binary3D.h"
//  LibImagics/RasterDrawing
#include "Wm5RasterDrawing.h"
//  LibImagics/Segmenters
#include "Wm5FastMarch.h"
#include "Wm5FastMarch2.h"
#include "Wm5FastMarch3.h"
//  LibPhysics
#include "Wm5Physics.h"
#include "Wm5PhysicsLIB.h"
#include "Wm5PhysicsPCH.h"
//  LibPhysics/Fluid
#include "Wm5Fluid2Da.h"
#include "Wm5Fluid2Db.h"
#include "Wm5Fluid3Da.h"
#include "Wm5Fluid3Db.h"
//  LibPhysics/CollisionDetection
#include "Wm5BoundTree.h"
#include "Wm5CollisionGroup.h"
#include "Wm5CollisionRecord.h"
//  LibPhysics/Intersection
#include "Wm5BoxManager.h"
#include "Wm5ExtremalQuery3.h"
#include "Wm5ExtremalQuery3BSP.h"
#include "Wm5ExtremalQuery3PRJ.h"
#include "Wm5IntervalManager.h"
#include "Wm5RectangleManager.h"
//  LibPhysics/LCPSolver
#include "Wm5LCPPolyDist.h"
#include "Wm5LCPSolver.h"
//  LibPhysics/ParticleSystem
#include "Wm5MassSpringArbitrary.h"
#include "Wm5MassSpringCurve.h"
#include "Wm5MassSpringSurface.h"
#include "Wm5MassSpringVolume.h"
#include "Wm5ParticleSystem.h"
//  LibPhysics/RigidBody
#include "Wm5PolyhedralMassProperties.h"
#include "Wm5RigidBody.h"
//  LibGraphics
#include "Wm5Graphics.h"
#include "Wm5GraphicsLIB.h"
#include "Wm5GraphicsPCH.h"
//  LibGraphics/DataTypes
#include "Wm5Bound.h"
#include "Wm5Color.h"
#include "Wm5HalfFloat.h"
#include "Wm5SpecializedIO.h"
#include "Wm5Transform.h"
#include "Wm5Utility.h"
//  LibGraphics/Detail
//#include "Wm5BillboardNode.h"
//#include "Wm5ClodMesh.h"
#include "Wm5CollapseRecord.h"
#include "Wm5CollapseRecordArray.h"
//#include "Wm5CreateClodMesh.h"
#include "Wm5DlodNode.h"
#include "Wm5SwitchNode.h"
//  LibGraphics/GlobalEffects
//#include "Wm5GlobalEffect.h"
//#include "Wm5PlanarReflectionEffect.h"
//#include "Wm5PlanarShadowEffect.h"
//  LibGraphics/LocalEffects
//#include "Wm5DefaultEffect.h"
//#include "Wm5LightAmbEffect.h"
//#include "Wm5LightDirPerPixEffect.h"
//#include "Wm5LightDirPerVerEffect.h"
//#include "Wm5LightPntPerPixEffect.h"
//#include "Wm5LightPntPerVerEffect.h"
//#include "Wm5LightSptPerPixEffect.h"
//#include "Wm5LightSptPerVerEffect.h"
//#include "Wm5MaterialEffect.h"
//#include "Wm5MaterialTextureEffect.h"
//#include "Wm5Texture1DEffect.h"
//#include "Wm5Texture2AddEffect.h"
//#include "Wm5Texture2ColorBlendEffect.h"
//#include "Wm5Texture2DEffect.h"
//#include "Wm5Texture2MulEffect.h"
//#include "Wm5Texture3DEffect.h"
//#include "Wm5VertexColor3Effect.h"
//#include "Wm5VertexColor4Effect.h"
//#include "Wm5VertexColor4TextureEffect.h"
//  LibGraphics/Renderers
//#include "Wm5Renderer.h"
//#include "Wm5Renderers.h"
//  LibGraphics/Renderers/OpenGLRenderer
//#include "Wm5GlExtensions.h"
//#include "Wm5GlPlugin.h"
//#include "Wm5GlUtility.h"
//#include "Wm5OpenGLBitmapFont.h"
//#include "Wm5OpenGLIndexBuffer.h"
//#include "Wm5OpenGLMapping.h"
//#include "Wm5OpenGLPixelShader.h"
//#include "Wm5OpenGLRenderTarget.h"
//#include "Wm5OpenGLRendererData.h"
//#include "Wm5OpenGLRendererLIB.h"
//#include "Wm5OpenGLShader.h"
//#include "Wm5OpenGLTexture1D.h"
//#include "Wm5OpenGLTexture2D.h"
//#include "Wm5OpenGLTexture3D.h"
//#include "Wm5OpenGLTextureCube.h"
//#include "Wm5OpenGLVertexBuffer.h"
//#include "Wm5OpenGLVertexFormat.h"
//#include "Wm5OpenGLVertexShader.h"
//  LibGraphics/Resources
#include "Wm5Buffer.h"
#include "Wm5IndexBuffer.h"
#include "Wm5Texture.h"
#include "Wm5Texture1D.h"
#include "Wm5Texture2D.h"
#include "Wm5Texture3D.h"
#include "Wm5RenderTarget.h"
#include "Wm5TextureCube.h"
#include "Wm5VertexBuffer.h"
//#include "Wm5VertexBufferAccessor.h"
#include "Wm5VertexFormat.h"
//  LibGraphics/CurvesSurfaces
#include "Wm5BSplineSurfacePatch.h"
#include "Wm5BoxSurface.h"
#include "Wm5Float2Array.h"
#include "Wm5FloatArray.h"
#include "Wm5CurveSegment.h"
#include "Wm5CurveMesh.h"
#include "Wm5RectangleSurface.h"
#include "Wm5RevolutionSurface.h"
#include "Wm5SurfacePatch.h"
#include "Wm5SurfaceMesh.h"
#include "Wm5TubeSurface.h"
//  LibGraphics/SceneGraph
#include "Wm5Spatial.h"
#include "Wm5Node.h"
#include "Wm5Camera.h"
#include "Wm5CameraNode.h"
#include "Wm5VisibleSet.h"
#include "Wm5Culler.h"
#include "Wm5Light.h"
#include "Wm5LightNode.h"
#include "Wm5Material.h"
#include "Wm5Particles.h"
#include "Wm5PickRecord.h"
#include "Wm5Picker.h"
#include "Wm5Polypoint.h"
#include "Wm5Polysegment.h"
#include "Wm5Projector.h"
//#include "Wm5StandardMesh.h"
#include "Wm5TriFan.h"
#include "Wm5TriMesh.h"
#include "Wm5TriStrip.h"
#include "Wm5ScreenTarget.h"
//#include "Wm5Triangles.h"
//#include "Wm5Visual.h"
//  LibGraphics/ImageProcessing
//#include "Wm5ImageProcessing.h"
//#include "Wm5ImageProcessing2.h"
//#include "Wm5ImageProcessing3.h"
//  LibGraphics/Controllers
#include "Wm5Controller.h"
#include "Wm5ControlledObject.h"
#include "Wm5IKGoal.h"
#include "Wm5IKJoint.h"
#include "Wm5IKController.h"
#include "Wm5KeyframeController.h"
#include "Wm5MorphController.h"
#include "Wm5ParticleController.h"
#include "Wm5PointController.h"
#include "Wm5SkinController.h"
#include "Wm5TransformController.h"
#include "Wm5BlendTransformController.h"
//  LibGraphics/ShaderFloats
//#include "Wm5CameraModelDVectorConstant.h"
//#include "Wm5CameraModelPositionConstant.h"
//#include "Wm5CameraWorldDVectorConstant.h"
//#include "Wm5CameraWorldPositionConstant.h"
//#include "Wm5LightAmbientConstant.h"
//#include "Wm5LightAttenuationConstant.h"
//#include "Wm5LightDiffuseConstant.h"
//#include "Wm5LightModelDVectorConstant.h"
//#include "Wm5LightModelPositionConstant.h"
//#include "Wm5LightSpecularConstant.h"
//#include "Wm5LightSpotConstant.h"
//#include "Wm5LightWorldDVectorConstant.h"
//#include "Wm5LightWorldPositionConstant.h"
//#include "Wm5MaterialAmbientConstant.h"
//#include "Wm5MaterialDiffuseConstant.h"
//#include "Wm5MaterialEmissiveConstant.h"
//#include "Wm5MaterialSpecularConstant.h"
//#include "Wm5PMatrixConstant.h"
//#include "Wm5PVMatrixConstant.h"
//#include "Wm5PVWMatrixConstant.h"
//#include "Wm5ProjectorMatrixConstant.h"
//#include "Wm5ProjectorWorldPositionConstant.h"
//#include "Wm5ShaderFloat.h"
//#include "Wm5VMatrixConstant.h"
//#include "Wm5VWMatrixConstant.h"
//#include "Wm5WMatrixConstant.h"
//  LibGraphics/Shaders
#include "Wm5AlphaState.h"
#include "Wm5CullState.h"
#include "Wm5DepthState.h"
#include "Wm5OffsetState.h"
//#include "Wm5PixelShader.h"
//#include "Wm5Shader.h"
//#include "Wm5ShaderParameters.h"
#include "Wm5StencilState.h"
//#include "Wm5VertexShader.h"
//#include "Wm5VisualEffect.h"
//#include "Wm5VisualEffectInstance.h"
//#include "Wm5VisualPass.h"
//#include "Wm5VisualTechnique.h"
#include "Wm5WireState.h"
//  LibGraphics/Sorting
#include "Wm5BspNode.h"
#include "Wm5CRMCuller.h"
#include "Wm5ConvexRegion.h"
#include "Wm5ConvexRegionManager.h"
#include "Wm5Portal.h"
//  LibGraphics/Terrain
#include "Wm5TerrainPage.h"
#include "Wm5Terrain.h"

%}

//  LibCore
%include "Wm5Core.h"
%include "Wm5CoreLIB.h"
%include "Wm5CorePCH.h"
//  LibCore/Assert
%include "Wm5Assert.h"
//  LibCore/DataTypes
%include "Wm5MinHeap.h"
%include "Wm5Table.h"
%include "Wm5Tuple.h"
//  LibCore/InputOutput
%include "Wm5BufferIO.h"
%include "Wm5Endian.h"
//%include "Wm5Environment.h"
%include "Wm5FileIO.h"
//  LibCore/Memory
%include "Wm5Memory.h"
%include "Wm5SmartPointer.h"
//  LibCore/ObjectSystems
%include "Wm5Stream.h"
%include "Wm5InStream.h"
%include "Wm5InitTerm.h"
%include "Wm5Names.h"
%include "Wm5Rtti.h"
%include "Wm5OutStream.h"
%include "Wm5Object.h"
//  LibCore/Threading
%include "Wm5Mutex.h"
%include "Wm5MutexType.h"
%include "Wm5ScopedCS.h"
%include "Wm5Thread.h"
%include "Wm5ThreadType.h"
//  LibCore/Time
%include "Wm5Time.h"
//  LibMathematics
%include "Wm5Mathematics.h"
%include "Wm5MathematicsLIB.h"
%include "Wm5MathematicsPCH.h"
//  LibMathematics/Base
%include "Wm5BitHacks.h"
%include "Wm5Float1.h"
%include "Wm5Float2.h"
%include "Wm5Float3.h"
%include "Wm5Float4.h"
%include "Wm5Math.h"
//  LibMathematics/Algebra
%include "Wm5GVector.h"
%include "Wm5Vector2.h"
%include "Wm5Vector3.h"
%include "Wm5Vector4.h"
%include "Wm5BandedMatrix.h"
%include "Wm5GMatrix.h"
%include "Wm5HPoint.h"
%include "Wm5AVector.h"
%include "Wm5APoint.h"
%include "Wm5HPlane.h"
%include "Wm5Matrix2.h"
%include "Wm5Matrix3.h"
%include "Wm5Matrix4.h"
%include "Wm5HMatrix.h"
%include "Wm5HQuaternion.h"
%include "Wm5Polynomial1.h"
%include "Wm5Quaternion.h"
//  LibMathematics/Approximation
%include "Wm5ApprCircleFit2.h"
%include "Wm5ApprCylinderFit3.h"
%include "Wm5ApprEllipseByArcs2.h"
%include "Wm5ApprEllipseFit2.h"
%include "Wm5ApprEllipsoidFit3.h"
%include "Wm5ApprGaussPointsFit2.h"
%include "Wm5ApprGaussPointsFit3.h"
%include "Wm5ApprGreatCircleFit3.h"
%include "Wm5ApprLineFit2.h"
%include "Wm5ApprLineFit3.h"
%include "Wm5ApprParaboloidFit3.h"
%include "Wm5ApprPlaneFit3.h"
%include "Wm5ApprPolyFit2.h"
%include "Wm5ApprPolyFit3.h"
%include "Wm5ApprPolyFit4.h"
%include "Wm5ApprPolynomialFit2.h"
%include "Wm5ApprPolynomialFit3.h"
%include "Wm5ApprPolynomialFit4.h"
%include "Wm5ApprQuadraticFit2.h"
%include "Wm5ApprQuadraticFit3.h"
%include "Wm5ApprSphereFit3.h"
//  LibMathematics/ComputationalGeometry
%include "Wm5ConvexHull.h"
%include "Wm5ConvexHull1.h"
%include "Wm5ConvexHull2.h"
%include "Wm5ConvexHull3.h"
%include "Wm5Delaunay.h"
%include "Wm5Delaunay1.h"
%include "Wm5Delaunay2.h"
%include "Wm5Delaunay3.h"
%include "Wm5IncrementalDelaunay2.h"
%include "Wm5TriangulateEC.h"
//  LibMathematics/Containment
%include "Wm5ContBox2.h"
%include "Wm5ContBox3.h"
%include "Wm5ContCapsule3.h"
%include "Wm5ContCylinder3.h"
%include "Wm5ContEllipse2.h"
%include "Wm5ContEllipse2MinCR.h"
%include "Wm5ContEllipsoid3.h"
%include "Wm5ContEllipsoid3MinCR.h"
%include "Wm5ContLozenge3.h"
%include "Wm5ContMinBox2.h"
%include "Wm5ContMinBox3.h"
%include "Wm5ContMinCircle2.h"
%include "Wm5ContMinSphere3.h"
%include "Wm5ContPointInPolygon2.h"
%include "Wm5ContPointInPolyhedron3.h"
%include "Wm5ContScribeCircle2.h"
%include "Wm5ContScribeCircle3Sphere3.h"
%include "Wm5ContSeparatePoints2.h"
%include "Wm5ContSeparatePoints3.h"
%include "Wm5ContSphere3.h"
//  LibMathematics/CurvesSurfacesVolumes
%include "Wm5BSplineBasis.h"
%include "Wm5BSplineCurveFit.h"
%include "Wm5BSplineFitBasis.h"
%include "Wm5RiemannianGeodesic.h"
%include "Wm5ParametricSurface.h"
%include "Wm5BSplineGeodesic.h"
%include "Wm5BSplineRectangle.h"
%include "Wm5BSplineReduction.h"
%include "Wm5BSplineSurfaceFit.h"
%include "Wm5BSplineVolume.h"
%include "Wm5BezierCurve2.h"
%include "Wm5BezierCurve3.h"
%include "Wm5PolynomialCurve2.h"
%include "Wm5PolynomialCurve3.h"
%include "Wm5CubicPolynomialCurve2.h"
%include "Wm5CubicPolynomialCurve3.h"
%include "Wm5Curve2.h"
%include "Wm5Curve3.h"
%include "Wm5EllipsoidGeodesic.h"
%include "Wm5ImplicitSurface.h"
%include "Wm5MultipleCurve2.h"
%include "Wm5MultipleCurve3.h"
%include "Wm5NURBSCurve2.h"
%include "Wm5NURBSCurve3.h"
%include "Wm5NURBSRectangle.h"
%include "Wm5NaturalSpline1.h"
%include "Wm5NaturalSpline2.h"
%include "Wm5NaturalSpline3.h"
%include "Wm5QuadricSurface.h"
%include "Wm5SingleCurve2.h"
%include "Wm5SingleCurve3.h"
%include "Wm5BSplineCurve2.h"
%include "Wm5BSplineCurve3.h"
%include "Wm5Surface.h"
%include "Wm5TCBSpline2.h"
%include "Wm5TCBSpline3.h"
//  LibMathematics/Interpolation
%include "Wm5IntpAkima1.h"
%include "Wm5IntpAkimaNonuniform1.h"
%include "Wm5IntpAkimaUniform1.h"
%include "Wm5IntpAkimaUniform2.h"
%include "Wm5IntpAkimaUniform3.h"
%include "Wm5IntpBSplineUniform.h"
%include "Wm5IntpBSplineUniform1.h"
%include "Wm5IntpBSplineUniform2.h"
%include "Wm5IntpBSplineUniform3.h"
%include "Wm5IntpBSplineUniform4.h"
%include "Wm5IntpBSplineUniformN.h"
%include "Wm5IntpBicubic2.h"
%include "Wm5IntpBilinear2.h"
%include "Wm5IntpLinearNonuniform2.h"
%include "Wm5IntpLinearNonuniform3.h"
%include "Wm5IntpQdrNonuniform2.h"
%include "Wm5IntpSphere2.h"
%include "Wm5IntpThinPlateSpline2.h"
%include "Wm5IntpThinPlateSpline3.h"
%include "Wm5IntpTricubic3.h"
%include "Wm5IntpTrilinear3.h"
%include "Wm5IntpVectorField2.h"
//  LibMathematics/Intersection
%include "Wm5Intersector.h"
%include "Wm5Intersector1.h"
%include "Wm5IntrArc2Arc2.h"
%include "Wm5IntrArc2Circle2.h"
%include "Wm5IntrBox2Box2.h"
%include "Wm5IntrBox2Circle2.h"
%include "Wm5IntrBox3Box3.h"
%include "Wm5IntrBox3Frustum3.h"
%include "Wm5IntrBox3Sphere3.h"
%include "Wm5IntrCapsule3Capsule3.h"
%include "Wm5IntrCircle2Circle2.h"
%include "Wm5IntrCircle3Plane3.h"
%include "Wm5IntrEllipse2Ellipse2.h"
%include "Wm5IntrEllipsoid3Ellipsoid3.h"
%include "Wm5IntrHalfspace3Box3.h"
%include "Wm5IntrHalfspace3Segment3.h"
%include "Wm5IntrHalfspace3Sphere3.h"
%include "Wm5IntrHalfspace3Triangle3.h"
%include "Wm5IntrLine2Arc2.h"
%include "Wm5IntrLine2Box2.h"
%include "Wm5IntrLine2Circle2.h"
%include "Wm5IntrLine2Line2.h"
%include "Wm5IntrLine2Ray2.h"
%include "Wm5IntrLine2Segment2.h"
%include "Wm5IntrLine2Triangle2.h"
%include "Wm5IntrLine3Box3.h"
%include "Wm5IntrLine3Capsule3.h"
%include "Wm5IntrLine3Cone3.h"
%include "Wm5IntrLine3Cylinder3.h"
%include "Wm5IntrLine3Ellipsoid3.h"
%include "Wm5IntrLine3Lozenge3.h"
%include "Wm5IntrLine3Plane3.h"
%include "Wm5IntrLine3Sphere3.h"
%include "Wm5IntrLine3Torus3.h"
%include "Wm5IntrLine3Triangle3.h"
%include "Wm5IntrLozenge3Lozenge3.h"
%include "Wm5IntrPlane3Box3.h"
%include "Wm5IntrPlane3Capsule3.h"
%include "Wm5IntrPlane3Cylinder3.h"
%include "Wm5IntrPlane3Ellipsoid3.h"
%include "Wm5IntrPlane3Lozenge3.h"
%include "Wm5IntrPlane3Plane3.h"
%include "Wm5IntrPlane3Sphere3.h"
%include "Wm5IntrPlane3Triangle3.h"
%include "Wm5IntrRay2Arc2.h"
%include "Wm5IntrRay2Box2.h"
%include "Wm5IntrRay2Circle2.h"
%include "Wm5IntrRay2Ray2.h"
%include "Wm5IntrRay2Segment2.h"
%include "Wm5IntrRay2Triangle2.h"
%include "Wm5IntrRay3Box3.h"
%include "Wm5IntrRay3Capsule3.h"
%include "Wm5IntrRay3Cylinder3.h"
%include "Wm5IntrRay3Ellipsoid3.h"
%include "Wm5IntrRay3Lozenge3.h"
%include "Wm5IntrRay3Plane3.h"
%include "Wm5IntrRay3Sphere3.h"
%include "Wm5IntrRay3Triangle3.h"
%include "Wm5IntrSegment2Arc2.h"
%include "Wm5IntrSegment2Box2.h"
%include "Wm5IntrSegment2Circle2.h"
%include "Wm5IntrSegment2Segment2.h"
%include "Wm5IntrSegment2Triangle2.h"
%include "Wm5IntrSegment3Box3.h"
%include "Wm5IntrSegment3Capsule3.h"
%include "Wm5IntrSegment3Cylinder3.h"
%include "Wm5IntrSegment3Ellipsoid3.h"
%include "Wm5IntrSegment3Lozenge3.h"
%include "Wm5IntrSegment3Plane3.h"
%include "Wm5IntrSegment3Sphere3.h"
%include "Wm5IntrSegment3Triangle3.h"
%include "Wm5IntrSphere3Cone3.h"
%include "Wm5IntrSphere3Frustum3.h"
%include "Wm5IntrSphere3Sphere3.h"
%include "Wm5IntrTetrahedron3Tetrahedron3.h"
%include "Wm5IntrTriangle2Triangle2.h"
%include "Wm5IntrTriangle3Box3.h"
%include "Wm5IntrTriangle3Cone3.h"
%include "Wm5IntrTriangle3Cylinder3.h"
%include "Wm5IntrTriangle3Sphere3.h"
%include "Wm5IntrTriangle3Triangle3.h"
%include "Wm5IntrUtility3.h"
//  LibMathematics/Meshes
%include "Wm5BasicMesh.h"
%include "Wm5ConformalMap.h"
%include "Wm5ETManifoldMesh.h"
%include "Wm5ETNonmanifoldMesh.h"
%include "Wm5EdgeKey.h"
%include "Wm5MeshCurvature.h"
%include "Wm5MeshSmoother.h"
%include "Wm5PlanarGraph.h"
%include "Wm5TriangleKey.h"
%include "Wm5UniqueVerticesTriangles.h"
%include "Wm5VEManifoldMesh.h"
//  LibMathematics/Miscellaneous
%include "Wm5GridGraph2.h"
%include "Wm5NormalCompression.h"
%include "Wm5PerspProjEllipsoid.h"
%include "Wm5QuadToQuadTransforms.h"
%include "Wm5RandomHypersphere.h"
%include "Wm5TangentsToCircles.h"
//  LibMathematics/NumericalAnalysis
%include "Wm5Bisect1.h"
%include "Wm5Bisect2.h"
%include "Wm5Bisect3.h"
%include "Wm5BrentsMethod.h"
%include "Wm5EigenDecomposition.h"
%include "Wm5Integrate1.h"
%include "Wm5LinearSystem.h"
%include "Wm5Minimize1.h"
%include "Wm5MinimizeN.h"
%include "Wm5NoniterativeEigen3x3.h"
%include "Wm5OdeEuler.h"
%include "Wm5OdeImplicitEuler.h"
%include "Wm5OdeMidpoint.h"
%include "Wm5OdeRungeKutta4.h"
%include "Wm5OdeSolver.h"
%include "Wm5PolynomialRoots.h"
%include "Wm5PolynomialRootsR.h"
%include "Wm5SingularValueDecomposition.h"
//  LibMathematics/Objects2D
%include "Wm5Arc2.h"
%include "Wm5AxisAlignedBox2.h"
%include "Wm5Box2.h"
%include "Wm5Circle2.h"
%include "Wm5Ellipse2.h"
%include "Wm5Line2.h"
%include "Wm5Polygon2.h"
%include "Wm5ConvexPolygon2.h"
%include "Wm5Ray2.h"
%include "Wm5Segment2.h"
%include "Wm5Triangle2.h"
//  LibMathematics/Objects3D
%include "Wm5AxisAlignedBox3.h"
%include "Wm5Box3.h"
%include "Wm5Capsule3.h"
%include "Wm5Circle3.h"
%include "Wm5Cone3.h"
%include "Wm5Polyhedron3.h"
%include "Wm5ConvexPolyhedron3.h"
%include "Wm5Cylinder3.h"
%include "Wm5Ellipse3.h"
%include "Wm5Ellipsoid3.h"
%include "Wm5Frustum3.h"
%include "Wm5Line3.h"
%include "Wm5Lozenge3.h"
%include "Wm5Plane3.h"
%include "Wm5Ray3.h"
%include "Wm5Rectangle3.h"
%include "Wm5Segment3.h"
%include "Wm5Sphere3.h"
%include "Wm5Tetrahedron3.h"
%include "Wm5Torus3.h"
%include "Wm5Triangle3.h"
//  LibMathematics/Query
%include "Wm5Query.h"
%include "Wm5Query2.h"
%include "Wm5Query2Filtered.h"
%include "Wm5Query2Int64.h"
%include "Wm5Query2Integer.h"
%include "Wm5Query2Rational.h"
%include "Wm5Query3.h"
%include "Wm5Query3Filtered.h"
%include "Wm5Query3Int64.h"
%include "Wm5Query3Integer.h"
%include "Wm5Query3Rational.h"
//  LibMathematics/Rational
%include "Wm5IVector.h"
%include "Wm5IVector2.h"
%include "Wm5IVector3.h"
%include "Wm5Integer.h"
%include "Wm5RVector.h"
%include "Wm5RVector2.h"
%include "Wm5RVector3.h"
%include "Wm5Rational.h"
//  LibMathematics/Distance
%include "Wm5Distance.h"
%include "Wm5DistCircle3Circle3.h"
%include "Wm5DistLine2Line2.h"
%include "Wm5DistLine2Ray2.h"
%include "Wm5DistLine2Segment2.h"
%include "Wm5DistLine3Box3.h"
%include "Wm5DistLine3Circle3.h"
%include "Wm5DistLine3Line3.h"
%include "Wm5DistLine3Ray3.h"
%include "Wm5DistLine3Rectangle3.h"
%include "Wm5DistLine3Segment3.h"
%include "Wm5DistLine3Triangle3.h"
%include "Wm5DistPoint2Box2.h"
%include "Wm5DistPoint2Ellipse2.h"
%include "Wm5DistPoint2Line2.h"
%include "Wm5DistPoint2Ray2.h"
%include "Wm5DistPoint2Segment2.h"
%include "Wm5DistPoint3Box3.h"
%include "Wm5DistPoint3Circle3.h"
%include "Wm5DistPoint3Ellipsoid3.h"
%include "Wm5DistPoint3Frustum3.h"
%include "Wm5DistPoint3Line3.h"
%include "Wm5DistPoint3Plane3.h"
%include "Wm5DistPoint3Ray3.h"
%include "Wm5DistPoint3Rectangle3.h"
%include "Wm5DistPoint3Segment3.h"
%include "Wm5DistPoint3Tetrahedron3.h"
%include "Wm5DistPoint3Triangle3.h"
%include "Wm5DistRay2Ray2.h"
%include "Wm5DistRay2Segment2.h"
%include "Wm5DistRay3Box3.h"
%include "Wm5DistRay3Ray3.h"
%include "Wm5DistRay3Rectangle3.h"
%include "Wm5DistRay3Segment3.h"
%include "Wm5DistRay3Triangle3.h"
%include "Wm5DistRectangle3Rectangle3.h"
%include "Wm5DistSegment2Segment2.h"
%include "Wm5DistSegment3Box3.h"
%include "Wm5DistSegment3Rectangle3.h"
%include "Wm5DistSegment3Segment3.h"
%include "Wm5DistSegment3Triangle3.h"
%include "Wm5DistTriangle3Rectangle3.h"
%include "Wm5DistTriangle3Triangle3.h"
//  LibImagics
%include "Wm5Imagics.h"
%include "Wm5ImagicsLIB.h"
%include "Wm5ImagicsPCH.h"
//  LibImagics/Extraction
%include "Wm5ExtractCurveSquares.h"
%include "Wm5ExtractCurveTris.h"
%include "Wm5ExtractSurfaceCubes.h"
%include "Wm5ExtractSurfaceTetra.h"
//  LibImagics/Filters
%include "Wm5PdeFilter.h"
%include "Wm5PdeFilter2.h"
%include "Wm5PdeFilter3.h"
%include "Wm5CurvatureFlow2.h"
%include "Wm5CurvatureFlow3.h"
%include "Wm5FastBlur.h"
%include "Wm5GaussianBlur2.h"
%include "Wm5GaussianBlur3.h"
%include "Wm5GradientAnisotropic2.h"
%include "Wm5GradientAnisotropic3.h"
//  LibImagics/Images
%include "Wm5Element.h"
%include "Wm5ImageConvert.h"
%include "Wm5Images.h"
%include "Wm5Lattice.h"
%include "Wm5TImage.h"
%include "Wm5TImage2D.h"
%include "Wm5TImage3D.h"
//  LibImagics/BinaryOperations
//%include "Wm5Binary2D.h"
//%include "Wm5Binary3D.h"
//  LibImagics/RasterDrawing
%include "Wm5RasterDrawing.h"
//  LibImagics/Segmenters
%include "Wm5FastMarch.h"
%include "Wm5FastMarch2.h"
%include "Wm5FastMarch3.h"
//  LibPhysics
%include "Wm5Physics.h"
%include "Wm5PhysicsLIB.h"
%include "Wm5PhysicsPCH.h"
//  LibPhysics/Fluid
%include "Wm5Fluid2Da.h"
%include "Wm5Fluid2Db.h"
%include "Wm5Fluid3Da.h"
%include "Wm5Fluid3Db.h"
//  LibPhysics/CollisionDetection
%include "Wm5BoundTree.h"
%include "Wm5CollisionGroup.h"
%include "Wm5CollisionRecord.h"
//  LibPhysics/Intersection
%include "Wm5BoxManager.h"
%include "Wm5ExtremalQuery3.h"
%include "Wm5ExtremalQuery3BSP.h"
%include "Wm5ExtremalQuery3PRJ.h"
%include "Wm5IntervalManager.h"
%include "Wm5RectangleManager.h"
//  LibPhysics/LCPSolver
%include "Wm5LCPPolyDist.h"
%include "Wm5LCPSolver.h"
//  LibPhysics/ParticleSystem
%include "Wm5MassSpringArbitrary.h"
%include "Wm5MassSpringCurve.h"
%include "Wm5MassSpringSurface.h"
%include "Wm5MassSpringVolume.h"
%include "Wm5ParticleSystem.h"
//  LibPhysics/RigidBody
%include "Wm5PolyhedralMassProperties.h"
%include "Wm5RigidBody.h"
//  LibGraphics
%include "Wm5Graphics.h"
%include "Wm5GraphicsLIB.h"
%include "Wm5GraphicsPCH.h"
//  LibGraphics/DataTypes
%include "Wm5Transform.h"
%include "Wm5Bound.h"
%include "Wm5Color.h"
%include "Wm5HalfFloat.h"
%include "Wm5SpecializedIO.h"
%include "Wm5Utility.h"
//  LibGraphics/Detail
//%include "Wm5BillboardNode.h"
//%include "Wm5ClodMesh.h"
%include "Wm5CollapseRecord.h"
%include "Wm5CollapseRecordArray.h"
//%include "Wm5CreateClodMesh.h"
%include "Wm5DlodNode.h"
%include "Wm5SwitchNode.h"
//  LibGraphics/GlobalEffects
//%include "Wm5GlobalEffect.h"
//%include "Wm5PlanarReflectionEffect.h"
//%include "Wm5PlanarShadowEffect.h"
//  LibGraphics/LocalEffects
//%include "Wm5DefaultEffect.h"
//%include "Wm5LightAmbEffect.h"
//%include "Wm5LightDirPerPixEffect.h"
//%include "Wm5LightDirPerVerEffect.h"
//%include "Wm5LightPntPerPixEffect.h"
//%include "Wm5LightPntPerVerEffect.h"
//%include "Wm5LightSptPerPixEffect.h"
//%include "Wm5LightSptPerVerEffect.h"
//%include "Wm5MaterialEffect.h"
//%include "Wm5MaterialTextureEffect.h"
//%include "Wm5Texture1DEffect.h"
//%include "Wm5Texture2AddEffect.h"
//%include "Wm5Texture2ColorBlendEffect.h"
//%include "Wm5Texture2DEffect.h"
//%include "Wm5Texture2MulEffect.h"
//%include "Wm5Texture3DEffect.h"
//%include "Wm5VertexColor3Effect.h"
//%include "Wm5VertexColor4Effect.h"
//%include "Wm5VertexColor4TextureEffect.h"
//  LibGraphics/Renderers
//%include "Wm5Renderer.h"
//%include "Wm5Renderers.h"
//  LibGraphics/Renderers/OpenGLRenderer
//%include "Wm5GlExtensions.h"
//%include "Wm5GlPlugin.h"
//%include "Wm5GlUtility.h"
//%include "Wm5OpenGLBitmapFont.h"
//%include "Wm5OpenGLIndexBuffer.h"
//%include "Wm5OpenGLMapping.h"
//%include "Wm5OpenGLPixelShader.h"
//%include "Wm5OpenGLRenderTarget.h"
//%include "Wm5OpenGLRendererData.h"
//%include "Wm5OpenGLRendererLIB.h"
//%include "Wm5OpenGLShader.h"
//%include "Wm5OpenGLTexture1D.h"
//%include "Wm5OpenGLTexture2D.h"
//%include "Wm5OpenGLTexture3D.h"
//%include "Wm5OpenGLTextureCube.h"
//%include "Wm5OpenGLVertexBuffer.h"
//%include "Wm5OpenGLVertexFormat.h"
//%include "Wm5OpenGLVertexShader.h"
//  LibGraphics/Resources
%include "Wm5Buffer.h"
%include "Wm5IndexBuffer.h"
%include "Wm5Texture.h"
%include "Wm5Texture1D.h"
%include "Wm5Texture2D.h"
%include "Wm5Texture3D.h"
%include "Wm5TextureCube.h"
%include "Wm5RenderTarget.h"
%include "Wm5VertexBuffer.h"
//%include "Wm5VertexBufferAccessor.h"
%include "Wm5VertexFormat.h"
//  LibGraphics/CurvesSurfaces
%include "Wm5BSplineSurfacePatch.h"
%include "Wm5BoxSurface.h"
%include "Wm5Float2Array.h"
%include "Wm5FloatArray.h"
%include "Wm5CurveSegment.h"
%include "Wm5CurveMesh.h"
%include "Wm5RectangleSurface.h"
%include "Wm5RevolutionSurface.h"
%include "Wm5SurfacePatch.h"
%include "Wm5SurfaceMesh.h"
%include "Wm5TubeSurface.h"
//  LibGraphics/SceneGraph
%include "Wm5Spatial.h"
%include "Wm5Node.h"
%include "Wm5Camera.h"
%include "Wm5CameraNode.h"
%include "Wm5VisibleSet.h"
%include "Wm5Culler.h"
%include "Wm5Light.h"
%include "Wm5LightNode.h"
%include "Wm5Material.h"
%include "Wm5Particles.h"
%include "Wm5PickRecord.h"
%include "Wm5Picker.h"
%include "Wm5Polypoint.h"
%include "Wm5Polysegment.h"
%include "Wm5Projector.h"
//%include "Wm5StandardMesh.h"
%include "Wm5TriFan.h"
%include "Wm5TriMesh.h"
%include "Wm5TriStrip.h"
%include "Wm5ScreenTarget.h"
//%include "Wm5Triangles.h"
//%include "Wm5Visual.h"
//  LibGraphics/ImageProcessing
//%include "Wm5ImageProcessing.h"
//%include "Wm5ImageProcessing2.h"
//%include "Wm5ImageProcessing3.h"
//  LibGraphics/Controllers
%include "Wm5Controller.h"
%include "Wm5ControlledObject.h"
%include "Wm5IKGoal.h"
%include "Wm5IKJoint.h"
%include "Wm5IKController.h"
%include "Wm5KeyframeController.h"
%include "Wm5MorphController.h"
%include "Wm5ParticleController.h"
%include "Wm5PointController.h"
%include "Wm5SkinController.h"
%include "Wm5TransformController.h"
%include "Wm5BlendTransformController.h"
//  LibGraphics/ShaderFloats
//%include "Wm5CameraModelDVectorConstant.h"
//%include "Wm5CameraModelPositionConstant.h"
//%include "Wm5CameraWorldDVectorConstant.h"
//%include "Wm5CameraWorldPositionConstant.h"
//%include "Wm5LightAmbientConstant.h"
//%include "Wm5LightAttenuationConstant.h"
//%include "Wm5LightDiffuseConstant.h"
//%include "Wm5LightModelDVectorConstant.h"
//%include "Wm5LightModelPositionConstant.h"
//%include "Wm5LightSpecularConstant.h"
//%include "Wm5LightSpotConstant.h"
//%include "Wm5LightWorldDVectorConstant.h"
//%include "Wm5LightWorldPositionConstant.h"
//%include "Wm5MaterialAmbientConstant.h"
//%include "Wm5MaterialDiffuseConstant.h"
//%include "Wm5MaterialEmissiveConstant.h"
//%include "Wm5MaterialSpecularConstant.h"
//%include "Wm5PMatrixConstant.h"
//%include "Wm5PVMatrixConstant.h"
//%include "Wm5PVWMatrixConstant.h"
//%include "Wm5ProjectorMatrixConstant.h"
//%include "Wm5ProjectorWorldPositionConstant.h"
//%include "Wm5ShaderFloat.h"
//%include "Wm5VMatrixConstant.h"
//%include "Wm5VWMatrixConstant.h"
//%include "Wm5WMatrixConstant.h"
//  LibGraphics/Shaders
%include "Wm5AlphaState.h"
%include "Wm5CullState.h"
%include "Wm5DepthState.h"
%include "Wm5OffsetState.h"
//%include "Wm5PixelShader.h"
//%include "Wm5Shader.h"
//%include "Wm5ShaderParameters.h"
%include "Wm5StencilState.h"
//%include "Wm5VertexShader.h"
//%include "Wm5VisualEffect.h"
//%include "Wm5VisualEffectInstance.h"
//%include "Wm5VisualPass.h"
//%include "Wm5VisualTechnique.h"
%include "Wm5WireState.h"
//  LibGraphics/Sorting
%include "Wm5BspNode.h"
%include "Wm5CRMCuller.h"
%include "Wm5ConvexRegion.h"
%include "Wm5ConvexRegionManager.h"
%include "Wm5Portal.h"
//  LibGraphics/Terrain
%include "Wm5TerrainPage.h"
%include "Wm5Terrain.h"


%template (Tuple1i) Wm5::Tuple<1, int>;
%template (Tuple1f) Wm5::Tuple<1, float>;
%template (Tuple2i) Wm5::Tuple<2, int>;
%template (Tuple2f) Wm5::Tuple<2, float>;
%template (Tuple3i) Wm5::Tuple<3, int>;
%template (Tuple3f) Wm5::Tuple<3, float>;
%template (Tuple4i) Wm5::Tuple<4, int>;
%template (Tuple4f) Wm5::Tuple<4, float>;
%template (IVector2) Wm5::IVector<2>;
%template (IVector3) Wm5::IVector<3>;
%template (Arc2d) Wm5::Arc2<double>;
%template (Arc2f) Wm5::Arc2<float>;
%template (AxisAlignedBox2d) Wm5::AxisAlignedBox2<double>;
%template (AxisAlignedBox2f) Wm5::AxisAlignedBox2<float>;
%template (AxisAlignedBox3d) Wm5::AxisAlignedBox3<double>;
%template (AxisAlignedBox3f) Wm5::AxisAlignedBox3<float>;
%template (BSplineBasisd) Wm5::BSplineBasis<double>;
%template (BSplineBasisf) Wm5::BSplineBasis<float>;
%template (Curve2d) Wm5::Curve2<double>;
%template (Curve2f) Wm5::Curve2<float>;
%template (Curve3d) Wm5::Curve3<double>;
%template (Curve3f) Wm5::Curve3<float>;
%template (SingleCurve2d) Wm5::SingleCurve2<double>;
%template (SingleCurve2f) Wm5::SingleCurve2<float>;
%template (SingleCurve3d) Wm5::SingleCurve3<double>;
%template (SingleCurve3f) Wm5::SingleCurve3<float>;
%template (BSplineCurve2d) Wm5::BSplineCurve2<double>;
%template (BSplineCurve2f) Wm5::BSplineCurve2<float>;
%template (BSplineCurve3d) Wm5::BSplineCurve3<double>;
%template (BSplineCurve3f) Wm5::BSplineCurve3<float>;
%template (BSplineCurveFitd) Wm5::BSplineCurveFit<double>;
%template (BSplineCurveFitf) Wm5::BSplineCurveFit<float>;
%template (BSplineFitBasisd) Wm5::BSplineFitBasis<double>;
%template (BSplineFitBasisf) Wm5::BSplineFitBasis<float>;
%template (RiemannianGeodesicd) Wm5::RiemannianGeodesic<double>;
%template (RiemannianGeodesicf) Wm5::RiemannianGeodesic<float>;
%template (Surfaced) Wm5::Surface<double>;
%template (Surfacef) Wm5::Surface<float>;
%template (ParametricSurfaced) Wm5::ParametricSurface<double>;
%template (ParametricSurfacef) Wm5::ParametricSurface<float>;
%template (BSplineGeodesicd) Wm5::BSplineGeodesic<double>;
%template (BSplineGeodesicf) Wm5::BSplineGeodesic<float>;
%template (BSplineRectangled) Wm5::BSplineRectangle<double>;
%template (BSplineRectanglef) Wm5::BSplineRectangle<float>;
%template (BSplineReduction2d) Wm5::BSplineReduction< double, Wm5::Vector2< double> >;
%template (BSplineReduction2f) Wm5::BSplineReduction< float, Wm5::Vector2< float> >;
%template (BSplineReduction3d) Wm5::BSplineReduction< double, Wm5::Vector3< double> >;
%template (BSplineReduction3f) Wm5::BSplineReduction< float, Wm5::Vector3< float> >;
%template (BSplineSurfaceFitd) Wm5::BSplineSurfaceFit<double>;
%template (BSplineSurfaceFitf) Wm5::BSplineSurfaceFit<float>;
%template (BSplineVolumed) Wm5::BSplineVolume<double>;
%template (BSplineVolumef) Wm5::BSplineVolume<float>;
%template (BandedMatrixd) Wm5::BandedMatrix<double>;
%template (BandedMatrixf) Wm5::BandedMatrix<float>;
%template (BezierCurve2d) Wm5::BezierCurve2<double>;
%template (BezierCurve2f) Wm5::BezierCurve2<float>;
%template (BezierCurve3d) Wm5::BezierCurve3<double>;
%template (BezierCurve3f) Wm5::BezierCurve3<float>;
%template (BiQuadToSqrd) Wm5::BiQuadToSqr<double>;
%template (BiQuadToSqrf) Wm5::BiQuadToSqr<float>;
%template (BiSqrToQuadd) Wm5::BiSqrToQuad<double>;
%template (BiSqrToQuadf) Wm5::BiSqrToQuad<float>;
%template (Bisect1d) Wm5::Bisect1<double>;
%template (Bisect1f) Wm5::Bisect1<float>;
%template (Bisect2d) Wm5::Bisect2<double>;
%template (Bisect2f) Wm5::Bisect2<float>;
%template (Bisect3d) Wm5::Bisect3<double>;
%template (Bisect3f) Wm5::Bisect3<float>;
%template (Box2d) Wm5::Box2<double>;
%template (Box2f) Wm5::Box2<float>;
%template (Box3d) Wm5::Box3<double>;
%template (Box3f) Wm5::Box3<float>;
%template (BoxManagerd) Wm5::BoxManager<double>;
%template (BoxManagerf) Wm5::BoxManager<float>;
%template (BrentsMethodd) Wm5::BrentsMethod<double>;
%template (BrentsMethodf) Wm5::BrentsMethod<float>;
%template (Capsule3d) Wm5::Capsule3<double>;
%template (Capsule3f) Wm5::Capsule3<float>;
%template (Circle2d) Wm5::Circle2<double>;
%template (Circle2f) Wm5::Circle2<float>;
%template (Circle3d) Wm5::Circle3<double>;
%template (Circle3f) Wm5::Circle3<float>;
%template (Cone3d) Wm5::Cone3<double>;
%template (Cone3f) Wm5::Cone3<float>;
%template (ConformalMapd) Wm5::ConformalMap<double>;
%template (ConformalMapf) Wm5::ConformalMap<float>;
%template (ContEllipse2MinCRd) Wm5::ContEllipse2MinCR<double>;
%template (ContEllipse2MinCRf) Wm5::ContEllipse2MinCR<float>;
%template (ContEllipsoid3MinCRd) Wm5::ContEllipsoid3MinCR<double>;
%template (ContEllipsoid3MinCRf) Wm5::ContEllipsoid3MinCR<float>;
%template (ConvexHulld) Wm5::ConvexHull<double>;
%template (ConvexHullf) Wm5::ConvexHull<float>;
%template (ConvexHull1d) Wm5::ConvexHull1<double>;
%template (ConvexHull1f) Wm5::ConvexHull1<float>;
%template (ConvexHull2d) Wm5::ConvexHull2<double>;
%template (ConvexHull2f) Wm5::ConvexHull2<float>;
%template (ConvexHull3d) Wm5::ConvexHull3<double>;
%template (ConvexHull3f) Wm5::ConvexHull3<float>;
%template (Distance2d) Wm5::Distance< double, Wm5::Vector2< double> >;
%template (Distance2f) Wm5::Distance< float, Wm5::Vector2< float> >;
%template (Distance3d) Wm5::Distance< double, Wm5::Vector3< double> >;
%template (Distance3f) Wm5::Distance< float, Wm5::Vector3< float> >;
%template (DistCircle3Circle3d) Wm5::DistCircle3Circle3<double>;
%template (DistCircle3Circle3f) Wm5::DistCircle3Circle3<float>;
%template (DistLine2Line2d) Wm5::DistLine2Line2<double>;
%template (DistLine2Line2f) Wm5::DistLine2Line2<float>;
%template (DistLine2Ray2d) Wm5::DistLine2Ray2<double>;
%template (DistLine2Ray2f) Wm5::DistLine2Ray2<float>;
%template (DistLine2Segment2d) Wm5::DistLine2Segment2<double>;
%template (DistLine2Segment2f) Wm5::DistLine2Segment2<float>;
%template (DistLine3Box3d) Wm5::DistLine3Box3<double>;
%template (DistLine3Box3f) Wm5::DistLine3Box3<float>;
%template (DistLine3Circle3d) Wm5::DistLine3Circle3<double>;
%template (DistLine3Circle3f) Wm5::DistLine3Circle3<float>;
%template (DistLine3Line3d) Wm5::DistLine3Line3<double>;
%template (DistLine3Line3f) Wm5::DistLine3Line3<float>;
%template (DistLine3Ray3d) Wm5::DistLine3Ray3<double>;
%template (DistLine3Ray3f) Wm5::DistLine3Ray3<float>;
%template (DistLine3Rectangle3d) Wm5::DistLine3Rectangle3<double>;
%template (DistLine3Rectangle3f) Wm5::DistLine3Rectangle3<float>;
%template (DistLine3Segment3d) Wm5::DistLine3Segment3<double>;
%template (DistLine3Segment3f) Wm5::DistLine3Segment3<float>;
%template (DistLine3Triangle3d) Wm5::DistLine3Triangle3<double>;
%template (DistLine3Triangle3f) Wm5::DistLine3Triangle3<float>;
%template (DistPoint2Box2d) Wm5::DistPoint2Box2<double>;
%template (DistPoint2Box2f) Wm5::DistPoint2Box2<float>;
%template (DistPoint2Ellipse2d) Wm5::DistPoint2Ellipse2<double>;
%template (DistPoint2Ellipse2f) Wm5::DistPoint2Ellipse2<float>;
%template (DistPoint2Line2d) Wm5::DistPoint2Line2<double>;
%template (DistPoint2Line2f) Wm5::DistPoint2Line2<float>;
%template (DistPoint2Ray2d) Wm5::DistPoint2Ray2<double>;
%template (DistPoint2Ray2f) Wm5::DistPoint2Ray2<float>;
%template (DistPoint2Segment2d) Wm5::DistPoint2Segment2<double>;
%template (DistPoint2Segment2f) Wm5::DistPoint2Segment2<float>;
%template (DistPoint3Box3d) Wm5::DistPoint3Box3<double>;
%template (DistPoint3Box3f) Wm5::DistPoint3Box3<float>;
%template (DistPoint3Circle3d) Wm5::DistPoint3Circle3<double>;
%template (DistPoint3Circle3f) Wm5::DistPoint3Circle3<float>;
%template (DistPoint3Ellipsoid3d) Wm5::DistPoint3Ellipsoid3<double>;
%template (DistPoint3Ellipsoid3f) Wm5::DistPoint3Ellipsoid3<float>;
%template (DistPoint3Frustum3d) Wm5::DistPoint3Frustum3<double>;
%template (DistPoint3Frustum3f) Wm5::DistPoint3Frustum3<float>;
%template (DistPoint3Line3d) Wm5::DistPoint3Line3<double>;
%template (DistPoint3Line3f) Wm5::DistPoint3Line3<float>;
%template (DistPoint3Plane3d) Wm5::DistPoint3Plane3<double>;
%template (DistPoint3Plane3f) Wm5::DistPoint3Plane3<float>;
%template (DistPoint3Ray3d) Wm5::DistPoint3Ray3<double>;
%template (DistPoint3Ray3f) Wm5::DistPoint3Ray3<float>;
%template (DistPoint3Rectangle3d) Wm5::DistPoint3Rectangle3<double>;
%template (DistPoint3Rectangle3f) Wm5::DistPoint3Rectangle3<float>;
%template (DistPoint3Segment3d) Wm5::DistPoint3Segment3<double>;
%template (DistPoint3Segment3f) Wm5::DistPoint3Segment3<float>;
%template (DistPoint3Tetrahedron3d) Wm5::DistPoint3Tetrahedron3<double>;
%template (DistPoint3Tetrahedron3f) Wm5::DistPoint3Tetrahedron3<float>;
%template (DistPoint3Triangle3d) Wm5::DistPoint3Triangle3<double>;
%template (DistPoint3Triangle3f) Wm5::DistPoint3Triangle3<float>;
%template (DistRay2Ray2d) Wm5::DistRay2Ray2<double>;
%template (DistRay2Ray2f) Wm5::DistRay2Ray2<float>;
%template (DistRay2Segment2d) Wm5::DistRay2Segment2<double>;
%template (DistRay2Segment2f) Wm5::DistRay2Segment2<float>;
%template (DistRay3Box3d) Wm5::DistRay3Box3<double>;
%template (DistRay3Box3f) Wm5::DistRay3Box3<float>;
%template (DistRay3Ray3d) Wm5::DistRay3Ray3<double>;
%template (DistRay3Ray3f) Wm5::DistRay3Ray3<float>;
%template (DistRay3Rectangle3d) Wm5::DistRay3Rectangle3<double>;
%template (DistRay3Rectangle3f) Wm5::DistRay3Rectangle3<float>;
%template (DistRay3Segment3d) Wm5::DistRay3Segment3<double>;
%template (DistRay3Segment3f) Wm5::DistRay3Segment3<float>;
%template (DistRay3Triangle3d) Wm5::DistRay3Triangle3<double>;
%template (DistRay3Triangle3f) Wm5::DistRay3Triangle3<float>;
%template (DistRectangle3Rectangle3d) Wm5::DistRectangle3Rectangle3<double>;
%template (DistRectangle3Rectangle3f) Wm5::DistRectangle3Rectangle3<float>;
%template (DistSegment2Segment2d) Wm5::DistSegment2Segment2<double>;
%template (DistSegment2Segment2f) Wm5::DistSegment2Segment2<float>;
%template (DistSegment3Box3d) Wm5::DistSegment3Box3<double>;
%template (DistSegment3Box3f) Wm5::DistSegment3Box3<float>;
%template (DistSegment3Rectangle3d) Wm5::DistSegment3Rectangle3<double>;
%template (DistSegment3Rectangle3f) Wm5::DistSegment3Rectangle3<float>;
%template (DistSegment3Segment3d) Wm5::DistSegment3Segment3<double>;
%template (DistSegment3Segment3f) Wm5::DistSegment3Segment3<float>;
%template (DistSegment3Triangle3d) Wm5::DistSegment3Triangle3<double>;
%template (DistSegment3Triangle3f) Wm5::DistSegment3Triangle3<float>;
%template (DistTriangle3Rectangle3d) Wm5::DistTriangle3Rectangle3<double>;
%template (DistTriangle3Rectangle3f) Wm5::DistTriangle3Rectangle3<float>;
%template (DistTriangle3Triangle3d) Wm5::DistTriangle3Triangle3<double>;
%template (DistTriangle3Triangle3f) Wm5::DistTriangle3Triangle3<float>;
%template (Polygon2d) Wm5::Polygon2<double>;
%template (Polygon2f) Wm5::Polygon2<float>;
%template (ConvexPolygon2d) Wm5::ConvexPolygon2<double>;
%template (ConvexPolygon2f) Wm5::ConvexPolygon2<float>;
%template (Polyhedron3d) Wm5::Polyhedron3<double>;
%template (Polyhedron3f) Wm5::Polyhedron3<float>;
%template (ConvexPolyhedron3d) Wm5::ConvexPolyhedron3<double>;
%template (ConvexPolyhedron3f) Wm5::ConvexPolyhedron3<float>;
%template (PolynomialCurve2d) Wm5::PolynomialCurve2<double>;
%template (PolynomialCurve2f) Wm5::PolynomialCurve2<float>;
%template (PolynomialCurve3d) Wm5::PolynomialCurve3<double>;
%template (PolynomialCurve3f) Wm5::PolynomialCurve3<float>;
%template (CubicPolynomialCurve2d) Wm5::CubicPolynomialCurve2<double>;
%template (CubicPolynomialCurve2f) Wm5::CubicPolynomialCurve2<float>;
%template (CubicPolynomialCurve3d) Wm5::CubicPolynomialCurve3<double>;
%template (CubicPolynomialCurve3f) Wm5::CubicPolynomialCurve3<float>;
%template (Cylinder3d) Wm5::Cylinder3<double>;
%template (Cylinder3f) Wm5::Cylinder3<float>;
%template (CylinderFit3d) Wm5::CylinderFit3<double>;
%template (CylinderFit3f) Wm5::CylinderFit3<float>;
%template (Delaunayd) Wm5::Delaunay<double>;
%template (Delaunayf) Wm5::Delaunay<float>;
%template (Delaunay1d) Wm5::Delaunay1<double>;
%template (Delaunay1f) Wm5::Delaunay1<float>;
%template (Delaunay2d) Wm5::Delaunay2<double>;
%template (Delaunay2f) Wm5::Delaunay2<float>;
%template (Delaunay3d) Wm5::Delaunay3<double>;
%template (Delaunay3f) Wm5::Delaunay3<float>;
%template (EigenDecompositiond) Wm5::EigenDecomposition<double>;
%template (EigenDecompositionf) Wm5::EigenDecomposition<float>;
%template (Ellipse2d) Wm5::Ellipse2<double>;
%template (Ellipse2f) Wm5::Ellipse2<float>;
%template (Ellipse3d) Wm5::Ellipse3<double>;
%template (Ellipse3f) Wm5::Ellipse3<float>;
%template (EllipseFit2d) Wm5::EllipseFit2<double>;
%template (EllipseFit2f) Wm5::EllipseFit2<float>;
%template (Ellipsoid3d) Wm5::Ellipsoid3<double>;
%template (Ellipsoid3f) Wm5::Ellipsoid3<float>;
%template (EllipsoidFit3d) Wm5::EllipsoidFit3<double>;
%template (EllipsoidFit3f) Wm5::EllipsoidFit3<float>;
%template (EllipsoidGeodesicd) Wm5::EllipsoidGeodesic<double>;
%template (EllipsoidGeodesicf) Wm5::EllipsoidGeodesic<float>;
%template (ExtremalQuery3d) Wm5::ExtremalQuery3<double>;
%template (ExtremalQuery3f) Wm5::ExtremalQuery3<float>;
%template (ExtremalQuery3BSPd) Wm5::ExtremalQuery3BSP<double>;
%template (ExtremalQuery3BSPf) Wm5::ExtremalQuery3BSP<float>;
%template (ExtremalQuery3PRJd) Wm5::ExtremalQuery3PRJ<double>;
%template (ExtremalQuery3PRJf) Wm5::ExtremalQuery3PRJ<float>;
%template (Frustum3d) Wm5::Frustum3<double>;
%template (Frustum3f) Wm5::Frustum3<float>;
//%template (GMatrixd) Wm5::GMatrix<double>;
//%template (GMatrixf) Wm5::GMatrix<float>;
%template (GVectord) Wm5::GVector<double>;
%template (GVectorf) Wm5::GVector<float>;
%template (GridGraph2d) Wm5::GridGraph2<double>;
%template (GridGraph2f) Wm5::GridGraph2<float>;
%template (HmQuadToSqrd) Wm5::HmQuadToSqr<double>;
%template (HmQuadToSqrf) Wm5::HmQuadToSqr<float>;
%template (HmSqrToQuadd) Wm5::HmSqrToQuad<double>;
%template (HmSqrToQuadf) Wm5::HmSqrToQuad<float>;
%template (ImplicitSurfaced) Wm5::ImplicitSurface<double>;
%template (ImplicitSurfacef) Wm5::ImplicitSurface<float>;
%template (IncrementalDelaunay2d) Wm5::IncrementalDelaunay2<double>;
%template (IncrementalDelaunay2f) Wm5::IncrementalDelaunay2<float>;
%template (Integer2) Wm5::Integer<2>;
%template (Integer3) Wm5::Integer<3>;
%template (Integer4) Wm5::Integer<4>;
%template (Integer5) Wm5::Integer<5>;
%template (Integer6) Wm5::Integer<6>;
%template (Integrate1d) Wm5::Integrate1<double>;
%template (Integrate1f) Wm5::Integrate1<float>;
%template (Intersector1d) Wm5::Intersector1<double>;
%template (Intersector1f) Wm5::Intersector1<float>;
%template (IntervalManagerd) Wm5::IntervalManager<double>;
%template (IntervalManagerf) Wm5::IntervalManager<float>;
%template (IntpAkima1d) Wm5::IntpAkima1<double>;
%template (IntpAkima1f) Wm5::IntpAkima1<float>;
%template (IntpAkimaNonuniform1d) Wm5::IntpAkimaNonuniform1<double>;
%template (IntpAkimaNonuniform1f) Wm5::IntpAkimaNonuniform1<float>;
%template (IntpAkimaUniform1d) Wm5::IntpAkimaUniform1<double>;
%template (IntpAkimaUniform1f) Wm5::IntpAkimaUniform1<float>;
%template (IntpAkimaUniform2d) Wm5::IntpAkimaUniform2<double>;
%template (IntpAkimaUniform2f) Wm5::IntpAkimaUniform2<float>;
%template (IntpAkimaUniform3d) Wm5::IntpAkimaUniform3<double>;
%template (IntpAkimaUniform3f) Wm5::IntpAkimaUniform3<float>;
%template (IntpBSplineUniformd) Wm5::IntpBSplineUniform<double>;
%template (IntpBSplineUniformf) Wm5::IntpBSplineUniform<float>;
%template (IntpBSplineUniform1d) Wm5::IntpBSplineUniform1<double>;
%template (IntpBSplineUniform1f) Wm5::IntpBSplineUniform1<float>;
%template (IntpBSplineUniform2d) Wm5::IntpBSplineUniform2<double>;
%template (IntpBSplineUniform2f) Wm5::IntpBSplineUniform2<float>;
%template (IntpBSplineUniform3d) Wm5::IntpBSplineUniform3<double>;
%template (IntpBSplineUniform3f) Wm5::IntpBSplineUniform3<float>;
%template (IntpBSplineUniform4d) Wm5::IntpBSplineUniform4<double>;
%template (IntpBSplineUniform4f) Wm5::IntpBSplineUniform4<float>;
%template (IntpBSplineUniformNd) Wm5::IntpBSplineUniformN<double>;
%template (IntpBSplineUniformNf) Wm5::IntpBSplineUniformN<float>;
%template (IntpBicubic2d) Wm5::IntpBicubic2<double>;
%template (IntpBicubic2f) Wm5::IntpBicubic2<float>;
%template (IntpBilinear2d) Wm5::IntpBilinear2<double>;
%template (IntpBilinear2f) Wm5::IntpBilinear2<float>;
%template (IntpLinearNonuniform2d) Wm5::IntpLinearNonuniform2<double>;
%template (IntpLinearNonuniform2f) Wm5::IntpLinearNonuniform2<float>;
%template (IntpLinearNonuniform3d) Wm5::IntpLinearNonuniform3<double>;
%template (IntpLinearNonuniform3f) Wm5::IntpLinearNonuniform3<float>;
%template (IntpQdrNonuniform2d) Wm5::IntpQdrNonuniform2<double>;
%template (IntpQdrNonuniform2f) Wm5::IntpQdrNonuniform2<float>;
%template (IntpSphere2d) Wm5::IntpSphere2<double>;
%template (IntpSphere2f) Wm5::IntpSphere2<float>;
%template (IntpThinPlateSpline2d) Wm5::IntpThinPlateSpline2<double>;
%template (IntpThinPlateSpline2f) Wm5::IntpThinPlateSpline2<float>;
%template (IntpThinPlateSpline3d) Wm5::IntpThinPlateSpline3<double>;
%template (IntpThinPlateSpline3f) Wm5::IntpThinPlateSpline3<float>;
%template (IntpTricubic3d) Wm5::IntpTricubic3<double>;
%template (IntpTricubic3f) Wm5::IntpTricubic3<float>;
%template (IntpTrilinear3d) Wm5::IntpTrilinear3<double>;
%template (IntpTrilinear3f) Wm5::IntpTrilinear3<float>;
%template (IntpVectorField2d) Wm5::IntpVectorField2<double>;
%template (IntpVectorField2f) Wm5::IntpVectorField2<float>;
%template (Intersector2d) Wm5::Intersector< double, Wm5::Vector2< double> >;
%template (Intersector2f) Wm5::Intersector< float, Wm5::Vector2< float> >;
%template (Intersector3d) Wm5::Intersector< double, Wm5::Vector3< double> >;
%template (Intersector3f) Wm5::Intersector< float, Wm5::Vector3< float> >;
%template (IntrArc2Arc2d) Wm5::IntrArc2Arc2<double>;
%template (IntrArc2Arc2f) Wm5::IntrArc2Arc2<float>;
%template (IntrArc2Circle2d) Wm5::IntrArc2Circle2<double>;
%template (IntrArc2Circle2f) Wm5::IntrArc2Circle2<float>;
%template (IntrBox2Box2d) Wm5::IntrBox2Box2<double>;
%template (IntrBox2Box2f) Wm5::IntrBox2Box2<float>;
%template (IntrBox2Circle2d) Wm5::IntrBox2Circle2<double>;
%template (IntrBox2Circle2f) Wm5::IntrBox2Circle2<float>;
%template (IntrBox3Box3d) Wm5::IntrBox3Box3<double>;
%template (IntrBox3Box3f) Wm5::IntrBox3Box3<float>;
%template (IntrBox3Frustum3d) Wm5::IntrBox3Frustum3<double>;
%template (IntrBox3Frustum3f) Wm5::IntrBox3Frustum3<float>;
%template (IntrBox3Sphere3d) Wm5::IntrBox3Sphere3<double>;
%template (IntrBox3Sphere3f) Wm5::IntrBox3Sphere3<float>;
%template (IntrCapsule3Capsule3d) Wm5::IntrCapsule3Capsule3<double>;
%template (IntrCapsule3Capsule3f) Wm5::IntrCapsule3Capsule3<float>;
%template (IntrCircle2Circle2d) Wm5::IntrCircle2Circle2<double>;
%template (IntrCircle2Circle2f) Wm5::IntrCircle2Circle2<float>;
%template (IntrCircle3Plane3d) Wm5::IntrCircle3Plane3<double>;
%template (IntrCircle3Plane3f) Wm5::IntrCircle3Plane3<float>;
%template (IntrEllipse2Ellipse2d) Wm5::IntrEllipse2Ellipse2<double>;
%template (IntrEllipse2Ellipse2f) Wm5::IntrEllipse2Ellipse2<float>;
%template (IntrEllipsoid3Ellipsoid3d) Wm5::IntrEllipsoid3Ellipsoid3<double>;
%template (IntrEllipsoid3Ellipsoid3f) Wm5::IntrEllipsoid3Ellipsoid3<float>;
%template (IntrHalfspace3Box3d) Wm5::IntrHalfspace3Box3<double>;
%template (IntrHalfspace3Box3f) Wm5::IntrHalfspace3Box3<float>;
%template (IntrHalfspace3Segment3d) Wm5::IntrHalfspace3Segment3<double>;
%template (IntrHalfspace3Segment3f) Wm5::IntrHalfspace3Segment3<float>;
%template (IntrHalfspace3Sphere3d) Wm5::IntrHalfspace3Sphere3<double>;
%template (IntrHalfspace3Sphere3f) Wm5::IntrHalfspace3Sphere3<float>;
%template (IntrHalfspace3Triangle3d) Wm5::IntrHalfspace3Triangle3<double>;
%template (IntrHalfspace3Triangle3f) Wm5::IntrHalfspace3Triangle3<float>;
%template (IntrLine2Arc2d) Wm5::IntrLine2Arc2<double>;
%template (IntrLine2Arc2f) Wm5::IntrLine2Arc2<float>;
%template (IntrLine2Box2d) Wm5::IntrLine2Box2<double>;
%template (IntrLine2Box2f) Wm5::IntrLine2Box2<float>;
%template (IntrLine2Circle2d) Wm5::IntrLine2Circle2<double>;
%template (IntrLine2Circle2f) Wm5::IntrLine2Circle2<float>;
%template (IntrLine2Line2d) Wm5::IntrLine2Line2<double>;
%template (IntrLine2Line2f) Wm5::IntrLine2Line2<float>;
%template (IntrLine2Ray2d) Wm5::IntrLine2Ray2<double>;
%template (IntrLine2Ray2f) Wm5::IntrLine2Ray2<float>;
%template (IntrLine2Segment2d) Wm5::IntrLine2Segment2<double>;
%template (IntrLine2Segment2f) Wm5::IntrLine2Segment2<float>;
%template (IntrLine2Triangle2d) Wm5::IntrLine2Triangle2<double>;
%template (IntrLine2Triangle2f) Wm5::IntrLine2Triangle2<float>;
%template (IntrLine3Box3d) Wm5::IntrLine3Box3<double>;
%template (IntrLine3Box3f) Wm5::IntrLine3Box3<float>;
%template (IntrLine3Capsule3d) Wm5::IntrLine3Capsule3<double>;
%template (IntrLine3Capsule3f) Wm5::IntrLine3Capsule3<float>;
%template (IntrLine3Cone3d) Wm5::IntrLine3Cone3<double>;
%template (IntrLine3Cone3f) Wm5::IntrLine3Cone3<float>;
%template (IntrLine3Cylinder3d) Wm5::IntrLine3Cylinder3<double>;
%template (IntrLine3Cylinder3f) Wm5::IntrLine3Cylinder3<float>;
%template (IntrLine3Ellipsoid3d) Wm5::IntrLine3Ellipsoid3<double>;
%template (IntrLine3Ellipsoid3f) Wm5::IntrLine3Ellipsoid3<float>;
%template (IntrLine3Lozenge3d) Wm5::IntrLine3Lozenge3<double>;
%template (IntrLine3Lozenge3f) Wm5::IntrLine3Lozenge3<float>;
%template (IntrLine3Plane3d) Wm5::IntrLine3Plane3<double>;
%template (IntrLine3Plane3f) Wm5::IntrLine3Plane3<float>;
%template (IntrLine3Sphere3d) Wm5::IntrLine3Sphere3<double>;
%template (IntrLine3Sphere3f) Wm5::IntrLine3Sphere3<float>;
%template (IntrLine3Torus3d) Wm5::IntrLine3Torus3<double>;
%template (IntrLine3Torus3f) Wm5::IntrLine3Torus3<float>;
%template (IntrLine3Triangle3d) Wm5::IntrLine3Triangle3<double>;
%template (IntrLine3Triangle3f) Wm5::IntrLine3Triangle3<float>;
%template (IntrLozenge3Lozenge3d) Wm5::IntrLozenge3Lozenge3<double>;
%template (IntrLozenge3Lozenge3f) Wm5::IntrLozenge3Lozenge3<float>;
%template (IntrPlane3Box3d) Wm5::IntrPlane3Box3<double>;
%template (IntrPlane3Box3f) Wm5::IntrPlane3Box3<float>;
%template (IntrPlane3Capsule3d) Wm5::IntrPlane3Capsule3<double>;
%template (IntrPlane3Capsule3f) Wm5::IntrPlane3Capsule3<float>;
%template (IntrPlane3Cylinder3d) Wm5::IntrPlane3Cylinder3<double>;
%template (IntrPlane3Cylinder3f) Wm5::IntrPlane3Cylinder3<float>;
%template (IntrPlane3Ellipsoid3d) Wm5::IntrPlane3Ellipsoid3<double>;
%template (IntrPlane3Ellipsoid3f) Wm5::IntrPlane3Ellipsoid3<float>;
%template (IntrPlane3Lozenge3d) Wm5::IntrPlane3Lozenge3<double>;
%template (IntrPlane3Lozenge3f) Wm5::IntrPlane3Lozenge3<float>;
%template (IntrPlane3Plane3d) Wm5::IntrPlane3Plane3<double>;
%template (IntrPlane3Plane3f) Wm5::IntrPlane3Plane3<float>;
%template (IntrPlane3Sphere3d) Wm5::IntrPlane3Sphere3<double>;
%template (IntrPlane3Sphere3f) Wm5::IntrPlane3Sphere3<float>;
%template (IntrPlane3Triangle3d) Wm5::IntrPlane3Triangle3<double>;
%template (IntrPlane3Triangle3f) Wm5::IntrPlane3Triangle3<float>;
%template (IntrRay2Arc2d) Wm5::IntrRay2Arc2<double>;
%template (IntrRay2Arc2f) Wm5::IntrRay2Arc2<float>;
%template (IntrRay2Box2d) Wm5::IntrRay2Box2<double>;
%template (IntrRay2Box2f) Wm5::IntrRay2Box2<float>;
%template (IntrRay2Circle2d) Wm5::IntrRay2Circle2<double>;
%template (IntrRay2Circle2f) Wm5::IntrRay2Circle2<float>;
%template (IntrRay2Ray2d) Wm5::IntrRay2Ray2<double>;
%template (IntrRay2Ray2f) Wm5::IntrRay2Ray2<float>;
%template (IntrRay2Segment2d) Wm5::IntrRay2Segment2<double>;
%template (IntrRay2Segment2f) Wm5::IntrRay2Segment2<float>;
%template (IntrRay2Triangle2d) Wm5::IntrRay2Triangle2<double>;
%template (IntrRay2Triangle2f) Wm5::IntrRay2Triangle2<float>;
%template (IntrRay3Box3d) Wm5::IntrRay3Box3<double>;
%template (IntrRay3Box3f) Wm5::IntrRay3Box3<float>;
%template (IntrRay3Capsule3d) Wm5::IntrRay3Capsule3<double>;
%template (IntrRay3Capsule3f) Wm5::IntrRay3Capsule3<float>;
%template (IntrRay3Cylinder3d) Wm5::IntrRay3Cylinder3<double>;
%template (IntrRay3Cylinder3f) Wm5::IntrRay3Cylinder3<float>;
%template (IntrRay3Ellipsoid3d) Wm5::IntrRay3Ellipsoid3<double>;
%template (IntrRay3Ellipsoid3f) Wm5::IntrRay3Ellipsoid3<float>;
%template (IntrRay3Lozenge3d) Wm5::IntrRay3Lozenge3<double>;
%template (IntrRay3Lozenge3f) Wm5::IntrRay3Lozenge3<float>;
%template (IntrRay3Plane3d) Wm5::IntrRay3Plane3<double>;
%template (IntrRay3Plane3f) Wm5::IntrRay3Plane3<float>;
%template (IntrRay3Sphere3d) Wm5::IntrRay3Sphere3<double>;
%template (IntrRay3Sphere3f) Wm5::IntrRay3Sphere3<float>;
%template (IntrRay3Triangle3d) Wm5::IntrRay3Triangle3<double>;
%template (IntrRay3Triangle3f) Wm5::IntrRay3Triangle3<float>;
%template (IntrSegment2Arc2d) Wm5::IntrSegment2Arc2<double>;
%template (IntrSegment2Arc2f) Wm5::IntrSegment2Arc2<float>;
%template (IntrSegment2Box2d) Wm5::IntrSegment2Box2<double>;
%template (IntrSegment2Box2f) Wm5::IntrSegment2Box2<float>;
%template (IntrSegment2Circle2d) Wm5::IntrSegment2Circle2<double>;
%template (IntrSegment2Circle2f) Wm5::IntrSegment2Circle2<float>;
%template (IntrSegment2Segment2d) Wm5::IntrSegment2Segment2<double>;
%template (IntrSegment2Segment2f) Wm5::IntrSegment2Segment2<float>;
%template (IntrSegment2Triangle2d) Wm5::IntrSegment2Triangle2<double>;
%template (IntrSegment2Triangle2f) Wm5::IntrSegment2Triangle2<float>;
%template (IntrSegment3Box3d) Wm5::IntrSegment3Box3<double>;
%template (IntrSegment3Box3f) Wm5::IntrSegment3Box3<float>;
%template (IntrSegment3Capsule3d) Wm5::IntrSegment3Capsule3<double>;
%template (IntrSegment3Capsule3f) Wm5::IntrSegment3Capsule3<float>;
%template (IntrSegment3Cylinder3d) Wm5::IntrSegment3Cylinder3<double>;
%template (IntrSegment3Cylinder3f) Wm5::IntrSegment3Cylinder3<float>;
%template (IntrSegment3Ellipsoid3d) Wm5::IntrSegment3Ellipsoid3<double>;
%template (IntrSegment3Ellipsoid3f) Wm5::IntrSegment3Ellipsoid3<float>;
%template (IntrSegment3Lozenge3d) Wm5::IntrSegment3Lozenge3<double>;
%template (IntrSegment3Lozenge3f) Wm5::IntrSegment3Lozenge3<float>;
%template (IntrSegment3Plane3d) Wm5::IntrSegment3Plane3<double>;
%template (IntrSegment3Plane3f) Wm5::IntrSegment3Plane3<float>;
%template (IntrSegment3Sphere3d) Wm5::IntrSegment3Sphere3<double>;
%template (IntrSegment3Sphere3f) Wm5::IntrSegment3Sphere3<float>;
%template (IntrSegment3Triangle3d) Wm5::IntrSegment3Triangle3<double>;
%template (IntrSegment3Triangle3f) Wm5::IntrSegment3Triangle3<float>;
%template (IntrSphere3Cone3d) Wm5::IntrSphere3Cone3<double>;
%template (IntrSphere3Cone3f) Wm5::IntrSphere3Cone3<float>;
%template (IntrSphere3Frustum3d) Wm5::IntrSphere3Frustum3<double>;
%template (IntrSphere3Frustum3f) Wm5::IntrSphere3Frustum3<float>;
%template (IntrSphere3Sphere3d) Wm5::IntrSphere3Sphere3<double>;
%template (IntrSphere3Sphere3f) Wm5::IntrSphere3Sphere3<float>;
%template (IntrTetrahedron3Tetrahedron3d) Wm5::IntrTetrahedron3Tetrahedron3<double>;
%template (IntrTetrahedron3Tetrahedron3f) Wm5::IntrTetrahedron3Tetrahedron3<float>;
%template (IntrTriangle2Triangle2d) Wm5::IntrTriangle2Triangle2<double>;
%template (IntrTriangle2Triangle2f) Wm5::IntrTriangle2Triangle2<float>;
%template (IntrTriangle3Box3d) Wm5::IntrTriangle3Box3<double>;
%template (IntrTriangle3Box3f) Wm5::IntrTriangle3Box3<float>;
%template (IntrTriangle3Cone3d) Wm5::IntrTriangle3Cone3<double>;
%template (IntrTriangle3Cone3f) Wm5::IntrTriangle3Cone3<float>;
%template (IntrTriangle3Cylinder3d) Wm5::IntrTriangle3Cylinder3<double>;
%template (IntrTriangle3Cylinder3f) Wm5::IntrTriangle3Cylinder3<float>;
%template (IntrTriangle3Sphere3d) Wm5::IntrTriangle3Sphere3<double>;
%template (IntrTriangle3Sphere3f) Wm5::IntrTriangle3Sphere3<float>;
%template (IntrTriangle3Triangle3d) Wm5::IntrTriangle3Triangle3<double>;
%template (IntrTriangle3Triangle3f) Wm5::IntrTriangle3Triangle3<float>;
%template (LCPPolyDist2) Wm5::LCPPolyDist<2, Wm5::Vector2<float>, Wm5::Vector2<double> >;
%template (LCPPolyDist3) Wm5::LCPPolyDist<3, Wm5::Vector3<float>, Wm5::Vector3<double> >;
%template (Line2d) Wm5::Line2<double>;
%template (Line2f) Wm5::Line2<float>;
%template (Line3d) Wm5::Line3<double>;
%template (Line3f) Wm5::Line3<float>;
%template (LinearSystemd) Wm5::LinearSystem<double>;
%template (LinearSystemf) Wm5::LinearSystem<float>;
%template (Lozenge3d) Wm5::Lozenge3<double>;
%template (Lozenge3f) Wm5::Lozenge3<float>;
%template (Mathd) Wm5::Math<double>;
%template (Mathf) Wm5::Math<float>;
%template (Matrix2d) Wm5::Matrix2<double>;
%template (Matrix2f) Wm5::Matrix2<float>;
//%template (Matrix3d) Wm5::Matrix3<double>;
//%template (Matrix3f) Wm5::Matrix3<float>;
//%template (Matrix4d) Wm5::Matrix4<double>;
//%template (Matrix4f) Wm5::Matrix4<float>;
%template (MeshCurvatured) Wm5::MeshCurvature<double>;
%template (MeshCurvaturef) Wm5::MeshCurvature<float>;
%template (MeshSmootherd) Wm5::MeshSmoother<double>;
%template (MeshSmootherf) Wm5::MeshSmoother<float>;
%template (MinCircle2d) Wm5::MinCircle2<double>;
%template (MinCircle2f) Wm5::MinCircle2<float>;
%template (MinSphere3d) Wm5::MinSphere3<double>;
%template (MinSphere3f) Wm5::MinSphere3<float>;
%template (Minimize1d) Wm5::Minimize1<double>;
%template (Minimize1f) Wm5::Minimize1<float>;
%template (MinimizeNd) Wm5::MinimizeN<double>;
%template (MinimizeNf) Wm5::MinimizeN<float>;
%template (MultipleCurve2d) Wm5::MultipleCurve2<double>;
%template (MultipleCurve2f) Wm5::MultipleCurve2<float>;
%template (MultipleCurve3d) Wm5::MultipleCurve3<double>;
%template (MultipleCurve3f) Wm5::MultipleCurve3<float>;
%template (NURBSCurve2d) Wm5::NURBSCurve2<double>;
%template (NURBSCurve2f) Wm5::NURBSCurve2<float>;
%template (NURBSCurve3d) Wm5::NURBSCurve3<double>;
%template (NURBSCurve3f) Wm5::NURBSCurve3<float>;
%template (NURBSRectangled) Wm5::NURBSRectangle<double>;
%template (NURBSRectanglef) Wm5::NURBSRectangle<float>;
%template (NaturalSpline1d) Wm5::NaturalSpline1<double>;
%template (NaturalSpline1f) Wm5::NaturalSpline1<float>;
%template (NaturalSpline2d) Wm5::NaturalSpline2<double>;
%template (NaturalSpline2f) Wm5::NaturalSpline2<float>;
%template (NaturalSpline3d) Wm5::NaturalSpline3<double>;
%template (NaturalSpline3f) Wm5::NaturalSpline3<float>;
%template (NoniterativeEigen3x3d) Wm5::NoniterativeEigen3x3<double>;
%template (NoniterativeEigen3x3f) Wm5::NoniterativeEigen3x3<float>;
%template (OdeSolverd) Wm5::OdeSolver<double>;
%template (OdeSolverf) Wm5::OdeSolver<float>;
%template (OdeEulerd) Wm5::OdeEuler<double>;
%template (OdeEulerf) Wm5::OdeEuler<float>;
%template (OdeImplicitEulerd) Wm5::OdeImplicitEuler<double>;
%template (OdeImplicitEulerf) Wm5::OdeImplicitEuler<float>;
%template (OdeMidpointd) Wm5::OdeMidpoint<double>;
%template (OdeMidpointf) Wm5::OdeMidpoint<float>;
%template (OdeRungeKutta4d) Wm5::OdeRungeKutta4<double>;
%template (OdeRungeKutta4f) Wm5::OdeRungeKutta4<float>;
%template (Plane3d) Wm5::Plane3<double>;
%template (Plane3f) Wm5::Plane3<float>;
%template (PointInPolygon2d) Wm5::PointInPolygon2<double>;
%template (PointInPolygon2f) Wm5::PointInPolygon2<float>;
%template (PointInPolyhedron3d) Wm5::PointInPolyhedron3<double>;
%template (PointInPolyhedron3f) Wm5::PointInPolyhedron3<float>;
%template (Polynomial1d) Wm5::Polynomial1<double>;
%template (Polynomial1f) Wm5::Polynomial1<float>;
%template (PolynomialRootsd) Wm5::PolynomialRoots<double>;
%template (PolynomialRootsf) Wm5::PolynomialRoots<float>;
%template (PolynomialRootsRd) Wm5::PolynomialRootsR<double>;
%template (PolynomialRootsRf) Wm5::PolynomialRootsR<float>;
%template (QuadricSurfaced) Wm5::QuadricSurface<double>;
%template (QuadricSurfacef) Wm5::QuadricSurface<float>;
%template (Quaterniond) Wm5::Quaternion<double>;
%template (Quaternionf) Wm5::Quaternion<float>;
%template (Query2d) Wm5::Query2<double>;
%template (Query2f) Wm5::Query2<float>;
%template (Query2Filteredd) Wm5::Query2Filtered<double>;
%template (Query2Filteredf) Wm5::Query2Filtered<float>;
%template (Query2Int64d) Wm5::Query2Int64<double>;
%template (Query2Int64f) Wm5::Query2Int64<float>;
%template (Query2Integerd) Wm5::Query2Integer<double>;
%template (Query2Integerf) Wm5::Query2Integer<float>;
//%template (Query2Rationald) Wm5::Query2Rational<double>;
//%template (Query2Rationalf) Wm5::Query2Rational<float>;
%template (Query3d) Wm5::Query3<double>;
%template (Query3f) Wm5::Query3<float>;
%template (Query3Filteredd) Wm5::Query3Filtered<double>;
%template (Query3Filteredf) Wm5::Query3Filtered<float>;
%template (Query3Int64d) Wm5::Query3Int64<double>;
%template (Query3Int64f) Wm5::Query3Int64<float>;
%template (Query3Integerd) Wm5::Query3Integer<double>;
%template (Query3Integerf) Wm5::Query3Integer<float>;
//%template (Query3Rationald) Wm5::Query3Rational<double>;
//%template (Query3Rationalf) Wm5::Query3Rational<float>;
%template (Rational2) Wm5::Rational<2>;
%template (Rational3) Wm5::Rational<3>;
%template (Rational4) Wm5::Rational<4>;
%template (Rational5) Wm5::Rational<5>;
%template (Rational6) Wm5::Rational<6>;
%template (Ray2d) Wm5::Ray2<double>;
%template (Ray2f) Wm5::Ray2<float>;
%template (Ray3d) Wm5::Ray3<double>;
%template (Ray3f) Wm5::Ray3<float>;
%template (Rectangle3d) Wm5::Rectangle3<double>;
%template (Rectangle3f) Wm5::Rectangle3<float>;
%template (RectangleManagerd) Wm5::RectangleManager<double>;
%template (RectangleManagerf) Wm5::RectangleManager<float>;
%template (RigidBodyd) Wm5::RigidBody<double>;
%template (RigidBodyf) Wm5::RigidBody<float>;
%template (Segment2d) Wm5::Segment2<double>;
%template (Segment2f) Wm5::Segment2<float>;
%template (Segment3d) Wm5::Segment3<double>;
%template (Segment3f) Wm5::Segment3<float>;
%template (SeparatePoints2d) Wm5::SeparatePoints2<double>;
%template (SeparatePoints2f) Wm5::SeparatePoints2<float>;
%template (SeparatePoints3d) Wm5::SeparatePoints3<double>;
%template (SeparatePoints3f) Wm5::SeparatePoints3<float>;
%template (SingularValueDecompositiond) Wm5::SingularValueDecomposition<double>;
%template (SingularValueDecompositionf) Wm5::SingularValueDecomposition<float>;
%template (Sphere3d) Wm5::Sphere3<double>;
%template (Sphere3f) Wm5::Sphere3<float>;
%template (TCBSpline2d) Wm5::TCBSpline2<double>;
%template (TCBSpline2f) Wm5::TCBSpline2<float>;
%template (TCBSpline3d) Wm5::TCBSpline3<double>;
%template (TCBSpline3f) Wm5::TCBSpline3<float>;
%template (Tetrahedron3d) Wm5::Tetrahedron3<double>;
%template (Tetrahedron3f) Wm5::Tetrahedron3<float>;
%template (Torus3d) Wm5::Torus3<double>;
%template (Torus3f) Wm5::Torus3<float>;
%template (Triangle2d) Wm5::Triangle2<double>;
%template (Triangle2f) Wm5::Triangle2<float>;
%template (Triangle3d) Wm5::Triangle3<double>;
%template (Triangle3f) Wm5::Triangle3<float>;
%template (Vector2d) Wm5::Vector2<double>;
%template (Vector2f) Wm5::Vector2<float>;
%template (Vector3d) Wm5::Vector3<double>;
%template (Vector3f) Wm5::Vector3<float>;
%template (Vector4d) Wm5::Vector4<double>;
%template (Vector4f) Wm5::Vector4<float>;

//%rename (AlphaStatePtr) operator Wm5::AlphaState*;
//%rename (ObjectPtr) operator Wm5::Object*;
%template (Pointer0AlphaState) Wm5::Pointer0<Wm5::AlphaState>;
%template (Pointer0BillboardNode) Wm5::Pointer0<Wm5::BillboardNode>;	
%template (Pointer0BlendTransformController) Wm5::Pointer0<Wm5::BlendTransformController>;	
%template (Pointer0BoxSurface) Wm5::Pointer0<Wm5::BoxSurface>;	
%template (Pointer0BspNode) Wm5::Pointer0<Wm5::BspNode>;	
%template (Pointer0Buffer) Wm5::Pointer0<Wm5::Buffer>;	
%template (Pointer0Camera) Wm5::Pointer0<Wm5::Camera>;	
%template (Pointer0CameraModelDVectorConstant) Wm5::Pointer0<Wm5::CameraModelDVectorConstant>;	
%template (Pointer0CameraModelPositionConstant) Wm5::Pointer0<Wm5::CameraModelPositionConstant>;	
%template (Pointer0CameraNode) Wm5::Pointer0<Wm5::CameraNode>;	
%template (Pointer0CameraWorldDVectorConstant) Wm5::Pointer0<Wm5::CameraWorldDVectorConstant>;	
%template (Pointer0CameraWorldPositionConstant) Wm5::Pointer0<Wm5::CameraWorldPositionConstant>;	
%template (Pointer0ClodMesh) Wm5::Pointer0<Wm5::ClodMesh>;	
%template (Pointer0CollapseRecordArray) Wm5::Pointer0<Wm5::CollapseRecordArray>;	
%template (Pointer0ControlledObject) Wm5::Pointer0<Wm5::ControlledObject>;	
%template (Pointer0Controller) Wm5::Pointer0<Wm5::Controller>;	
%template (Pointer0ConvexRegion) Wm5::Pointer0<Wm5::ConvexRegion>;	
%template (Pointer0ConvexRegionManager) Wm5::Pointer0<Wm5::ConvexRegionManager>;	
%template (Pointer0CullState) Wm5::Pointer0<Wm5::CullState>;	
%template (Pointer0CurveMesh) Wm5::Pointer0<Wm5::CurveMesh>;	
%template (Pointer0CurveSegment) Wm5::Pointer0<Wm5::CurveSegment>;	
%template (Pointer0DefaultEffect) Wm5::Pointer0<Wm5::DefaultEffect>;	
%template (Pointer0DepthState) Wm5::Pointer0<Wm5::DepthState>;	
%template (Pointer0DlodNode) Wm5::Pointer0<Wm5::DlodNode>;	
%template (Pointer0Float2Array) Wm5::Pointer0<Wm5::Float2Array>;	
%template (Pointer0FloatArray) Wm5::Pointer0<Wm5::FloatArray>;	
%template (Pointer0GlobalEffect) Wm5::Pointer0<Wm5::GlobalEffect>;	
%template (Pointer0IKController) Wm5::Pointer0<Wm5::IKController>;	
%template (Pointer0IKGoal) Wm5::Pointer0<Wm5::IKGoal>;	
%template (Pointer0IKJoint) Wm5::Pointer0<Wm5::IKJoint>;	
%template (Pointer0IndexBuffer) Wm5::Pointer0<Wm5::IndexBuffer>;	
%template (Pointer0KeyframeController) Wm5::Pointer0<Wm5::KeyframeController>;	
%template (Pointer0Light) Wm5::Pointer0<Wm5::Light>;	
%template (Pointer0LightAmbEffect) Wm5::Pointer0<Wm5::LightAmbEffect>;	
%template (Pointer0LightAmbientConstant) Wm5::Pointer0<Wm5::LightAmbientConstant>;	
%template (Pointer0LightAttenuationConstant) Wm5::Pointer0<Wm5::LightAttenuationConstant>;	
%template (Pointer0LightDiffuseConstant) Wm5::Pointer0<Wm5::LightDiffuseConstant>;	
%template (Pointer0LightDirPerPixEffect) Wm5::Pointer0<Wm5::LightDirPerPixEffect>;	
%template (Pointer0LightDirPerVerEffect) Wm5::Pointer0<Wm5::LightDirPerVerEffect>;	
%template (Pointer0LightModelDVectorConstant) Wm5::Pointer0<Wm5::LightModelDVectorConstant>;	
%template (Pointer0LightModelPositionConstant) Wm5::Pointer0<Wm5::LightModelPositionConstant>;	
%template (Pointer0LightNode) Wm5::Pointer0<Wm5::LightNode>;	
%template (Pointer0LightPntPerPixEffect) Wm5::Pointer0<Wm5::LightPntPerPixEffect>;	
%template (Pointer0LightPntPerVerEffect) Wm5::Pointer0<Wm5::LightPntPerVerEffect>;	
%template (Pointer0LightSpecularConstant) Wm5::Pointer0<Wm5::LightSpecularConstant>;	
%template (Pointer0LightSpotConstant) Wm5::Pointer0<Wm5::LightSpotConstant>;	
%template (Pointer0LightSptPerPixEffect) Wm5::Pointer0<Wm5::LightSptPerPixEffect>;	
%template (Pointer0LightSptPerVerEffect) Wm5::Pointer0<Wm5::LightSptPerVerEffect>;	
%template (Pointer0LightWorldDVectorConstant) Wm5::Pointer0<Wm5::LightWorldDVectorConstant>;	
%template (Pointer0LightWorldPositionConstant) Wm5::Pointer0<Wm5::LightWorldPositionConstant>;	
%template (Pointer0Material) Wm5::Pointer0<Wm5::Material>;	
%template (Pointer0MaterialAmbientConstant) Wm5::Pointer0<Wm5::MaterialAmbientConstant>;	
%template (Pointer0MaterialDiffuseConstant) Wm5::Pointer0<Wm5::MaterialDiffuseConstant>;	
%template (Pointer0MaterialEffect) Wm5::Pointer0<Wm5::MaterialEffect>;	
%template (Pointer0MaterialEmissiveConstant) Wm5::Pointer0<Wm5::MaterialEmissiveConstant>;	
%template (Pointer0MaterialSpecularConstant) Wm5::Pointer0<Wm5::MaterialSpecularConstant>;	
%template (Pointer0MaterialTextureEffect) Wm5::Pointer0<Wm5::MaterialTextureEffect>;	
%template (Pointer0MorphController) Wm5::Pointer0<Wm5::MorphController>;	
%template (Pointer0Node) Wm5::Pointer0<Wm5::Node>;	
%template (Pointer0Object) Wm5::Pointer0<Wm5::Object>;;
%template (Pointer0OffsetState) Wm5::Pointer0<Wm5::OffsetState>;	
%template (Pointer0PMatrixConstant) Wm5::Pointer0<Wm5::PMatrixConstant>;	
%template (Pointer0PVMatrixConstant) Wm5::Pointer0<Wm5::PVMatrixConstant>;	
%template (Pointer0PVWMatrixConstant) Wm5::Pointer0<Wm5::PVWMatrixConstant>;	
%template (Pointer0ParticleController) Wm5::Pointer0<Wm5::ParticleController>;	
%template (Pointer0Particles) Wm5::Pointer0<Wm5::Particles>;	
%template (Pointer0PixelShader) Wm5::Pointer0<Wm5::PixelShader>;	
%template (Pointer0PlanarReflectionEffect) Wm5::Pointer0<Wm5::PlanarReflectionEffect>;	
%template (Pointer0PlanarShadowEffect) Wm5::Pointer0<Wm5::PlanarShadowEffect>;	
%template (Pointer0PointController) Wm5::Pointer0<Wm5::PointController>;	
%template (Pointer0Polypoint) Wm5::Pointer0<Wm5::Polypoint>;	
%template (Pointer0Polysegment) Wm5::Pointer0<Wm5::Polysegment>;	
%template (Pointer0Portal) Wm5::Pointer0<Wm5::Portal>;	
%template (Pointer0Projector) Wm5::Pointer0<Wm5::Projector>;	
%template (Pointer0ProjectorMatrixConstant) Wm5::Pointer0<Wm5::ProjectorMatrixConstant>;	
%template (Pointer0ProjectorWorldPositionConstant) Wm5::Pointer0<Wm5::ProjectorWorldPositionConstant>;	
%template (Pointer0RectangleSurface) Wm5::Pointer0<Wm5::RectangleSurface>;	
%template (Pointer0RenderTarget) Wm5::Pointer0<Wm5::RenderTarget>;	
%template (Pointer0RevolutionSurface) Wm5::Pointer0<Wm5::RevolutionSurface>;	
%template (Pointer0Shader) Wm5::Pointer0<Wm5::Shader>;	
%template (Pointer0ShaderFloat) Wm5::Pointer0<Wm5::ShaderFloat>;	
%template (Pointer0ShaderParameters) Wm5::Pointer0<Wm5::ShaderParameters>;	
%template (Pointer0SkinController) Wm5::Pointer0<Wm5::SkinController>;	
%template (Pointer0Spatial) Wm5::Pointer0<Wm5::Spatial>;	
%template (Pointer0StencilState) Wm5::Pointer0<Wm5::StencilState>;	
%template (Pointer0SurfaceMesh) Wm5::Pointer0<Wm5::SurfaceMesh>;	
%template (Pointer0SurfacePatch) Wm5::Pointer0<Wm5::SurfacePatch>;	
%template (Pointer0SwitchNode) Wm5::Pointer0<Wm5::SwitchNode>;	
%template (Pointer0Terrain) Wm5::Pointer0<Wm5::Terrain>;	
%template (Pointer0TerrainPage) Wm5::Pointer0<Wm5::TerrainPage>;
%template (Pointer0Texture1D) Wm5::Pointer0<Wm5::Texture1D>;	
%template (Pointer0Texture1DEffect) Wm5::Pointer0<Wm5::Texture1DEffect>;	
%template (Pointer0Texture2AddEffect) Wm5::Pointer0<Wm5::Texture2AddEffect>;	
%template (Pointer0Texture2ColorBlendEffect) Wm5::Pointer0<Wm5::Texture2ColorBlendEffect>;	
%template (Pointer0Texture2D) Wm5::Pointer0<Wm5::Texture2D>;	
%template (Pointer0Texture2DEffect) Wm5::Pointer0<Wm5::Texture2DEffect>;	
%template (Pointer0Texture2MulEffect) Wm5::Pointer0<Wm5::Texture2MulEffect>;	
%template (Pointer0Texture3D) Wm5::Pointer0<Wm5::Texture3D>;	
%template (Pointer0Texture3DEffect) Wm5::Pointer0<Wm5::Texture3DEffect>;	
%template (Pointer0Texture) Wm5::Pointer0<Wm5::Texture>;	
%template (Pointer0TextureCube) Wm5::Pointer0<Wm5::TextureCube>;	
%template (Pointer0TransformController) Wm5::Pointer0<Wm5::TransformController>;	
%template (Pointer0TriFan) Wm5::Pointer0<Wm5::TriFan>;	
%template (Pointer0TriMesh) Wm5::Pointer0<Wm5::TriMesh>;	
%template (Pointer0TriStrip) Wm5::Pointer0<Wm5::TriStrip>;	
%template (Pointer0Triangles) Wm5::Pointer0<Wm5::Triangles>;	
%template (Pointer0TubeSurface) Wm5::Pointer0<Wm5::TubeSurface>;	
%template (Pointer0VMatrixConstant) Wm5::Pointer0<Wm5::VMatrixConstant>;	
%template (Pointer0VWMatrixConstant) Wm5::Pointer0<Wm5::VWMatrixConstant>;	
%template (Pointer0VertexBuffer) Wm5::Pointer0<Wm5::VertexBuffer>;	
%template (Pointer0VertexColor3Effect) Wm5::Pointer0<Wm5::VertexColor3Effect>;	
%template (Pointer0VertexColor4Effect) Wm5::Pointer0<Wm5::VertexColor4Effect>;	
%template (Pointer0VertexColor4TextureEffect) Wm5::Pointer0<Wm5::VertexColor4TextureEffect>;	
%template (Pointer0VertexFormat) Wm5::Pointer0<Wm5::VertexFormat>;	
%template (Pointer0VertexShader) Wm5::Pointer0<Wm5::VertexShader>;	
%template (Pointer0Visual) Wm5::Pointer0<Wm5::Visual>;	
%template (Pointer0VisualEffect) Wm5::Pointer0<Wm5::VisualEffect>;	
%template (Pointer0VisualEffectInstance) Wm5::Pointer0<Wm5::VisualEffectInstance>;	
%template (Pointer0VisualPass) Wm5::Pointer0<Wm5::VisualPass>;	
%template (Pointer0VisualTechnique) Wm5::Pointer0<Wm5::VisualTechnique>;	
%template (Pointer0WMatrixConstant) Wm5::Pointer0<Wm5::WMatrixConstant>;	
%template (Pointer0WireState) Wm5::Pointer0<Wm5::WireState>;

// Ignore the nested struct ::Information. Both Vector2 and Vector3
// have it, but since SWIG redefines nested structs as global, 
// we get a name clash. Not wanting to modify the original
// source, let's instead safely ignore ::Information data memeber
// and the methods that use it.
%ignore Wm5::Vector2<double>::Information;
%ignore Wm5::Vector2<double>::GetInformation;
%ignore Wm5::Vector2<float>::Information;
%ignore Wm5::Vector2<float>::GetInformation;
%ignore Wm5::Vector3<double>::Information;
%ignore Wm5::Vector3<double>::GetInformation;
%ignore Wm5::Vector3<float>::Information;
%ignore Wm5::Vector3<float>::GetInformation;
%ignore Wm5::Vector4<double>::Information;
%ignore Wm5::Vector4<double>::GetInformation;
%ignore Wm5::Vector4<float>::Information;
%ignore Wm5::Vector4<float>::GetInformation;

// The end.
