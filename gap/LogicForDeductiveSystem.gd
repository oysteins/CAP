#############################################################################
##
##                                               CategoriesForHomalg package
##
##  Copyright 2014, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#! @Chapter Deduction system
##
#############################################################################

## Global files and add functions

DeclareGlobalVariable( "CATEGORIES_LOGIC_FILES" );

DeclareAttribute( "INSTALL_LOGICAL_IMPLICATIONS",
                  IsHomalgCategory );

DeclareGlobalFunction( "INSTALL_LOGICAL_IMPLICATIONS_HELPER" );

DeclareGlobalFunction( "AddTheoremFileToCategory" );

DeclareGlobalFunction( "AddPredicateImplicationFileToCategory" );

## Theorems

DeclareGlobalFunction( "ADD_THEOREM_TO_CATEGORY" );

DeclareGlobalFunction( "SANITIZE_RECORD" );

DeclareGlobalFunction( "INSTALL_TODO_FOR_LOGICAL_THEOREMS" );

## True methods

DeclareGlobalFunction( "ADD_PREDICATE_IMPLICATIONS_TO_CATEGORY" );

DeclareGlobalFunction( "INSTALL_PREDICATE_IMPLICATION" );