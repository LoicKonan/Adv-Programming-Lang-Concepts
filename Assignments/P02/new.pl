happy(md).
happy(jordan).

% If a person is smiling and laughing, they are happy.
happy(X):-smiling(X),laughing(X).

smiling(deangelo).
smiling(sabin).
smiling(kyle).

% If a person is laughing they are smiling.
smiling(X):-laughing(X).

% A person will smile if they see a person who is smiling
smiling(X):-sees(X,Y),smiling(Y).

laughing(mia).
laughing(parker).
laughing(dylan).

% If a person is energetic, they will be laughing
laughing(X):-energetic(X).

energetic(leila).
energetic(buddy).
energetic(caleb).

sees(md, leila).
sees(sabin,kyle).
sees(parker,jordan).
sees(buddy,deangelo).
sees(caleb,mia).
sees(caleb,dylan).