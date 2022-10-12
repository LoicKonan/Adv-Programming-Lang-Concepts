% Facts: Write 10-20 facts in each category. Make up names or use people that you know.

% male or female /1 Ex. female(fowzy). fowzy is a female
% parent /2 Ex. parent(fowzy, kerri). fowzy is the parent of Kerri

% Rules: Write rules for the following.

% child(A, B)
% grandparent(A, B)
% brother(A, B)
% sister(A, B)

% Make up at least 2 more relationship rules of your own.

male(fowzy).
student(loic).
student(kerri).
student(kevin).
money(bitcoin).
money(dollar).
money(euro).
money(pound).
bitcoin(currency).
ethereum(cryptocurrency).



parent(fowzy, kerri).
parent(fowzy, loic).
parent(fowzy, josh).
parent(fowzy, jessica).
parent(fowzy, jordan).
parent(fowzy, jacob).
parent(fowzy, joshua).
parent(fowzy, jayden).
parent(fowzy, jay).
parent(fowzy, jayla).
parent(fowzy, jaylin).


child(kevin, ashley).
grandparent(jaycee, jayden).
brother(jayden, jaylin).
sister(jayden, jaylin).
nephew(jayden, jaylin).
niece(jayden, jaylin).
cousin(jayden, jaylin).
uncle(jayden, jaylin).
aunt(jayden, jaylin).


% Write a query to find all the children of fowzy.
(child(X, fowzy)).
% Write a query to find all the grandchildren of fowzy.
(grandparent(X, fowzy)).
% Write a query to find all the brothers of fowzy.
(brother(X, fowzy)).
% Write a query to find all the sisters of fowzy.
(sister(X, fowzy)).
% Write a query to find all the parents of fowzy.
(parent(X, fowzy)).
% Write a query to find all the grandparents of fowzy.
(grandparent(X, fowzy)).