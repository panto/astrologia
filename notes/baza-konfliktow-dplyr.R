library(dplyr)
load("data/124920_1ucdpprioarmedconflictdataset4.2014.rdata")
conflict_df <- tbl_df(ucdpConflict)
conflict_df

select(conflict_df, ConflictId,Location,Year,StartDate,StartPrec)
