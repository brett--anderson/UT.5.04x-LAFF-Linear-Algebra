
% Copyright 2016 The University of Texas at Austin
%
% For licensing information see
%                http://www.cs.utexas.edu/users/flame/license.html 
%                                                                                 
% Programmed by: Name of author
%                Email of author

function [ A_out, B_out ] = Transpose_unb( A, B )

  [ AT, ...
    AB ] = FLA_Part_2x1( A, ...
                         0, 'FLA_TOP' );

  [ BL, BR ] = FLA_Part_1x2( B, ...
                               0, 'FLA_LEFT' );

  while ( size( AT, 1 ) < size( A, 1 ) )

    [ A0, ...
      a1t, ...
      A2 ] = FLA_Repart_2x1_to_3x1( AT, ...
                                    AB, ...
                                    1, 'FLA_BOTTOM' );

    [ B0, b1, B2 ]= FLA_Repart_1x2_to_1x3( BL, BR, ...
                                         1, 'FLA_RIGHT' );

    %------------------------------------------------------------%

    b1 = laff_copy(a1t, b1);

    %------------------------------------------------------------%

    [ AT, ...
      AB ] = FLA_Cont_with_3x1_to_2x1( A0, ...
                                       a1t, ...
                                       A2, ...
                                       'FLA_TOP' );

    [ BL, BR ] = FLA_Cont_with_1x3_to_1x2( B0, b1, B2, ...
                                           'FLA_LEFT' );

  end

  A_out = [ AT
            AB ];

  B_out = [ BL, BR ];

return
