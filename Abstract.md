# Scaling the REPL Experience

The REPL (Read-eval-print loop) is an invaluable tool used by many programmers to great satisfaction.
It shines best for programming in the small, but when programming in the large, developers rarely use it, with systems languages like Go and Rust not even offering a REPL.

We have identified three reasons why the REPL doesn't currently suit programming in the large, which we have titled "Bandwidth", "Liveness", and "Availability".

We describe these problems, and also offer a solution to each one, which we demonstrate in Lamdu. Lamdu is a live programming projectional code editor with a statically typed purely functional programming language, which we are developing.
