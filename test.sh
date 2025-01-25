#!/bin/bash

echo -e "\n### test_minimal ###################################################"
gpxconv -info_wpts -warn_wpts test_minimal.gpx  >test_minimal.out  2>test_minimal.log;
    diff test_minimal{_reference,}.out;
    diff test_minimal{_reference,}.log
gpxconv test_minimal.out  >test_minimal.out2 2>test_minimal.log2
# 3rd iteration should not lead to changes compared to 2nd one:
gpxconv test_minimal.out2 >test_minimal.out3 2>test_minimal.log3;
    diff test_minimal.out{2,3};
    diff test_minimal.log{2,3}

echo -e "\n### test, initial pass #############################################"
export GPXCONV_TEST_ARGS="-walk -min_ext value 101 -max_ext value 101 -smooth -weight 50 -phases -segs 2..4+100"
gpxconv $GPXCONV_TEST_ARGS test.gpx  >test.out  2>test.log;
    diff test{_reference,}.out;
    diff test{_reference,}.log
gpxconv $GPXCONV_TEST_ARGS test.out  >test.out2 2>test.log2
# 3rd iteration should not lead to changes compared to 2nd one:
echo -e "\n### test, after two iterations #####################################"
gpxconv $GPXCONV_TEST_ARGS test.out2 >test.out3 2>test.log3;
    diff test.out{2,3};
    diff test.log{2,3}

echo -e "\n### test_sanitization ##############################################"
gpxconv -src_wpts corrected test_sanitization.gpx >test_sanitization.out 2>test_sanitization.log;
    diff test_sanitization{_reference,}.out;
    diff test_sanitization{_reference,}.log

echo -e "\n### test_merge #####################################################"
gpxconv -cmt_wpts alternative test_merge1.gpx -merge test_merge2.gpx -days -lean_stat_wpts >test_merge.out 2>test_merge.log;
    diff test_merge{_reference,}.out;
    diff test_merge{_reference,}.log
