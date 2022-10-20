%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  
%      Author:           Loic Konan
%      Email:            loickonan.lk@gmail.com
%      Label:            P
%      Title:            Program 2
%      Course:           CMPS 5113, Dr. Johnson
%      Semester:         Fall 2022
%      Description:
%  
%                        The goal of this assignment is to write write a Prolog program 
%                        to determine family relationships.
%
%                        Facts: Write 10-20 facts in each category. 
%                        male or female /1 Ex. female(tina). Tina is a female
%                        parent /2 Ex. parent(tina, kerri). Tina is the parent of Kerri
%
%                        Rules: Write rules for the following.
%                        child(A, B)
%                        grandparent(A, B)
%                        brother(A, B)
%                        sister(A, B)
%                        Make up at least 2 more relationship rules of your own.
%  
%      Usage:
%             main.pl          : driver program
%             
%             
%      IDE:              VSCode
%  
%  
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Facts: Write 10-20 facts in each category. Make up names or use people that you know.
% male or female /1 Ex. female(tina). Tina is a female

% Family A
male(joe).      % Family A Dad
female(luna).   % Family A Mom
male(andrew).   % Family A male child
female(maria).  % Family A female child
female(nancy).  % Family A niece of andrew and maria

% Family B
male(ben).      % Family B Dad
female(sofia).  % Family B Mom
male(noah).     % Family B male child
female(lyla).   % Family B female child
male(lex).      % Family B nephew of noah and lyla


% Family C
male(henry).    % Family C Dad
female(ava).    % Family C Mom
male(elias).    % Family C male child
female(julia).  % Family C female child
female(rosa).   % Family C julia and elias grandmother
male(alex).     % Family C julia and elias grandfather


% Family D
male(ethan).    % Family D Dad
female(olivia). % Family D Mom
male(ryan).     % Family D male child
male(deangelo). % Family D ethan brother
female(katy).   % Family D olivia sister


% Family E
male(mike).     % Family E Dad
female(emilia). % Family E Mom
female(lillian).% Family E female child
female(rose).   % Family E female child
male(richard).  % Family E lillian and rose cousin


% parent         /2 Ex. parent(tina, kerri). Tina is the parent of Kerri

% Family A
parent(joe, andrew).        % Family A
parent(joe, maria).         % Family A
parent(luna, andrew).       % Family A
parent(luna, maria).        % Family A
niece(andrew, nancy).       % Family A
niece(maria, nancy).        % Family A


% Family B
parent(ben, noah).          % Family B
parent(ben, lyla).          % Family B
parent(sofia, noah).        % Family B
parent(sofia, lyla).        % Family B
nephew(noah, lex).          % Family B
nephew(lyla, lex).          % Family B


% Family C
parent(henry, elias).       % Family C
parent(henry, julia).       % Family C
parent(ava, elias).         % Family C
parent(ava, julia).         % Family C
grandparent(rosa, elias).   % Family C
grandparent(rosa, julia).   % Family C
grandparent(alex, elias).   % Family C
grandparent(alex, julia).   % Family C


% Family D
parent(ethan, ryan).        % Family D
parent(olivia, ryan).       % Family D
brother(ethan, deangelo).   % Family D
sister(olivia, katy).       % Family D


% Family E
parent(mike, lillian).      % Family E
parent(mike, rose).         % Family E
parent(emilia, lillian).    % Family E
parent(emilia, rose).       % Family E
cousin(lillian, richard).  % Family E
cousin(rose, richard).     % Family E


% Rules: Write rules for the following add 2 more relationship rules.

child(A, B) :- parent(B, A).
grandparent(A, B) :- parent(A, C), parent(C, B).
brother(A,B) :- parent(C, A), parent(C, B).
sister(A,B) :- parent(C, A), parent(C, B).
cousin(A,B) :- parent(C, A), parent(D, B), brother(C, D).
niece(A,B) :- parent(C, A), sister(C, B).
nephew(A,B) :- parent(C, A), brother(C, B).

% % Queries: queries for all the relationships.
?- child(A, joe).
?- grandparent(A, elias).
?- brother(A, deangelo).
?- sister(A, katy).
?- cousin(A, richard).
?- niece(A, nancy).
?- nephew(A, lex).



% /*
 
    █████████                                  █████                                                                                   ███                  
   ███░░░░░███                                ░░███                                                                                   ░░░                   
  ███     ░░░  ████████  █████ ████ ████████  ███████    ██████   ██████  █████ ████ ████████  ████████   ██████  ████████    ██████  ████   ██████   █████ 
 ░███         ░░███░░███░░███ ░███ ░░███░░███░░░███░    ███░░███ ███░░███░░███ ░███ ░░███░░███░░███░░███ ███░░███░░███░░███  ███░░███░░███  ███░░███ ███░░  
 ░███          ░███ ░░░  ░███ ░███  ░███ ░███  ░███    ░███ ░███░███ ░░░  ░███ ░███  ░███ ░░░  ░███ ░░░ ░███████  ░███ ░███ ░███ ░░░  ░███ ░███████ ░░█████ 
 ░░███     ███ ░███      ░███ ░███  ░███ ░███  ░███ ███░███ ░███░███  ███ ░███ ░███  ░███      ░███     ░███░░░   ░███ ░███ ░███  ███ ░███ ░███░░░   ░░░░███
  ░░█████████  █████     ░░███████  ░███████   ░░█████ ░░██████ ░░██████  ░░████████ █████     █████    ░░██████  ████ █████░░██████  █████░░██████  ██████ 
   ░░░░░░░░░  ░░░░░       ░░░░░███  ░███░░░     ░░░░░   ░░░░░░   ░░░░░░    ░░░░░░░░ ░░░░░     ░░░░░      ░░░░░░  ░░░░ ░░░░░  ░░░░░░  ░░░░░  ░░░░░░  ░░░░░░  
                          ███ ░███  ░███                                                                                                                    
                         ░░██████   █████                                                                                                                   
                          ░░░░░░   ░░░░░                                                                                                                    
 
*/.

% Cryptocurrencies
cryptocurrency(bitcoin).
cryptocurrency(ethereum).
cryptocurrency(dogecoin).
cryptocurrency(cardano).
cryptocurrency(polkadot).
cryptocurrency(uniswap).
cryptocurrency(xrp).
cryptocurrency(solana).
cryptocurrency(avalanche).
cryptocurrency(algorand).
cryptocurrency(tezos).

% Cryptocurrency abbreviations
abbreviation(btc,bitcoin).
abbreviation(eth,ethereum).
abbreviation(doge,dogecoin).
abbreviation(ada,cardano).
abbreviation(dot,polkadot).
abbreviation(uni,uniswap).
abbreviation(xrp,xrp).
abbreviation(sol,solana).
abbreviation(avax,avalanche).
abbreviation(algo,algorand).
abbreviation(xtz,tezos).


% Cryptocurrencies with their programming language

language(bitcoin, cpp).
language(dogecoin, cpp).
language(xrp, cpp).

language(ethereum, solidity).
language(uniswap, solidity).

language(cardano, haskell).

language(polkadot, rust).
language(solana, rust).

language(avalanche, go).
language(algorand, go).

% Cryptocurrencies founded by a person
founded_by(bitcoin, satoshi_nakamoto).
founded_by(ethereum, vitalik_buterin).
founded_by(cardano, charles_hoskinson).
founded_by(polkadot, gavin_wood).
founded_by(xrp, chris_larson).
founded_by(algorand, silvio_micali).

% Cryptocurrencies forked from another cryptocurrency
forked_from(dogecoin, bitcoin).
forked_from(uniswap, ethereum).
forked_from(solana, ethereum).
forked_from(avalanche, ethereum).

% Rules.
% Cryptocurrencies with their programming language
language(A, B) :- cryptocurrency(A), language(A, B).

% Cryptocurrencies founded by a person
founded_by(A, B) :- cryptocurrency(A), founded_by(A, B).

% Cryptocurrencies forked from another cryptocurrency
forked_from(A, B) :- cryptocurrency(A), forked_from(A, B).


% Queries: 10 queries for the relationships.
?- language(A, solidity).
?- founded_by(A, silvio_micali).
?- forked_from(A, ethereum).
?- language(A, c++).
?- founded_by(A, satoshi_nakamoto).
?- forked_from(A, bitcoin).
?- language(A, go).
?- founded_by(A, charles_hoskinson).
?- forked_from(A, ethereum).
?- language(A, rust).
?- abbreviation(A, ethereum).
?- abbreviation(A, dogecoin).
