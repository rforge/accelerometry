\name{accelerometry-package}
\alias{accelerometry-package}
\alias{accelerometry}
\docType{package}
\title{
Functions for processing minute-to-minute accelerometer data
}
\description{
This package contains a collection of functions that perform operations on time-series accelerometer data, such as identify non-wear time, flag minutes that are part of an activity bout, and find the maximum 10-minute average count value. The functions are generally very flexible, allowing for a variety of algorithms to be implemented. Most of the functions are written in C++ and therefore execute very quickly.
}
\details{
\tabular{ll}{
Package: \tab accelerometry\cr
Type: \tab Package\cr
Version: \tab 2.1\cr
Date: \tab 2014-02-01\cr
License: \tab GPL-2\cr
}
The following functions are contained in the package accelerometry:

\code{\link{accel.artifacts}},
\code{\link{accel.bouts}},
\code{\link{accel.process.uni}},
\code{\link{accel.process.tri}},
\code{\link{accel.intensities}},
\code{\link{accel.sedbreaks}},
\code{\link{accel.weartime}},
\code{\link{blockaves}},
\code{\link{movingaves}},
\code{\link{rle2}}

Some additional information on the package accelerometry and its functions can be found on the author's website, \url{https://sites.google.com/site/danevandomelen/}
}
\author{
Dane R. Van Domelen

Maintainer: Dane R. Van Domelen <vandomed@gmail.com>
}
\references{
1. Centers for Disease Control and Prevention (CDC). National Center for Health Statistics (NCHS). National Health and Nutrition Examination Survey Data. Hyattsville, MD: US Department of Health and Human Services, Centers for Disease Control and Prevention, 2003-6 \url{http://www.cdc.gov/nchs/nhanes/nhanes_questionnaires.htm}. Accessed February 1, 2014.

2. National Cancer Institute. Risk factor monitoring and methods: SAS programs for analyzing NHANES 2003-2004 accelerometer data. Available at: \url{http://riskfactor.cancer.gov/tools/nhanes_pam}. Accessed February 1, 2014.

Acknowledgment: This material is based upon work supported by the National Science Foundation Graduate Research Fellowship under Grant No. DGE-0940903.
}
\keyword{ package }
\seealso{
NA
}
\examples{
# Load in sample data from NHANES 2003-2004 [1]
data(testdata)

# Get data from ID number 21005
id.part1 <- testdata[testdata[,"seqn"] == 21005,"seqn"]
days.part1 <- testdata[testdata[,"seqn"] == 21005,"paxday"]
counts.part1 <- testdata[testdata[,"seqn"] == 21005,"paxinten"]

# Identify periods of valid wear time
weartime.flag <- accel.weartime(counts = counts.part1)

# Flag minutes that are part of a moderate-to-vigorous activity bout
mvpa.bouts.flag <- accel.bouts(counts = counts.part1, weartime = weartime.flag, 
                              thresh.lower = 2020)
                              
# Obtain maximum 10-minute count average
max.10min.movingave <- movingaves(x=counts.part1,window=10,return.max=TRUE)

# Process data from ID 21005 and request per-day variables
accel.days <- accel.process.uni(counts = counts.part1, days = days.part1, id = id.part1)

# Process data from ID 21005 and request daily averages
accel.averages <- accel.process.uni(counts = counts.part1, days = days.part1, 
                                    id = id.part1, return.form = 1)

# Process data from ID 21005 and request per-day variables and daily averages
accel.list <- accel.process.uni(counts = counts.part1, days = days.part1, 
                                id = id.part1, return.form = 3)
                  
# Process data according to methods used in NCI's SAS programs [2]
accel.nci <- accel.process.uni(counts = counts.part1, days = days.part1, id = id.part1,
                               brevity = 2, valid.days = 4, cpm.nci = TRUE, 
                               days.distinct = TRUE, nonwear.tol = 2, 
                               nonwear.tol.upper = 100, nonwear.nci = TRUE, 
                               weartime.maximum = 1440, active.bout.tol = 2, 
                               active.bout.nci = TRUE, artifact.thresh = 32767, 
                               artifact.action = 3, return.form = 3)
}