% Permutation Squares

% Defines the square cells
cell(1). cell(2). cell(3). cell(4). cell(5). cell(6). cell(7). cell(8). cell(9).

% Defines the rows (add to 15)
rows( X, Y, Z ) :- cell( X ),
                   cell( Y ), X =\= Y
                   cell( Z ), X =\= Z, Y =\= Z,
		   X + Y + Z =:= 15.

% Defines the columns (add to 15)
columns( X, Y, Z ) :- -X =\= Y, Y =\= Z, X =\= Z
	              X + Y + Z =:= 15.

% Defines the square diagonals (add to 15)
diagonals( X, Y, Z ) :- cell( X ),
                        cell( Y ),
			cell( Z ), X =\= Y, X =\= Z, Y =\= Z,
			X + Y + Z =:= 15.

% Prints each row for output
printrow( Xp, Yp, Zp ) :- write( Xp ), write( Yp ), write( Zp ), nl.

% Generates the permutation square
generate( A, B, C,
          D, E, F,
	  G, H, I ) :- rows( A, B, C ), rows( D, E, F ), rows( G, H, I ), 
	  	       columns( A, D, G ), columns( B, E, H ), columns( C, F, I ),
		       diagonals( A, E, I ), diagonals( G, E, C ),
	               printrow( A, B, C ), printrow( D, E, F ), printrow( G, H, I ).

/* Test:
 *
 * ?- generate( 6, 3, 1, 9, 8, 0, 4, 5, 7 ).
 * 631
 * 980
 * 457
*/ 
