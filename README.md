# GPXConv

GPX track converter: post-process routes and tracks typically produced by GPS loggers.

* Reports missing data and ignores points containing non-plausible data.
* Optionally fills in elevation and time data by interpolation within segments.
* Optionally interpolates points in long gaps (by default, > 3600 seconds).
* Optionally corrects elevation and sanitizes and smoothens tracks.
  (Orthometric height = GPS ellipsoidal height - geoid height,
  see http://www.unavco.org/edu_outreach/tutorial/geoidcorr.html)
* Produces statistics, including ascent/descent rates of climbing phases.
* Reads from file(s) given as argument (or STDIN) and writes to STDOUT.
* Prints information (if enabled), any warnings (if enabled), an errors to STDERR.

Usage:
```
  gpxconv <option(s) and infile(s)> [> <outfile>]
```
Command-line options:
```
  -walk, -cycle, -drive, -fly  - type of recorded activity, default: drive
  -smooth                      - smoothen tracks
  -phases                      - analyze ascent/descent phases
  -begin <time>                - ignore points before given time
  -end <time>                  - ignore points after given time
  -max <field> <limit>         - ignore points with field value above limit
  -prune_wpts                  - remove waypoints
  -prune_exts                  - remove track, waypoint, and trackpoint extensions
  -nw                          - do not print warnings
  -ni                          - do not print information
  -o <outfile>                 - output the resulting track to <outfile>
```
Other options can be set by changing values of the configuration variables.

