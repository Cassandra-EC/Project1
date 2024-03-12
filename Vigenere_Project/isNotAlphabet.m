%%TO DETERMINE IF INPUTS ARE ALPHABETICAL 
%No inputs with saces/punctuation; all must be one word, otherwise invalid
%created 3/11/24 Cassandra

function isFalse = isNotAlphabet(inputString)
    %put both plain & key (inputString) in lowercase
    inputString = lower(inputString);

    %match only alphabetical characters, from start to end
    regexPattern = '^[a-z]+$'; %CHANGE THIS TO FIT ASCII 
    
    %isFalse if any characters are not alphabetical
    isFalse = isempty(regexp(inputString, regexPattern, 'once')); %any non-matches returns ~true [i.e. false]

end

