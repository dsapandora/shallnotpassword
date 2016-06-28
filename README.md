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


#Requirements

#MacPorts:

```port install aspell aspell-dict-en```
#Homebrew:

```brew install aspell --lang=en```

#Ubuntu:

```apt-get install aspell libaspell-dev aspell-en```
#Installation

Mac:

```gem install raspell -- --with-opt-dir=/opt/local```
##Ubuntu:

```gem install raspell```


##Twitter Client
I was just lazy to make the request by my own.

```gem install twitter```

Before you run the application you need to set you twitter enviroment variables:
```
consumer_key:    ENV["YOUR_CONSUMER_KEY"],
consumer_secret: ENV["YOUR_CONSUMER_SECRET"],
access_token: ENV["ACCESS_TOKEN"],
access_token_secret: ENV["ACCESS_TOKEN_SECRET"]
```
I suggest to use export, but you can placed in the code direclty is your business.

To get this credentials you must create a twitter app in *https://apps.twitter.com*
To run the script just 

```# validation_algorithm.rb```

Output example:
```
@lacedbiebs Congratulations!!! your password is Strong.@supermansgiirll The pasword is Week, we should reply you a new one when the feature is ready.@AntoniaMliakova Congratulations!!! your password is Strong.%  
```
**Poor girls**
