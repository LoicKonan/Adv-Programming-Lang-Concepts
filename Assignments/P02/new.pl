/*
 * Course:CMPS-5113-180 Adv Programming Lang Concepts
 * Date: Fall 2022*/

happy(loic). %fact
happy(mike). %fact
happy(Y):- smile(Y),laugh(Y). %If a person is smiling and laughing, they are happy  
smile(andrew). %fact
smile(ben). %fact
smile(zapata). %fact
smile(X):-laugh(X). %If a person is laughing, they are smiling
smile(A):- see(A,B),smile(B),not(A=B). %A person will begin smiling if they see another person smiling
laugh(byron). %fact
laugh(patrick). %fact
laugh(ez). %fact
laugh(Z):-energetic(Z). %A person will begin laughing if they are energetic
energetic(vitalik). %fact
energetic(mark). %fact
energetic(castro). %fact
see(loic,vitalik). %fact
see(ben,zapata). %fact
see(patrick,mike). %fact
see(mark,andrew). %fact
see(castro,byron). %fact
see(castro,ez). %fact