% Set Operations

% Checks if set S is empty
myisempty( S ):- S=[ ].
/* Tests:
 * 
 * ?- myisempty( [ ] ).
 * true.
 *
 * ?- myisempty( [ 1, 2, 3 ] )
 * false.
*/

% Returns true if set S1 is a subset of S2
mysubset( [ ], [ ] ).
mysubset( [ S|S1 ], [ S|S2 ] ) :- mysubset( S1, S2 ).
mysubset( S1, [ _|S2 ] ) :- mysubset( S1, S2 ).
/* Tests:
 * 
 * ?- mysubset( [ 1, 2, 3 ], [ 5, 3, 1, 6, 8, 2 ] ).
 * true.
 *
 * ?- mysubset( [ 1, 2, 3 ], [ 6, 3, 2, 0, 9 ] ).
 * false.
*/

% Returns true if sets S1 and S2 are equal
mysetequal( S1, S2 ) :- mysubset( S1, S2 ), mysubset( S2, S1 ).
/* Tests:
 * 
 * ?- mysetequal( [ 1, 6, 3, 90 ], [ 90, 1, 3, 6 ] ).
 * true.
 *
 * ?- mysetequal( [ 1, 6, 3, 90 ], [ 1, 3, 91, 7 ] ).
 * false.
*/

% Returns the intersecting values between two sets
myintersection( [ ], _, [ ] ).
myintersection( [ S|S1 ], S2, [ S|I ] ) :- member( S, S2 ), myintersection( S1, S2, I ).
myintersection( [ |S1 ], S2, I ) :-  myintersection( S1, S2, I ).
/* Tests:
 *
 * ?- myintersection( [ 1, 5, 4 ], [ 1, 5, 9 ], I ).
 * I = [ 1, 5 ].
 *
 * ?- myintersection( [ 1, 5, 4 ], [ 8, 3, 6 ], I ).
 * I = [ ].
*/

