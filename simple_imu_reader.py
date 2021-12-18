#!/usr/bin/env python3

import sys, os, time
import zero_cm as ZCM


sys.path.insert( 0, os.path.dirname( os.path.realpath( __file__ ) ) + "/zcm_types/py/" )

from ZcmOrientusNavGw import ZcmOrientusNavGw


zcm = ZCM.ZCM("ipc")
if not zcm.good():
    print( "Unable to initialize zcm" )
    exit()


def imu_msg_handler( channel, msg ):
    print( "timestamp: " + str( msg.service.timestamp ) )


subs = zcm.subscribe( "imu_orientus/base", ZcmOrientusNavGw, imu_msg_handler )

zcm.start()

while zcm.good():
    time.sleep(1)

zcm.unsubscribe(subs)
zcm.stop()
