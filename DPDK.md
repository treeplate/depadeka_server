line 1:
- the turn number (starting with 1)
- w for white or b for black
- a space
- all the possible move types left:
  - n: non-monarch movement
  - t: rotate (turn)
  - m: monarch movement
  - r: recovery tile (there can be two of these)
  - p: place resource on your row
  - 8: place resource on middle row (row 8)
  - 4: place piece from cementary on 4 tile of queue (there can be two of these)

each following line:
- one or two characters representing a piece-orientation combo (^A is upleft, A^ is upright, A_ is downright, _A is downleft, AA is up, A> is right, AV is down, A< is left)
- w for white or b for black
- a space
- a space separated list of squares (in typical notation of a1 for bottom left, m15 for top right, a0-m0 and a16-m16 being the revival squares, below 0 and above 16 being the cementary)