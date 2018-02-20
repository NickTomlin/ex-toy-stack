# Stack [![Build Status](https://travis-ci.org/NickTomlin/ex-toy-stack.svg?branch=master)](https://travis-ci.org/NickTomlin/ex-toy-stack)

A toy GenServer "stack" from an assignment in ["Programming Elixir 1.3"](https://pragprog.com/book/elixir13/programming-elixir-1-3)

Run a few very high level tests via

```
mix test
```

OR manually:

```
iex -S mix

# ensure everything is running
:sys.get_status Stack.Worker

Stack.Worker.push(1)
{:ok}

:sys.get_status Stack.Worker
# State should eq [1]

Stack.Worker.pop
1

Stack.Worker.pop
# This will blow up, but your your state will be the same
# thanks to Stack.Stash and the handy terminate callack in Stack.Worker
# push away!
```

## Why — for the love of all that is good — are you posting this on Github? It adds _nothing_

So I have something to say for myself after spending a day reading about OTP when I could have been reading poetry or making [Chocolate Tahini Brownies](https://www.bonappetit.com/recipe/gluten-free-chocolate-tahini-brownies).
