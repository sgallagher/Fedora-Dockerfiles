dockerfiles-fedora-memcached
========================

Fedora dockerfile for Review Board.

Get the version of Docker:

    # docker version

To build:

Copy the sources down and edit setup-reviewboard.sh, then run:

    # docker build -rm -t <username>/reviewboard .

To run:

    # docker run -d -p 80:80 <username>/reviewboard

Test:

Connect via a web browser to the Review Board host address.
