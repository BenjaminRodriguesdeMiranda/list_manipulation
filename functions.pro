member(Element, [Element|_]).
member(Element, [_|Tail]) :-
	member(Element, Tail).

sublist([], X).
sublist([Head1|Tail1], [Head1|Tail2]) :-
	sublist(Tail1, Tail2), !.
sublist(List1, [Head2|Tail2]) :-
	sublist(List1, Tail2).

add(Element, List, [Element|List]).

concatenate([], List2, List2).
concatenate([Head1|Tail1], List2, ReturnList) :-
	concatenate(Tail1, List2, TempReturnList),
	add(Head1, TempReturnList, ReturnList).

reverse([], []).
reverse([Head|Tail], Reversed) :-
	reverse(Tail, TempReversed),
	concatenate(TempReversed, [Head], Reversed).

palindrome(List) :-
	reverse(List, List).

even([]).
even([Head|Tail]) :-
	odd(Tail).

odd([Head|Tail]) :-
	even(Tail).

shorter([], [Head|Tail]).
shorter([Head1|Tail1], [Head2|Tail2]) :-
	shorter(Tail1, Tail2).

length([], 0).
length([Head|Tail], Len) :-
	length(Tail, Temp),
	Len is Temp+1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

edge(d, a).
edge(c, a).
edge(a, b).
edge(b, e).
edge(f, e).
edge(g, f).
edge(g, h).

connected(A, B) :-
	edge(A, B).
connected(A, C) :-
	edge(A, B),
	connected(B, C).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

common_member(Element, List1, List2) :-
	member(Element, List1),
	member(Element, List2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

equal_length([], []).
equal_length([_|Tail1], [_|Tail2]) :-
	equal_length(Tail1, Tail2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

sum_list([], 0).
sum_list([Head|Tail], Sum) :-
	sum_list(Tail, SubSum),
	Sum is SubSum+Head.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

palindrome_sublist(List1, List2) :-
	palindrome(List1),
	sublist(List1, List2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

middle(Element, List) :-
	odd(List),
	shorter(SubList1, List),
	concatenate(SubList1, [Element|SubList2], List),
	equal_length(SubList1, SubList2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

set_difference([],_,[]).
set_difference([H|Tail],L,[H|Tail2]) :-
   not member(H,L),
   set_difference(Tail,L,Tail2).
set_difference([_|Tail],L,Tail2) :-
	set_difference(Tail,L,Tail2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

split([], [], [], []).
split([Head|Tail], [Head|Numbers], Atoms, Rest) :-
	number(Head),
	split(Tail, Numbers, Atoms, Rest).
split([Head|Tail], Numbers, [Head|Atoms], Rest) :-
	atom(Head),
	split(Tail, Numbers, Atoms, Rest).
split([Head|Tail], Numbers, Atoms, [Head|Rest]) :-
	split(Tail, Numbers, Atoms, Rest).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

propercase([Head1|Tail1], [Head2|Tail2]) :-
	string_lower(Head1, Head2),
	string_lower(Tail1, Tail2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

swap([A, B|Tail], [B, A|Tail]) :-
	B > A.
swap([Head1|Tail1], [Head1|Tail2]).
bubble_sort(List, Sorted)
	swap(List, NewList), !,
	bubble_sort(NewList, Sorted).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

insert(A, [B|Tail1], [B|Tail2]) :-
	A > B,
	insert(A, Tail1, Tail2).
insert(A, Tail, [B|Tail]).
insert_sort([], []).
insert_sort([Head|Tail], Sorted) :-
	insert_sort(Tail, Sorted1),
	insert(Head, Sorted1, Sorted).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%











