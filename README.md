# README
## Oystercard project. 

### Step 1
Setup project directory, create GitHub repo and link project directory/git/github.
This part is fairly familliar now so I have done it with minimal trouble/assistance although did need Kate to help with "git clone" vs "git remote add origin ...SSH code thing..."

Done

### Step 2
Create GemFile &c

run "gem list"
check if 'bundler' is there
run bundle init - creates empty gemfile ready for me to add info to.
 - added info as per Kate's research (while I was away) should research this a little myself.\

 run "bundle"
 
 - adds gemfile.lock to project dir.

Done

### Step 3
Create file that has the spec naming convention (in the spec file etc.)
prepare first rspec test
run code to pass this test
#### GREEN

### Step 4
attr_reader :variable (list any extra variables after, by comma)\
this makes a 'window' in the object that allows other objects to see inside and 'read' the value of a/the specified variable. \
poke around online/google/relish for resources to help with rspec syntax when forming the tests. It's important to have the test run correctly so that we know the 'failure' is to do witht the code failing, not the rspec being written incorrectly. 

#### User story
```
In order to use public transport\
As a customer\
I want money on my card\
```

complete; can now see money on card. (at the moment it's only £0.00)

-refactored.

### Step 5