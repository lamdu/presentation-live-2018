# Presetation ideas

The context of presenting right now is that we intend to prepare and submit a video presentation to the [LIVE 2018 workshop](https://2018.splashcon.org/track/live-2018-papers) (deadline: 2018.08.17) and need to decide what to present.

The problem is that Lamdu is somewhat challenging to present. Paul Chiusano's [article on incrementalism](https://pchiusano.github.io/2017-05-17/incrementalism.html) expands on this topic quite well.

The gist of the problem is that Lamdu is a big and novel project with many aspects to describe, but it's also essential to keep the presentation focused. We got to this predicament as we've focused more on coding and less on presenting our research, in contrast to academics, who typically continually update on their advances so at any given point in time there is only the recent new material to present.

## Topics/Storylines

Options for the main idea to present (many are similar but with different emphasis) -

### Bridging the gap between the REPL and "real programming"

Many programmers love the REPL (aka Interactive Shell, Notebook, Playgrounds).
It provides useful feedback, validation, and actual results.

But the REPL somewhat loses its efficacy when writing larger programs, to the point that many "serious" programming languages such Java, Rust, and C++ didn't even bother creating one.

How exactly does the REPL become less effective for large programs?
Let's illustrate this with an example.

Imagine being in the middle writing a new function in one of your modules,
and you happen to want the assistance of the repl for what you're currently writing.
The following process happens:

* You press the key to invoke the repl with your module loaded
* Computer: I can't load your module because it contains a syntax error here in your new function
* You fix the syntax error and invoke the repl again
* Computer: I can't load your module because it has a name error (I can attempt name resolution now that I understand the syntax)
* You fix the name error and invoke the repl again
* Computer: I can't load your module because it has type errors (now that I understand the syntax and resolved the names I can do type-checking)
* You fix the type errors and invoke the repl again
* Computer: Module loaded successfully. What do you want to do now?
* You: I forgot :/

### Dynamic languages, static languages, and the best of both worlds

Some programmers choose dynamic programming languages, along with their interactive REPLs which provide programmers with useful feedback.

Some prefer static programming langauges for the essential feedback their type systems provide.

Others suggest to "just use the right tool for the job", with the common notion being that dynamic languages are often a better fit for smaller programs and experimentation, while static languages are a better fit for larger programs.

Can a programming language to offer the best of both worlds?

#### Current state of REPLs for static languages

There are environments that provide REPLs for static languages, such as Apple's Swift Playgrounds, ghci, and others.

In these environments, the REPL is to some extent a second class citizen to the type system - a module containing a type error in any function or dependency cannot be imported and tested in the REPL at all.

In essence there's a sort of modality for the different forms of computer feedback:

* To enjoy the REPL (or live-reloading), first fix all the type errors
* To get type errors, make sure that there are no name errors
* To get the name errors, fix all syntax errors in the code

#### Is there a better way to combine REPLs and type systems

**Goal**: To provide all possible forms of feedback at all times

Type information should be available at all times, (undisturbed by syntax or name errors), and evaluation should be available wherever possible. A type mismatch should not affect the ability to evaluate unrelated code paths.

First we'll demonstrate the experience and then we'll expand further on what makes it work.

#### Demonstrate Lamdu

**TODO**: Demonstrate type mismatches and blame assignment in and across definitions (which serve as membranes for typing propagation)

#### How it works

Lamdu's approach for syntax errors is quite radical - eliminate them. To achieve this, one must detach from the prevalent notion that code is stored as text files, and opt for Projectional programming.

"Projectional" means that the program is stored as a data structure in memory, which the IDE "projects" into a human-friendly interface.

One big advantage of the textual interface for programming is that it is intuitive and natural to learn and use - you just type the letters symbols for the program you want to see and it appears on screen. We call this WYTIWYS (what you type is what you see). A common caveat of projectional editors is lacking this intuitive interface, but there's no essential contradiction. Lamdu's interface is WYTIWYS.

**TODO**: Complete

### Improvement upon IDEs

Modern programming has become a cooperation between the programmer and the computer, with the computer providing useful feedback in multiple communication channels, specifically:

* REPL and live-reloading
* Type-checking

#### Problem

These are very useful, but unfortunately only work intermittently:

* None of the code will run when even a single part of it does not type-check
* Type errors are often over-complicated

**Goal**: To provide immediate and useful feedback at all times

#### Solution

How do we intend to tackle this goal? Formalize the intermediate and incomplete states of editing a program.

* Feedback should work reliably even when the program is incomplete
* The model should allow for editing naturally as programmers currently do

For this we have to depart from freely editing text. At first glance this might seem like a big problem, as text editing is a very intuitive and easily learnable interface. It turns out that the [full freedom of text](#Textual-freedom-taken-to-the-absurd) is not necessary, and we can create a text-like WYTIWYS interface that feels very natural.

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
