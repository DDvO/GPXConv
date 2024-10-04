#!/bin/bash

gpxconv test_minimal.gpx  >test_minimal.out  2>test_minimal.log; diff test_minimal{_reference,}.out; diff test_minimal{_reference,}.log
gpxconv test_minimal.out  >test_minimal.out2 2>test_minimal.log2
gpxconv test_minimal.out2 >test_minimal.out3 2>test_minimal.log3; diff test_minimal.out{2,3};  diff test_minimal.log{2,3}

export GPXCONV_TEST_ARGS="-walk -min_ext value 101 -max_ext value 101 -smooth -weight 50 -phases -segs 2..4+100"
gpxconv $GPXCONV_TEST_ARGS test.gpx  >test.out  2>test.log; diff test{_reference,}.out; diff test{_reference,}.log
gpxconv $GPXCONV_TEST_ARGS test.out  >test.out2 2>test.log2
gpxconv $GPXCONV_TEST_ARGS test.out2 >test.out3 2>test.log3; diff test.out{2,3};  diff test.log{2,3}
