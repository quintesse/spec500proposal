# Proposal for spec issues 499 and 500

This repo contains a small example to test the code available on the "spec500proposal" branches of the Ceylon repository.

Make sure to checkout the "spec500proposal" branch of the following repositories:

 - ceylon/ceylon-spec
 - ceylon/ceylon-compiler
 - ceylon/ceylon-js

Build the distribution (you know, run `ant clean publish ide-quick` in "ceylon-dist").

After that is done you can run the following command in the root of this project:

    $ ceylon run --compile=force backends
    $ ceylon run-js --compile=force backends

You should get different output for both.
