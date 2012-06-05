%################################################
% Author: Weston Neal
% Date: 6/5/2012
% Desctipion: 
%    Day 1
%################################################

% Find some free Prolog tutorials
% http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html

% Find a support forum
% http://old.nabble.com/Gnu---Prolog-f1818.html

% Find one online reference for the prolog version you are using
% http://www.gprolog.org/manual/gprolog.html

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Make a simple knowledge base. Represent some of your favorite books and authors.
book(j_k_rowling, harry_potter_and_the_sorcerers_stone).
book(suzanne_collins, hunger_games).
book(suzanne_collins, catching_fire).
book(suzanne_collins, mockingjay).
book(harper_lee, to_kill_a_mockingbird).

% Find all books in your knowledge base written by one author.
% book(Author, _). This will return each set of books by one author

% Make a knowledge base representing musicians and instruments. Also represent musicians and their genre of music.
musician(tosin_abasi, guitar).
musicalGenre(tosin_abasi, progressive).

musician(matt_garstka, drums).
musicalGenre(matt_garstka, progressive).

musician(javier_reyes, guitar).
musicaGenre(javier_reyes, progressive).

% Find all musicians who play the guitar.
% musician(Name, guitar).
