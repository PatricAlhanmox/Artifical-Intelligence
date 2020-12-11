%Q11
/*This query is to add all element in the list*/
sumUp([],0).
sumUp([Head|Tail], Sum):-
    sumUp(Tail,Sum_Next),
    Sum is Sum_Next + Head*Head.

/*Remove all the odd element in the list*/
even([],[]).
even([Head|Tail], X):-
    Head mod 2 =\= 0,
    !,
    even(Tail,X).
even([Head|Tail], [Head|Tails]):-
    even(Tail,Tails).

/*Calculate them*/
sumsq_even(List, Total):-
    even(List, NewList),
    sumUp(NewList, Total).  
    
    
%Q12
/*Combine element and their log*/
combine(Num, [[Num,X]]):-
    Num > 0,
    X is log(Num).
    
/*Merge the combine list with final list*/
log_table([],[]).
log_table([Head|Tail], NewResult):-
    combine(Head, Bind),
    append(Bind, Result, NewResult),
    log_table(Tail, Result).

%Q13
/*check odd or even*/
odd(Num):-
    integer(Num),
    Num mod 2 =:= 1.
even(Num):-
    integer(Num),
    Num mod 2 =\= 1.
       
/*check if the first element is even, if yes then put it to X and if Y is not empty, also do the same procedure to the element which is odd, then put X and Y to End of the NewList*/
/*Base case*/

/*Even case*/
dividePart([Head|Tail], [X|NewList], X, Y):-
    even(Head),
    X \= [],
    dividePart(Tail, NewList, [], [Head|Y]).

dividePart([Head|Tail], NewList, X, Y):-
    even(Head),
    X == [],
    dividePart(Tail, NewList, X, [Head|Y]).

/*Odd case*/
dividePart([Head|Tail], [Y|NewList], X, Y):-
    odd(Head),
    Y \= [],
    dividePart(Tail, NewList, [Head|X], []).

dividePart([Head|Tail], NewList, X, Y):-
    odd(Head),
    Y == [],
    dividePart(Tail, NewList, [Head|X], Y).

dividePart([], [X], X,_):-
    X \= [].
divedePart([],[Y],_,Y):-
    Y \= [].

reverseEach([],[]).
reverseEach([Head|Tail], [X|Tails]):-
    reverse(Head, X),
    reverseEach(Tail, Tails).

paruns(List,RunList):-
    dividePart(List,NewList,[],[]),
    reverseEach(NewList, RunList).

%Q14
eval(div(E1,E2),V):-
    eval(E1,V1), 
    eval(E2, V2),
    V is V1/V2.
eval(mul(E1,E2), V):-
    eval(E1,V1), 
    eval(E2, V2),
    V is V1*V2.
eval(add(E1,E2), V):-
    eval(E1,V1), 
    eval(E2, V2),
    V is V1+V2.
eval(sub(E1,E2), V):-
    eval(E1,V1), 
    eval(E2, V2),
    V is V1-V2.    
eval(Expr, Val):-
    Val is Expr.


