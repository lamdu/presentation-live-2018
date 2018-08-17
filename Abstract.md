# Scaling the REPL Experience

The REPL (Read-eval-print loop) is an invaluable tool used by many programmers to great satisfaction.
It shines best for programming in the small, but when programming in the large, developers rarely use it, with systems languages such as Go and Rust not even offering a REPL.

We have identified three reasons for why the REPL doesn't currently suit programming in the large:

* "Bandwidth": For each expression evaluated in the REPL, it only produces its final result. The size of REPL's output bears no resemblance to the size of input program.
* "Liveness": When the input program changes, the REPL's results still reflect its previous states, requiring the programmer to remember when each result was computed, increasing the mental burden and potentially causing confusion. IDEs that solve this with live-reloading risk executing incomplete effectful programs, which may have undesirable, and in some cases even dangerous side-effects.
* "Availability": The programmer cannot use incomplete modules in the REPL (modules containing syntax errors, type errors, etc), but these are usually the states when the REPL's feedback would be most valuable.

Lamdu is a live-programming projectional IDE with a statically typed purely functional programming language, which we are developing. We describe how it embodies these solutions to the problems listed above:

* Bandwidth is improved with value annotations under all evaluated sub-expressions, both in the REPL line and in the used functions themselves.
* Liveness is achieved by using a distinction between pure computations and effectful code, and using live-reloading only for the computations, while requiring an explicit user action to execute effectful code.
* Availabilty is enabled by localizing type errors and by using projectional editing. Instead of the user freely editing text which the compiler then has to interpret, the code always has a valid structure, even when it is incomplete. While traditionally projectional editors had unintuitive user interfaces with steep learning curves, Lamdu's interface is designed to retain the intuitive interface of text editing according to the WYTIWIS principle: What You Type Is What You See.
