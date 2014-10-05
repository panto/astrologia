load("data/124920_1ucdpprioarmedconflictdataset4.2014.rdata") # import DB doucdpConflict

# http://stackoverflow.com/questions/6081439/changing-column-names-of-a-data-frame-in-r?answertab=votes#tab-top
colnames(ucdpConflict)[1]  <- "ID"
colnames(ucdpConflict)[11] <- "Level"
colnames(ucdpConflict)[15]  <- "Prec"
colnames(ucdpConflict)[17]  <- "Prec2"

data  <- subset(ucdpConflict, select=c(ID,Location,Level,StartDate,Prec,StartDate2,Prec2))
head(data)
tail(data)
nrow(data)

prec1 <- subset(data, Prec==1)
nrow(prec1)

prec2 <- subset(data, Prec2==1)
nrow(prec2)

prec12 <- subset(prec1, Prec2==1)
head(prec12)
tail(prec12)
nrow(prec12)

length(table(prec1$ID))
