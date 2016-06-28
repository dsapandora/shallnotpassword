# Spec

What is the spected output ?
a strenght value  that mean the password strenght 
and a message that display if is strong, week, or unnaceptable


The password strenght is calculated based in the updated string 
word count multiple by the character type count present in the string.


The hard part is detect the english word. For that reasons I will implement the 
following solution. 

1. Replace non letters for white space
2. Split the words in white spaces.
3. Check if the word element is an english word, and create a list of the english word detected.
4. Replace this word in the string by the first letter of that word.
5. Do a word count
6. Check for the representative characters type
7. Determinate the strengh

