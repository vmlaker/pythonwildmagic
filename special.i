// A SWIG interface file with C++ names to be ignored.

%ignore Wm5::Query2Rational::Dot;
%ignore Wm5::Query2Rational::Det2;
%ignore Wm5::Query2Rational::Det3;
%ignore Wm5::Query3Rational::Dot;
%ignore Wm5::Query3Rational::Det3;
%ignore Wm5::Query3Rational::Det4;
%ignore Wm5::Matrix4;

// The following functions are undefined and hence need to be ignored.
%ignore Wm5::Environment::GetPath(const std::string&, int mode);
%ignore Wm5::LightModelDVectorConstant::GetLight();
%ignore Wm5::VertexBufferAccessor::SetNormal3(int, const AVector&);
%ignore Wm5::VertexBufferAccessor::GetNormal3(int i) const;
