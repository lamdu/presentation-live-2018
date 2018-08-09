# Presetation

The context of presenting right now is that we intend to prepare and submit a video presentation to the [LIVE 2018 workshop](https://2018.splashcon.org/track/live-2018-papers) (deadline: 2018.08.17) and need to decide what to present.

The problem is that Lamdu is somewhat challenging to present. Paul Chiusano's [article on incrementalism](https://pchiusano.github.io/2017-05-17/incrementalism.html) expands on this topic quite well.

The gist of the problem is that Lamdu is a big and novel project with many aspects to describe, but it's also essential to keep the presentation focused. We got to this predicament as we've focused more on coding and less on presenting our research, in contrast to academics, who typically continually update on their advances so at any given point in time there is only the recent new material to present.

## Script - Scaling the REPL experience

See also: [Draft video](https://www.dropbox.com/s/80h3b4o9tff59i8/Lamdu%20LIVE%202018%20-%20Intro%20draft.mp4?dl=0)

Many programmers love the REPL (aka Interactive Shell, Notebook, Playgrounds).

It provides validation, useful feedback, it's very useful for learning to code, and in some cases it even produces the actual program results (obviating the need to build a full application).

But the REPL often loses its efficacy when writing larger programs, to the point that many "serious" programming languages such Go, Rust, and C++ don't even bother offering one. Until recently did Java and C# were also on that list.

### How the REPL loses efficacy for larger programs

We identify three problems with scaling the REPL for large statically typed programs:

* Bandwidth
* Liveness
* Availability

#### Bandwidth

(Showing in the background factorial with a bug in Python)

The REPL only displays the final result of the computation.
This doesn't provide much insight into the inner working of the code.

When writing large programs, one would typically be editing their modules for longer periods between invoking the REPL,
resulting in less feedback from the REPL the larger their programs are.

This situation is like trying to understand a large mechanism with many moving parts
by only looking at it through a tiny peep-hole.

Display a peep-hole view of something.
Programmers use tools like the debugger to move the peep-hole, but it is a klunky experience.
Display the peep-hole moving.

We're going to demonstrate how it looks like in Lamdu, but first, let's familiarize ourselves with its syntax.
(explain syntax elements for the factorial function)

Show the value annotations in factorial in Lamdu.

Show the peep-hole again but reveal the full picture.

#### Liveness

The liveness problem is that there often is a discrepency between the edited code and the feedback from the REPL.
The easy way to solve this discrepency is via live-reloading.
But this may cause a new problem - Safety.
We'll demonstrate this problem using Swift.

The programmer fixes a compilation error, but due to a mind burp enters "!=" rather than "==".
Swift automatically runs the code, which triggers a call to the "launchNukes" procedure,
bringing upon the end of the world as we know it.

#### Availability

Let's illustrate this with an example.

Imagine being in the middle writing a new function in one of your modules,
and you happen to want the check something in the repl for what you're currently writing. The following often happens:

* You press the key to invoke the repl with your module loaded
* Computer: I can't load your module because it contains a syntax error here in your new function
* You fix the syntax error and invoke the repl again
* Computer: I understand your syntax, and I now see that you made a name error
* You fix the name error and invoke the repl again
* Computer: Now that I understand what you were referencing, I can see that your types don't match.
* You fix the type errors and invoke the repl again
* Computer: Module loaded successfully. Your wish is my command! What do you want to do now?
* You: I forgot :/

### The REPL in Lamdu

Now let's see how it works in Lamdu:

* Video shows programmer in middle of programming `factorial`
* On the else branch, the programmer typed a string - "Potato". This is a type error as a number is expected.
* The programmer can still go and experiment in the repl. `2*3` - 6
* The programmer types `factorial 0` in the REPL and it works, even though `factorial` contains a type mismatch! As long as it didn't affect the evaluated path there's no problem
* When typing `factorial 2`, evaluation does reach the type error and only then it actually blocks the evaluation.
* Note that we don't only see the final result but we also see the intermediate values, and can navigate between different evaluated scopes too. This is our response to the bandwidth problem

### How does this work - what about syntax errors

Lamdu's approach to syntax errors is radical - eliminate them from existence!
Lamdu is not a free form text editor, but rather a projectional code editor.
This means you can't just type any text you want - you can only type syntactically valid code.
Same goes for name errors.

Wait - I can't just write any text I want?

That's right, but worry not.

## Scenes

Ideas for possible "scenes"/parts which can be used to construct the presentation -

### Textual freedom taken to the absurd

This shtick's goal is to provide the intuition for how complete freedom of textual editing is not needed.

* Present animation of code written in random order (with syntax highlighting)
* Narrate that few programmers program this way
* Extra "funny" video of a finger moving the cursor via the track-bar, then pressing a key, then going back to the track bar etc several times in sequence

### Present an example program

In our [2014 video](#Current-state-vs-our-2014-video) we've coded some toy functions - factorization and fibonacci.

We may still want to code a simple function due to time constraints, but we can also show more "typical" string manipulation situations. Perhaps some string processing as parts of a web server program?

## Current state vs our 2014 video

We've prepared [a video](https://vimeo.com/97648370) for the 2014 Future Programming Workshop.

Many things have changed since then which make things easier to explain:

* Lamdu's graphic design is better and clearer
* We show less types by default. Less things on screen - less to initially explain
* The old complicated "exported type" model is gone. Replaced with a simple model that gets out of the way
* Records as multiple params sugar makes code look more familiar
* We display the setting of which annotation mode is currently selected
* No need to press space to apply a transformation. Can just start typing the operator or function to use
* In general we've reached the WYTIWYS term/concept, which explains succinctly that the interface is simply still just typing text
* No need to delve into the mechanisms of hole results prioritization as Lamdu has a lot of more interesting things to describe now
* Where the previous video emphasized feedback from types, currently one might get more easily understandable feedback via values

Also some things have progressed in the world as well:

* Holes have become familiar and popular in Haskell, Idris, etc.
* Live-reloading has become more popular

## Review similar projects & presentations

Hazel, Unison, and others intend (or originally intended) to develop the same vision that we do, but are much better at communicating their vision. Perhaps we should learn from their presentations. Also we should review our own existing 2014 FPW video.

### Specific essays / possible citations

* Glen Chiacchieri's [Legible Mathematics](http://glench.com/LegibleMathematics/) describes our notation for intermediate value annotations. He arrived at this notation independently (at 2014 when we only had it for types, we added evaluation in 2015).

## Todo

(feedbacks from Eyal, Galya, etc)

* Draw visual attention to wrong answer for factorial (Question mark and arrow)
* "We also see in it in green where the cursor" => "the green hole inside tells us where we'll end up if we select this completion"
* Record examples (Swift, Lamdu) with the bright themes. Remove mouse cursor where not used
* x*"Potato" in both Swift and Lamdu