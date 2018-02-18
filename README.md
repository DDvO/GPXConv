# GPXConv
GPX track converter to post-process tracks as typically produced by GPS loggers

Concatenates multiple tracks preserving track segments, collecting waypoints.

Optionally sanitizes and smoothens trackpoints, and corrects elevation.

(Orthometric height = GPS ellipsoidal height - geoid height,
  see http://www.unavco.org/edu_outreach/tutorial/geoidcorr.html)

Produces statistics, including ascent/descent rates of climbing phases.

Usage: gpxconv infile(s) >outfile

Options can be set by changing values of the configuration variables below.

Reads from file(s) given as argument (or STDIN) and writes to STDOUT;
                            prints any warnings and errors to STDERR
