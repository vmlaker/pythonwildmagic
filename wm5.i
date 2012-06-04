//////////////////////////////////////////////////
//
//  SWIG Library File for building Python wrappers
//  of Geometric Tools' Wild Magic Libraries.
//
//////////////////////////////////////////////////

%module wm5

%{
#include "Wm5MathematicsLIB.h"
#include "Wm5Tuple.h"
#include "Wm5Vector2.h"
#include "Wm5Vector3.h"
#include "Wm5Segment2.h"
#include "Wm5Segment3.h"

#include "Wm5Intersector.h"
#include "Wm5IntrSegment2Segment2.h"
#include "Wm5Distance.h"
#include "Wm5DistSegment2Segment2.h"
#include "Wm5DistSegment3Segment3.h"
#include "Wm5DistPoint3Segment3.h"

#include "Wm5Float3.h"
#include "Wm5HPoint.h"
#include "Wm5AVector.h"
#include "Wm5APoint.h"
#include "Wm5HPlane.h"
#include "Wm5Matrix3.h"
#include "Wm5HMatrix.h"

#include "Wm5GraphicsLIB.h"
#include "Wm5Math.h"
#include "Wm5Transform.h"
%}

// Rename the conversion operators. Note the missing namespace qualifiers
// before the method names, like here   -----+
//                                           |
//                                           v
//    %rename (Float3) Wm5::APoint::operator  Float3&();
//
// Adding the qualifier breaks SWIG with errors, but leaving it out generates 
// invalid wrapper code. That's why we patch the generated code by adding 
// the namespaces qualifiers (see the Makefile.)
//%rename (Float3)        Wm5::APoint::operator Float3&();
//%rename (Float3const)   Wm5::APoint::operator const Float3&() const;
//%rename (Vector3f)      Wm5::APoint::operator Vector3f&();
//%rename (Vector3fconst) Wm5::APoint::operator const Vector3f&() const;


%include "Wm5MathematicsLIB.h"
%include "Wm5Tuple.h"
%include "Wm5Vector2.h"
%include "Wm5Vector3.h"
%include "Wm5Segment2.h"
%include "Wm5Segment3.h"

%include "Wm5Intersector.h"
%include "Wm5IntrSegment2Segment2.h"
%include "Wm5Distance.h"
%include "Wm5DistSegment2Segment2.h"
%include "Wm5DistSegment3Segment3.h"
%include "Wm5DistPoint3Segment3.h"

%include "Wm5Float3.h"
%include "Wm5HPoint.h"
%include "Wm5AVector.h"
%include "Wm5APoint.h"
%include "Wm5HPlane.h"
%include "Wm5Matrix3.h"
%include "Wm5HMatrix.h"

%include "Wm5GraphicsLIB.h"
%include "Wm5Math.h"
%include "Wm5Transform.h"


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

// "Instantiate" template in target language.
%template(Tuple2d)  Wm5::Tuple<2, double>;
%template(Tuple2f)  Wm5::Tuple<2, float>;
%template(Tuple3d)  Wm5::Tuple<3, double>;
%template(Tuple3f)  Wm5::Tuple<3, float>;
%template(Distance2d) Wm5::Distance<double, Wm5::Vector2<double> >;
%template(Distance2f) Wm5::Distance<float, Wm5::Vector2<float> >;
%template(Distance3d) Wm5::Distance<double, Wm5::Vector3<double> >;
%template(Distance3f) Wm5::Distance<float, Wm5::Vector3<float> >;
%template(Vector2d)  Wm5::Vector2<double>;
%template(Vector2f)  Wm5::Vector2<float>;
%template(Vector3d)  Wm5::Vector3<double>;
%template(Vector3f)  Wm5::Vector3<float>;
%template(Segment2d) Wm5::Segment2<double>;
%template(Segment2f) Wm5::Segment2<float>;
%template(Segment3d) Wm5::Segment3<double>;
%template(Segment3f) Wm5::Segment3<float>;
%template(Intersector2d) Wm5::Intersector<double, Wm5::Vector2<double> >;
%template(Intersector2f) Wm5::Intersector<float, Wm5::Vector2<float> >;
%template(IntrSegment2Segment2d) Wm5::IntrSegment2Segment2<double>;
%template(IntrSegment2Segment2f) Wm5::IntrSegment2Segment2<float>;
%template(DistSegment2Segment2d) Wm5::DistSegment2Segment2<double>;
%template(DistSegment2Segment2f) Wm5::DistSegment2Segment2<float>;
%template(DistSegment3Segment3d) Wm5::DistSegment3Segment3<double>;
%template(DistSegment3Segment3f) Wm5::DistSegment3Segment3<float>;
%template(DistPoint3Segment3d) Wm5::DistPoint3Segment3<double>;
%template(DistPoint3Segment3f) Wm5::DistPoint3Segment3<float>;
%template(Mathd) Wm5::Math<double>;
%template(Mathf) Wm5::Math<float>;

// The end.
