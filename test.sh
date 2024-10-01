#!/bin/bash

gpxconv test_minimal.gpx >test_minimal.out  2>test_minimal.log; diff test_minimal{_reference,}.out; diff test_minimal{_reference,}.log
gpxconv test_minimal.out >test_minimal.out2 2>test_minimal.log
mv -f test_minimal.out{2,}
gpxconv test_minimal.out >test_minimal.out2 2>test_minimal.log2; diff test_minimal.out{,2};  diff test_minimal.log{,2}

gpxconv test.gpx -walk -min_ext value 101 -max_ext value 101 -smooth -weight 50 -phases -segs 2..4+100 >test.out  2>test.log; diff test{_reference,}.out; diff test{_reference,}.log
gpxconv test.out -walk -min_ext value 101 -max_ext value 101 -smooth -weight 50 -phases -segs 2..4+100 >test.out2 2>test.log
mv -f test.out{2,}
gpxconv test.out -walk -min_ext value 101 -max_ext value 101 -smooth -weight 50 -phases -segs 2..4+100 >test.out2 2>test.log2; diff test.out{,2};  diff test.log{,2}
