#! @Chapter Examples and tests

#! @Section IsWellDefined

if not IsBound( VectorSpacesConstructorsLoaded ) then

  ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesConstructors.gi" );;

fi;

#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForIsWellDefinedTest" );
#! VectorSpacesForIsWellDefinedTest 
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
A := QVectorSpace( 1 );
#! <A rational vector space of dimension 1>
B := QVectorSpace( 2 );
#! <A rational vector space of dimension 2>
alpha := VectorSpaceMorphism( A, [ [ 1, 2 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  2 ] ]
#! 
g := GeneralizedMorphism( alpha, alpha, alpha );
#! <A morphism in the category Generalized morphism category of VectorSpacesForIsWellDefinedTest>
IsWellDefined( alpha );
#! true
IsWellDefined( g );
#! false
#! @EndExample