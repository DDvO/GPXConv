# GPXConv

GPX track converter: post-process routes and tracks typically produced by GPS loggers.

* Reads from file(s) given as argument (or STDIN) and writes to STDOUT or a file.
* Can append segments from multiple tracks and files (sequential composition).
* Can complete gaps in input file(s) by merging data from an alternative GPX file (parallel composition).
* Concatenates all given tracks (or routes) preserving segments, collecting waypoints.
* The metadata (header) of the first input track is used for the output track.
* Reports missing data and by default ignores points containing implausible data.
* Optionally filters out points before or after given time limits.
* Optionally filters out points with an element value below or above given limits.
* Optionally prunes comments, extensions, or elements with value below or above given limits.
* Optionally fills in alitude and time data by interpolation within segments.
* Optionally interpolates points in long gaps (by default, > 3600 seconds).
* Optionally corrects elevation and and smoothens tracks.
  (Orthometric height = GPS ellipsoidal height - geoid height,
  see http://www.unavco.org/edu_outreach/tutorial/geoidcorr.html)
* Produces statistics, optionally including ascent/descent rates of climbing phases.
* Optionally produces additional statistics on a per-segment or per-day basis.
* Optionally calculates approx. total energy spent by biking along the resulting track.
* Prints information (if enabled), any warnings (if enabled), and errors to STDERR.

Usage:
```
  gpxconv <option(s) and infile(s)> [> <outfile>]
```
Command-line options:
```
  -walk, -cycle, -drive, -fly  - type of recorded activity, default: drive
  -smooth                      - smoothen tracks
  -phases                      - analyze ascent/descent phases
  -segs <n>                    - produce additional statistics per segment, start with n
  -days <n>                    - produce additional statistics per day, counted from n
  -weight <value>              - calculate biking energy for given weight in kg
  -begin <time>                - ignore points before given time
  -end <time>                  - ignore points after given time
  -max <name> <limit>          - ignore points with element value above limit
  -min <name> <limit>          - ignore points with element value below limit
  -max_ext <name> <limit>      - prune extension elements with value above limit
  -min_ext <name> <limit>      - prune extension elements with value below limit
  -prune_wpts                  - remove waypoints
  -prune_cmts                  - remove comments
  -prune_exts                  - remove track, waypoint, and trackpoint extensions
  -nw                          - do not print warnings
  -ni                          - do not print information
  -o <outfile>                 - output the resulting track to <outfile>
```
Other options can be set by changing values of the configuration variables.

