:-use_module(library(lambda)).

solve:-
    solve(Moves), display(Moves).

solve(Moves):-
    jump([1], [2,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves).
solve(Moves1):-
    jump([2], [1,3,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves1).
solve(Moves2):-
    jump([3], [1,2,4,5,6,7,8,9,10,11,12,13,14,15], [], Moves2).
solve(Moves3):-
    jump([4], [1,2,3,5,6,7,8,9,10,11,12,13,14,15], [], Moves3).
solve(Moves4):-
    jump([5], [1,2,3,4,6,7,8,9,10,11,12,13,14,15], [], Moves4).

jump(_, [_], Lst, Moves):-
    reverse(Lst, Moves).

jump(Free, Occupied, Lst, Moves):-
    select(S, Occupied, Occupied1),
    select(O, Occupied1, Occupied2), 
    select(E, Free, Free1), 
    move(S, O, E), 
    jump([S, O | Free1], [E|Occupied2], [move(S,O,E) | Lst], Moves).

move(S, 2, E):- member([S,E], [[1,4], [4,1]]).
move(S, 3, E):- member([S,E], [[1,6], [6,1]]).
move(S, 4, E):- member([S,E], [[2,7], [7,2]]).
move(S, 5, E):- member([S,E], [[2,9], [9,2]]).
move(S, 5, E):- member([S,E], [[3,8], [8,3]]).
move(S, 6, E):- member([S,E], [[3,10], [10,3]]).
move(S, 5, E):- member([S,E], [[4,6], [6,4]]).
move(S, 7, E):- member([S,E], [[4,11],[11,4]]).
move(S, 8, E):- member([S,E], [[4,13], [13,4]]).
move(S, 8, E):- member([S,E], [[5,12], [12,5]]).
move(S, 9, E):- member([S,E], [[5,14], [14,5]]).
move(S, 9, E):- member([S,E], [[6,13], [13,6]]).
move(S, 10, E):- member([S,E], [[6,15], [15,6]]).
move(S, 8, E):- member([S,E], [[9,7], [7,9]]).
move(S, 9, E):- member([S,E], [[10,8], [8,10]]).
move(S, 12, E):- member([S,E], [[11, 13], [13,11]]).
move(S, 13, E):- member([S,E], [[12,14], [14,12]]).
move(S, 14, E):- member([S,E], [[15,13], [13,15]]).

display(Solution):- display(Solution, [1]).

display([], Free):-
    numlist(1,15,Lst),
    maplist(\X^I^(member(X, Free) -> I = 'O'; I = 'X'), Lst, [I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15]),
    format('     ~w      ~n', [I1]), 
    format('   ~w ~w     ~n', [I2, I3]),
    format('  ~w ~w ~w   ~n', [I4,I5, I6]),
    format(' ~w ~w ~w ~w ~n', [I7, I8, I9, I10]), 
    format('~w ~w ~w ~w ~w ~n ~n',[I11,I12,I13,I14,I15]),
    writeln(complete).

display([move(Start, Middle, End)|Tail], Free):-
    numlist(1,15,Lst),
    maplist(\X^I^(member(X, Free) -> I = 'O'; I = 'X'), Lst, [I1, I2, I3, I4, I5, I6, I7, I8, I9, I10, I11, I12, I13, I14, I15]),
    format('     ~w      ~n', [I1]), 
    format('   ~w ~w     ~n', [I2, I3]),
    format('  ~w ~w ~w   ~n', [I4,I5, I6]),
    format(' ~w ~w ~w ~w ~n', [I7, I8, I9, I10]), 
    format('~w ~w ~w ~w ~w ~n~n',[I11,I12,I13,I14,I15]),
    select(End, Free, Free1),
    display(Tail, [Start, Middle | Free1]).