# Scaling the REPL Experience

Hi!
I'm Yair, and I want to show you how we tackle the problem
of making the REPL more useful for writing
large statically typed programs.

Many programmers love the REPL!
It provides validation, useful feedback,
it's an excellent learning tool,
and in some cases it even provides program output -
obviating the need to build a full application.

But, many "real" programmers don't often use the REPL,
or even don't use it at all.
In fact, some major programming languages like
Go, Rust, and C++ don't offer a REPL.
And until recently, Java and C# were also on that list.

Why is that?
We believe that partly it's because the REPL experience
doesn't scale well when writing large programs.

We have identified three main challenges in scaling the REPL.
Bandwidth, Liveness, and Availability.

What do we mean by "Bandwidth"?
He're we're looking at a faulty factorial implementation
in a Python Jupyter Notebook.
The REPL only shows the expression's final result.
When evaluating many small expressions, that's perfectly fine,
but when writing larger pieces of code,
the programmer would spend most of the time
editing their functions and modules
and wouldn't get much feedback from the REPL,
which doesn't expose their code's inner working anyway.

For brevity, we won't show large pieces of code.
We'll try to convey the ideas with small examples like this one,
where the only thing we see is that the result is wrong.

This is like trying to figure out the problem in a complex machine
when you can only look at it through a peep-hole.

What programmers often do in this situation is use a debugger,
which is generally percieved as a frustrating experience.
We can think of using the debugger as
being able to move the tiny peep-hole.
We can get more information and
eventually we might figurate out what's going on,
but it's not easy to see the full picture.

Another mechanism people use is debug prints,
which are also a clunky process.

We want to show you how Lamdu solve's this problem.
Let's start by familiarizing ourselves with Lamdu's syntax.

This is factorial implemented in Lamdu.
Like in Haskell or ML, functions are defined as equations,
mapping to a value on the right hand side
without any return statements.
And the function applications is just
the function and the argument seperated by a space.
The if-statement's branches are preceded by small vertical lines
denoting that they are not always evaluated.
Ok, now we can resume.

The top line is the REPL.
Note the grey rectangle under the REPL -
this is its result annotation.
But that's not the only result we see.
We have annotations for all evaluated subexpresssions.
The programmer can also browse between
different invocation scopes of the same function.

This replaces debug prints and invocations of the debugger.
It's easier to spot the problem this way.

Note that you don't always want to see your code
cluttered by all these annotations.
You can toggle them as you want.

These annotations are our solution to the bandwidth problem.
Instead of looking through a tiny peep-hole
we can see the complete picture.

Now that the bandwidth issue is resolved,
what do we mean by "Liveness"?

If you will look for the bug in this factorial function
you're going to have a hard time,
because it doesn't have one.
The REPL is simply showing the stale results
from before the problem was fixed.

This problem has a seemingly simple solution -
Live Reloading.
Re-evaluate the expressions when the code changes.
But this solution could be dangerous.

We'll demonstrate this issue with Swift:
While editing his program
the programmer makes a small mistake.
With this one typo he causes
the "launch nukes" procedure to be accidentally fired.

What can we do to avoid this problem?
If the programming language makes a
distinction between pure computations and actions,
like Haskell does.

The IDE could automatically evaluate
only the programmer's pure computations,
and require an explicit action from the user
to execute effectful code.

Let's see how this approach looks like in Lamdu:
Here is a program performing actions -
reading a file and writing its contents twice back to it.
But unlike the calculations we've seen before,
it's not executed.
Execution of actions is only performed
when explicitly invoked by the programmer.
Note that when the programmer edits the program,
the outdated results disappear.

After having faced the Bandwidth and Liveness problems,
let's resume to the remaining problem
and explain what we mean by "Availability".

Back in Swift:
A programmer is implementing a factorial function.
Stumbled, he wants to check something in the REPL.
The REPL isn't available because the program has a syntax error.
So the programmer goes to fix the problem.
Note that in other languages like Python
the REPL would be available,
but using the faulty module wouldn't be.
When the syntax is ok
the compiler can tell us about other types of errors.
To sum it up,
the REPL is only available when there are no errors in the code.
This is what we call the "Availability problem".

We're going to demonstrate how it works in Lamdu:
The programmer is in the middle of programming factorial in Lamdu.
Stumbled, he goes to the REPL to check something.
The type mismatch in "factorial" doesn't pose a problem.
The REPL can even evaluate incomplete functions.
Only when the evaluated branch has an error a result isn't available.
This covers "Availability".
But how can Lamdu evaluate code
in the face of syntax errors or type errors?

Let's discuss syntax errors first.
Lamdu is designed to solve the problem of syntax errors in a radical way:
To erase them from existence.
What does that mean?
Lamdu is not a free-form text editor.
It is a projectional code editor where
the options offered to the coder simply don't include syntax errors.

Now for type errors.
Let's talk about this type error we saw before.
A potato might be a good source for nutrition,
but factorial expects a number.
When typing a text literal into what should be a number,
Lamdu inserts a "fragment" into the program,
which represents the type mismatch.
It is visualized by the red rectangle,
accompanied by the type in the fragment and the expected type.
It contains the type mismatch and allows type inference
to still work everywhere, without type errors.

So availability is achieved by using Projectional Editing,
and localizing type errors.
But this solution may introduce a new problem:
We have departed from text editing,
which is the way that programmers have been editing their programs
for half a century.
It is intuitive, predictable, and familiar to all.
These advantages of text editing, stem from one core principle:
What You Type Is What You See, or: WYTIWYS.

Modern IDEs augment this basic interface with some enhancements:
Automatic code completion, indentation, and more.
These enhancments were carefully designed to retain the WYTIWYS feel.

Traditionally, projectional editors deviated from the WYTIWYS principle.
For example, let's see how writing factorial works in
Alfa, a projectional editor for the Agda language.

Alfa requires us to enter the code from the outside in,
in this case we would need to remove the "x" before
we can replace it with something else.
Then we have to choose the multiplication first.
And only then do we fill in the two arguments.
Not as straight-forward as using a text editor.

We're going to demonstrate coding the Fibonacci sequence in Lamdu.
Before we do let's just overview how it looks like in Haskell,
a textual functional programming language,
which we also use to implement Lamdu.
"Fibonacci" uses the "iterate" function to
apply a step iteratively on a pair,
resulting in an infinite list of pairs.
We map over it to take the first item of each pair.

In the REPL at the bottom,
we use it with the "take" function to view
the first 10 items of the Fibonacci sequence.

Now let's write the same in Lamdu:
The REPL starts as a hole to be filled in.
We start typing "iterate".
After four letters it is already the first completion,
and we also see in it in green
where the cursor will go when we choose it.
Typing a curly brace will create a record at the green position.
Typing any letter will now name the first field.
Unlike Haskell, we use records rather than anonymous tuples.
Hitting space will move the field's value.
Pressing 1 enters the number 1.
Pressing comma adds a field.
Note that like in text editing,
the projected syntax consists of the text typed to code it,
including symbols such as curly braces and commas.
We name the second field and press space.
0 to enter the number 0.
Now let's look at the lambda function we have as the "next" argument.
A lambda function was already filled in when we chose iterate,
and its input and output types are
inferred to match our initial value.
In Lamdu, multiple parameters and a parameter record are the same thing,
so the lambda is displayed as getting two parameters - "prev" and "cur".
The dark rectangle under the hole within is its type annotation.
Lamdu displays inferred types for holes.
Now, by pressing space we will move to this hole.
Pressing space now will pick the first result,
which is a record with the desired shape.
Now we type "cur+prev" - it works like text editing.
How did it work?
When pressing an operator while filtering hole results
with an alpha-numeric search-string,
the result is picked and the operator is applied at the appropriate position
according to the operator's order of precedence.
Typing alpha-numeric characters after the operator,
set the search-string at the hole at its other argument.
We'll now press space to pick this result and move to the next hole.
We'll type "cur" and pick it with space.
What just happend to the lambda?
It is now displayed with a lightweight syntax sugar,
with an underlined lambda symbol and with
the parameters underlined where they are used.
But why did the lambda change to be displayed in this form?
This is because of Lamdu's "Projectional Syntactic Sugar".
And code that matches the pattern
gets displayed with the appropriate sugar.
With the UI still retaining all the edit abilities
of the unsugared syntax.
When enabling type annotations we see that we have a stream of pairs.
When we enable evaluation we see the value of the first pair.
Why only the first one?
Because Lamdu's "Stream"s are similar to Java's iterators.
To see more values, we can fill an array with them.
Pressing shift-left goes to the parent expression.
We'll make an array of the first pairs
using the functions "take" and "to-array".
We start typing "take".
The stars inside the available transformations
indicated where the transformed expression will go
if we pick this transformation.
We press space to pick the first one.
We now type in ten.
Use shift-left to mark the top level expression.
Start typing "array" and we pick the "to-array" function.
The REPL's value annotation now displays
this array of records as a table.
We actually only want one value from each pair.
We mark the usage of "iterate" and start typing "map".
We press space and now we type "cur" and choose it.
In the value annotation of the REPL
we now see the first 10 itmes of the Fibonacci sequence.
Without the annotations the code is more clear,
that's why they are optional.
We'll now mark the expression for
the infinite stream of Fibonacci numbers,
and extract it by pressing command-X.
It is not a let-item.
We name it "fibonacci".
We'll now use command-X to move it to the outermost scope.

To conclude:
Our solution to the UI challenge is:
What You Type Is What You See.
To sum it up -
Lamdu's solution to scaling the REPL experience is
using subexpression annotations for bandwidth,
live reloading of pure computations for liveness,
and WYTIWIS projectional editing
with localized type errors for availability.
These are the concepts.

But the devil is in the details.
In Lamdu we try to not just demonstrate the ideas
but to create an actual useful implementation that embodies them.
We're not quite there yet but we're working on it.
Lamdu is an open source project
that I develop together with Eyal Lotem.
And if you want to help us, join us, or collaborate with us,
you're most welcome!
That all for now :)
