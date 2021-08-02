#!../../bin/linux-x86_64/MKS660

## You may have to change MKS660 to something else
## everywhere it appears in this file

< envPaths

cd ${TOP}

## Register all support components
dbLoadDatabase "dbd/MKS660.dbd"
MKS660_registerRecordDeviceDriver pdbbase

#MKS660
asynSetAutoConnectTimeout(1.0)
drvAsynIPPortConfigure( "MKS660One", "10.112.136.74:4001 tcp", 0, 0, 0 )
drvAsynIPPortConfigure( "MKS660Two", "10.112.136.74:4002 tcp", 0, 0, 0 )
drvAsynIPPortConfigure( "MKS660Three", "10.112.136.74:4003 tcp", 0, 0, 0 )
drvAsynIPPortConfigure( "MKS660Four", "10.112.136.74:4004 tcp", 0, 0, 0 )


#enables debugging 0xff is the max setting
#asynSetTraceIOMask("MKS660One", 0,0xff)
#asynSetTraceMask("MKS660One", 0,0xff)



## Load record instances
#dbLoadTemplate "db/userHost.substitutions"
#dbLoadRecords "db/dbSubExample.db", "user=zmaHost"

dbLoadRecords("db/MKS660.db")

## Set this to see messages from mySub

var mySubDebug 1
var mediatorVerbosity 7

## Run this to trace the stages of iocInit
#traceIocInit

cd ${TOP}/iocBoot/${IOC}
iocInit

## Start any sequence programs
#seq sncExample, "user=zmaHost"
