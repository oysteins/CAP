#! @Chapter Examples and tests

#! @Section Generalized morphisms category

if not IsBound( VectorSpacesConstructorsLoaded ) then

  ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesConstructors.gi" );;

fi;

#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForGeneralizedMorphismsTest" );
#! VectorSpacesForGeneralizedMorphismsTest
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
B := QVectorSpace( 2 );
#! <A rational vector space of dimension 2>
C := QVectorSpace( 3 );
#! <A rational vector space of dimension 3>
B_1 := QVectorSpace( 1 );
#! <A rational vector space of dimension 1>
C_1 := QVectorSpace( 2 );
#! <A rational vector space of dimension 2>
c1_source_aid := VectorSpaceMorphism( B_1, [ [ 1, 0 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0 ] ]
#! 
SetIsSubobject( c1_source_aid, true );
c1_range_aid := VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 1 ], [ 0, 0 ] ], C_1 );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0 ],
#!   [  0,  1 ],
#!   [  0,  0 ] ]
#! 
SetIsFactorobject( c1_range_aid, true );
c1_associated := VectorSpaceMorphism( B_1, [ [ 1, 1 ] ], C_1 );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  1 ] ]
#! 
c1 := GeneralizedMorphism( c1_source_aid, c1_associated, c1_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
B_2 := QVectorSpace( 1 );
#! <A rational vector space of dimension 1>
C_2 := QVectorSpace( 2 );
#! <A rational vector space of dimension 2>
c2_source_aid := VectorSpaceMorphism( B_2, [ [ 2, 0 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  2,  0 ] ]
#! 
SetIsSubobject( c2_source_aid, true );
c2_range_aid := VectorSpaceMorphism( C, [ [ 3, 0 ], [ 0, 3 ], [ 0, 0 ] ], C_2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  3,  0 ],
#!   [  0,  3 ],
#!   [  0,  0 ] ]
#! 
SetIsFactorobject( c2_range_aid, true );
c2_associated := VectorSpaceMorphism( B_2, [ [ 6, 6 ] ], C_2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  6,  6 ] ]
#! 
c2 := GeneralizedMorphism( c2_source_aid, c2_associated, c2_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
EqualityOfMorphisms( c1, c2 );
#! true
EqualityOfMorphisms( c1, c1 );
#! true
c3_associated := VectorSpaceMorphism( B_1, [ [ 2, 2 ] ], C_1 );
#! A rational vector space homomorphism with matrix: 
#! [ [  2,  2 ] ]
#! 
c3 := GeneralizedMorphism( c1_source_aid, c3_associated, c1_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
EqualityOfMorphisms( c1, c3 );
#! false
EqualityOfMorphisms( c2, c3 );
#! false
c1 + c2;
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
AssociatedMorphism( c1 + c2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  12,  12 ] ]
#! 
#! @EndExample

#! First composition test:

#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForGeneralizedMorphismsTest" );
#! VectorSpacesForGeneralizedMorphismsTest
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
A := QVectorSpace( 1 );
#! <A rational vector space of dimension 1>
B := QVectorSpace( 2 );
#! <A rational vector space of dimension 2>
C := QVectorSpace( 3 );
#! <A rational vector space of dimension 3>
phi_tilde_associated := VectorSpaceMorphism( A, [ [ 1, 2, 0 ] ], C );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  2,  0 ] ]
#! 
phi_tilde_source_aid := VectorSpaceMorphism( A, [ [ 1, 2 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  2 ] ]
#! 
phi_tilde := GeneralizedMorphismWithSourceAid( phi_tilde_source_aid, phi_tilde_associated );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
psi_tilde_associated := IdentityMorphism( B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! 
psi_tilde_source_aid := VectorSpaceMorphism( B, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], C );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0,  0 ],
#!   [  0,  1,  0 ] ]
#! 
psi_tilde := GeneralizedMorphismWithSourceAid( psi_tilde_source_aid, psi_tilde_associated );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
composition := PreCompose( phi_tilde, psi_tilde );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
AssociatedMorphism( composition );
#! A rational vector space homomorphism with matrix: 
#! [ [  1/2,    1 ] ]
#! 
SourceAid( composition );
#! A rational vector space homomorphism with matrix: 
#! [ [  1/2,    1 ] ]
#! 
RangeAid( composition );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0 ],
#!   [  0,  1 ] ]
#! @EndExample

#! Second composition test

#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForGeneralizedMorphismsTest" );
#! VectorSpacesForGeneralizedMorphismsTest
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
phi2_tilde_associated := VectorSpaceMorphism( A, [ [ 1, 5 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  5 ] ]
#! 
phi2_tilde_range_aid := VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 1 ], [ 1, 1 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  0 ],
#!   [  0,  1 ],
#!   [  1,  1 ] ]
#! 
phi2_tilde := GeneralizedMorphismWithRangeAid( phi2_tilde_associated, phi2_tilde_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
psi2_tilde_associated := VectorSpaceMorphism( C, [ [ 1 ], [ 3 ], [ 4 ] ], A );
#! A rational vector space homomorphism with matrix: 
#! [ [  1 ],
#!   [  3 ],
#!   [  4 ] ]
#! 
psi2_tilde_range_aid := VectorSpaceMorphism( B, [ [ 1 ], [ 1 ] ], A );
#! A rational vector space homomorphism with matrix: 
#! [ [  1 ],
#!   [  1 ] ]
#! 
psi2_tilde := GeneralizedMorphismWithRangeAid( psi2_tilde_associated, psi2_tilde_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
composition2 := PreCompose( phi2_tilde, psi2_tilde );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
AssociatedMorphism( composition2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  16 ] ]
#! 
RangeAid( composition2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  1 ],
#!   [  1 ] ]
#! 
SourceAid( composition2 );
#! A rational vector space homomorphism with matrix: 
#! [ [  1 ] ]
#! @EndExample

#! Third composition test

#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForGeneralizedMorphismsTest" );
#! VectorSpacesForGeneralizedMorphismsTest
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
A := QVectorSpace( 3 );
Asub := QVectorSpace( 2 );
B := QVectorSpace( 3 );
Bfac := QVectorSpace( 1 );
Bsub := QVectorSpace( 2 );
C := QVectorSpace( 3 );
Cfac := QVectorSpace( 1 );
Asub_into_A := VectorSpaceMorphism( Asub, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], A );
Asub_to_Bfac := VectorSpaceMorphism( Asub, [ [ 1 ], [ 1 ] ], Bfac );
B_onto_Bfac := VectorSpaceMorphism( B, [ [ 1 ], [ 1 ], [ 1 ] ], Bfac );
Bsub_into_B := VectorSpaceMorphism( Bsub, [ [ 2, 2, 0 ], [ 0, 2, 2 ] ], B );
Bsub_to_Cfac := VectorSpaceMorphism( Bsub, [ [ 3 ], [ 0 ] ], Cfac );
C_onto_Cfac := VectorSpaceMorphism( C, [ [ 1 ], [ 2 ], [ 3 ] ], Cfac );
generalized_morphism1 := GeneralizedMorphism( Asub_into_A, Asub_to_Bfac, B_onto_Bfac );
generalized_morphism2 := GeneralizedMorphism( Bsub_into_B, Bsub_to_Cfac, C_onto_Cfac );

A := QVectorSpace( 3 );
Asub := QVectorSpace( 2 );
B := QVectorSpace( 3 );
Bfac := QVectorSpace( 1 );
Bsub := QVectorSpace( 2 );
C := QVectorSpace( 4 );
Cfac := QVectorSpace( 2 );
Asub_into_A := VectorSpaceMorphism( Asub, [ [ 1, 0, 0 ], [ 0, 1, 0 ] ], A );
Asub_to_Bfac := VectorSpaceMorphism( Asub, [ [ 1 ], [ 1 ] ], Bfac );
B_onto_Bfac := VectorSpaceMorphism( B, [ [ 1 ], [ 1 ], [ 1 ] ], Bfac );
Bsub_into_B := VectorSpaceMorphism( Bsub, [ [ 2, 2, 0 ], [ 0, 2, 2 ] ], B );
Bsub_to_Cfac := VectorSpaceMorphism( Bsub, [ [ 3, 3 ], [ 0, 0 ] ], Cfac );
C_onto_Cfac := VectorSpaceMorphism( C, [ [ 1, 0 ], [ 0, 2 ], [ 3, 3 ] ], Cfac );
generalized_morphism1 := GeneralizedMorphism( Asub_into_A, Asub_to_Bfac, B_onto_Bfac );
generalized_morphism2 := GeneralizedMorphism( Bsub_into_B, Bsub_to_Cfac, C_onto_Cfac );
#! @EndExample

#! Honest representative test
#! @Example
vecspaces := CreateHomalgCategory( "VectorSpacesForGeneralizedMorphismsTest" );
#! VectorSpacesForGeneralizedMorphismsTest
ReadPackage( "CategoriesForHomalg", "examples/testfiles/VectorSpacesAllMethods.gi" );
#! true
phi_tilde_source_aid := VectorSpaceMorphism( A, [ [ 2 ] ], A );
#! A rational vector space homomorphism with matrix: 
#! [ [  2 ] ]
#! 
phi_tilde_associated := VectorSpaceMorphism( A, [ [ 1, 1 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  1 ] ]
#!
phi_tilde_range_aid := VectorSpaceMorphism( B, [ [ 1, 2 ], [ 3, 4 ] ], B );
#! A rational vector space homomorphism with matrix: 
#! [ [  1,  2 ],
#!   [  3,  4 ] ]
#!
phi_tilde := GeneralizedMorphism( phi_tilde_source_aid, phi_tilde_associated, phi_tilde_range_aid );
#! <A morphism in the category Generalized morphism category of VectorSpacesForGeneralizedMorphismsTest>
HonestRepresentative( phi_tilde );
#! A rational vector space homomorphism with matrix: 
#! [ [  -1/4,   1/4 ] ]
#!
IsWellDefined( phi_tilde );
#! true
IsWellDefined( psi_tilde );
#! true
#! @EndExample
