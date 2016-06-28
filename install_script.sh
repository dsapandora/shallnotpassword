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
```validation_algorithm.rb```

Output example:
```
@lacedbiebs Congratulations!!! your password is Strong.@supermansgiirll The pasword is Week, we should reply you a new one when the feature is ready.@AntoniaMliakova Congratulations!!! your password is Strong.%  
```
**Poor girls**
