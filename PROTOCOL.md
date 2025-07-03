# Client-Server Protocol
Clients can send an http message (options below) to treeplate.damowmow.com/depadeka_server/main.dart, and the server will respond.
## General format
The first line is the command, and after that are the arguments.
## get-board
The only argument is the name of the board, currently the options are `just_white` and `start`.
This responds with a board, as described in [DPDK.md], or "error".