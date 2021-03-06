# SPDX-License-Identifier: BSD-3-Clause
# Copyright 2014-2018, Intel Corporation
#
#
# pmempool_dump/TEST0 -- test for dump command
#

. ..\unittest\unittest.ps1

require_test_type medium

require_fs_type any

setup

$POOL="$DIR\file.pool"
$LOG="out$Env:UNITTEST_NUM.log"

rm $LOG -Force -ea si

expect_normal_exit $PMEMPOOL create log $POOL
expect_normal_exit $PMEMWRITE $POOL TEST
expect_normal_exit $PMEMPOOL dump -b -o $LOG $POOL
echo "" | out-file -encoding ASCII -append -literalpath $LOG
expect_normal_exit $PMEMPOOL dump -b $POOL | out-file -encoding ASCII -append -literalpath $LOG

check

pass
