# Presetation ideas

The context of presenting right now is that we intend to prepare and submit a video presentation to the [LIVE 2018 workshop](https://2018.splashcon.org/track/live-2018-papers) (deadline: 2018.08.17) and need to decide what to present.

The problem is that Lamdu is somewhat challenging to present. Paul Chiusano's [article on incrementalism](https://pchiusano.github.io/2017-05-17/incrementalism.html) expands on this topic quite well.

The gist of the problem is that Lamdu is a big and novel project with many aspects to desribe, but it's also essential to keep the presentation focused. We've got to this predicament as we've focused more on coding and less on presenting our research, in contrast to academics, which typically continually update on their advances so at any point there is only the recent new material to present.

## Topics/Storylines

Options for the main idea presented -

### Improvement upon IDEs

#### Preface

Modern programming has become a cooperation between the programmer and the computer, with the computer providing useful feedback in multiple communication channels, specifically:

* REPL and live-reloading
* Type-checking

#### Problem

These are very useful, but unfortunately it works in gaps:

* When there are syntax errors the compiler cannot understand the program. No feedback at these states
* None of the code will run when even a single part of it does not type-check
* Type errors are often over-complicated

**Goal**: To provide immediate and useful feedback at all times

#### Solution

How do we intend to tackle this goal? Formalize the intermediate and incomplete states of editing a program.

* Feedback should work reliably also when the program is incomplete
* The model should allow for editing naturally as programmers currently do

For this we have to depart from freely editing text. At first glance that might seem like a big problem, as text editing is a very intuitive and easily learnable interface. It turns out that the [full freedom of text](#Textual-freedom-taken-to-the-absurd) is not necessary, and we can create a text-like WYTIWYS interface that feels very natural.

## Scenes

Ideas for possible "scenes"/parts which can be used to construct the presentation -

### Textual freedom taken to the absurd

This shtick's goal is to provide an intuition that the complete freedom of textual editing is not needed.

* Present animation of code written in random order (With syntax highlighting)
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
* In general we've reached the WYTIWYS term/concept, which explains succintly that the interface is simply still just typing text
* No need to delve into the mechanisms of hole results prioritization as Lamdu has a lot more interesting things to describe now
* Where the previous video emphasized feedback from types, currently one might get more easily understandable feedback via values

Also some things have progressed in the world as well:

* Holes have become familiar and popular in Haskell, Idris, etc.
* Live-reloading has become more popular

## Review similar projects & presentations

Hazel, Unison, and others intend (or originally intended) to develop the same vision that we do, but are much better at communicating their vision. Perhaps we should learn from their presentations. Also we should review our own existing 2014 FPW video.

### Specific essays / possible citations

* Glen Chiacchieri's [Legible Mathematics](http://glench.com/LegibleMathematics/) describes our notation for intermediate value annotations. He arrived at this notation independently (at 2014 when we only had it for types, we added evaluation in 2015).
