#############################################################################
##
##                                               CategoriesForHomalg package
##
##  Copyright 2013, Sebastian Gutsche, TU Kaiserslautern
##                  Sebastian Posur,   RWTH Aachen
##
#! @AutoDoc
#! @Chapter Opposite category
##
#############################################################################

DeclareRepresentation( "IsHomalgProductCategoryRep",
                       IsAttributeStoringRep and IsHomalgCategoryRep,
                       [ ] );

BindGlobal( "TheTypeOfHomalgProductCategories",
        NewType( TheFamilyOfHomalgCategories,
                 IsHomalgProductCategoryRep ) );

DeclareRepresentation( "IsHomalgCategoryProductObjectRep",
                       IsAttributeStoringRep and IsHomalgCategoryObjectRep,
                       [ ] );

DeclareRepresentation( "IsHomalgCategoryProductMorphismRep",
                       IsAttributeStoringRep and IsHomalgCategoryMorphismRep,
                       [ ] );

BindGlobal( "TheTypeOfHomalgCategoryProductObjects",
        NewType( TheFamilyOfHomalgCategoryObjects,
                IsHomalgCategoryProductObjectRep ) );

BindGlobal( "TheTypeOfHomalgCategoryProductMorphisms",
        NewType( TheFamilyOfHomalgCategoryMorphisms,
                IsHomalgCategoryProductMorphismRep ) );

###################################
##
#! @Section Constructor
##
###################################

##
InstallMethodWithCache( ProductOp,
                        [ IsList, IsHomalgCategory ],
                        
  function( category_list, selector )
    local product_category, namestring;
    
    namestring := JoinStringsWithSeparator( List( category_list, Name ), ", " );
    
    namestring := Concatenation( "Product of: " , namestring );
    
    product_category := rec( );
    
    ObjectifyWithAttributes( product_category, TheTypeOfHomalgProductCategories,
                             Components, category_list,
                             Length, Length( category_list ),
                             Name, namestring
                           );
    
    CREATE_HOMALG_CATEGORY_FILTERS( product_category );
    
    InstallImmediateMethod( HomalgCategory,
                            IsHomalgCategoryObject and ObjectFilter( product_category ),
                            0,
                            
      function( object )
        
        return product_category;
        
    end );
    
    InstallImmediateMethod( HomalgCategory,
                            IsHomalgCategoryMorphism and MorphismFilter( product_category ),
                            0,
                            
      function( object )
        
        return product_category;
        
    end );
    
    return product_category;
    
end );

##
InstallMethodWithCache( ProductOp,
                        [ IsList, IsHomalgCategoryObject ],
                        
  function( object_list, selector )
    local product_object, category;
    
    product_object := rec( );
    
    ObjectifyWithAttributes( product_object, TheTypeOfHomalgCategoryProductObjects,
                             Components, object_list,
                             Length, Length( object_list )
                           );
    
    category := CallFuncList( Product, List( object_list, HomalgCategory ) );
    
    Add( category, product_object );
    
    return product_object;
    
end );

##
InstallMethodWithCache( ProductOp,
                        [ IsList, IsHomalgCategoryMorphism ],
                        
  function( morphism_list, selector )
    local product_morphism, category;
    
    product_morphism := rec( );
    
    ObjectifyWithAttributes( product_morphism, TheTypeOfHomalgCategoryProductMorphisms,
                             Components, morphism_list,
                             Length, Length( morphism_list )
                           );
    
    category := CallFuncList( Product, List( morphism_list, HomalgCategory ) );
    
    Add( category, product_morphism );
    
    return product_morphism;
    
end );

##
InstallMethod( \[\],
               [ IsHomalgProductCategoryRep, IsInt ],
               
  function( category, index )
    
    if Length( category ) < index then
        
        Error( "index too high, cannot compute this Component" );
        
    fi;
    
    return Components( category )[ index ];
    
end );

##
InstallMethod( \[\],
               [ IsHomalgCategoryProductObjectRep, IsInt ],
               
  function( object, index )
    
    if Length( object ) < index then
        
        Error( "index too high, cannot compute this Component" );
        
    fi;
    
    return Components( object )[ index ];
    
end );

##
InstallMethod( \[\],
               [ IsHomalgCategoryProductMorphismRep, IsInt ],
               
  function( morphism, index )
    
    if Length( morphism ) < index then
        
        Error( "index too high, cannot compute this Component" );
        
    fi;
    
    return Components( morphism )[ index ];
    
end );

###################################
##
#! @Section Morphism function
##
###################################

##
InstallMethod( Source,
               [ IsHomalgCategoryProductMorphismRep ],
               
  function( morphism )
    
    return CallFuncList( Product, List( Components( morphism ), Source ) );
    
end );

##
InstallMethod( Range,
               [ IsHomalgCategoryProductMorphismRep ],
               
  function( morphism )
    
    return CallFuncList( Product, List( Components( morphism ), Range ) );
    
end );

##
InstallMethod( PreCompose,
               [ IsHomalgCategoryProductMorphismRep, IsHomalgCategoryProductMorphismRep ],
               
  function( mor_left, mor_right )
    
    return CallFuncList( Product, List( [ 1 .. Length( mor_left ) ], i -> PreCompose( mor_left[ i ], mor_right[ i ] ) ) );
    
end );

###################################
##
#! @Section Some hacks
##
###################################

BindGlobal( "HOMALG_CATEGORIES_PRODUCT_SAVE", Product );

MakeReadWriteGlobal( "Product" );

## HEHE!
Product := function( arg )
  
  if ( ForAll( arg, IsHomalgCategory ) or ForAll( arg, IsHomalgCategoryObject ) or ForAll( arg, IsHomalgCategoryMorphism ) ) and Length( arg ) > 0 then
      
      return ProductOp( arg, arg[ 1 ] );
      
  fi;
  
  return CallFuncList( HOMALG_CATEGORIES_PRODUCT_SAVE, arg );
  
end;

MakeReadOnlyGlobal( "Product" );