# Slacker
Class made for external thread activity control

# Elaboration

Slackers are essnentially external thread controllers — what I mean by this is that they can allow for threads to resume external threads outside of their reach. Slackers have two methods: `await` and `fulfill`. One function yields/pauses the thread in current use and the other reactivates the yielded thread, respectively. An example of this can be seen in the figure below:

```lua
local slacker = Slacker.new()

task.spawn(function()
  slacker:await() -- Pauses the thread until `fulfill` is called
  print("5 seconds have passed")
end)

task.spawn(function()
  task.wait(5)
  slacker:fulfill() -- Resumes the thread
end)
```

Get the jist? Also, there can be as many threads waiting to be fulfilled as you'd like, so do not fret about limits; and it should be noted that Slackers work on any environment — including the global — since Scripts are actually ran on threads!
