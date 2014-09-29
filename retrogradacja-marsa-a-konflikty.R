load("data/124920_1ucdpprioarmedconflictdataset4.2014.rdata")
names(ucdpConflict)

# Wybieram do podlgądu tylko 5 określonych kolumn

data  <- ucdpConflict[,c(1,10,11,14,15)]
head(data)

# Wybieram z bazy wszystkie te, których StartPrec = 1,

prec1 <- subset(data, StartPrec==1)
head(prec1)

# Zliczam wystąpienie wszystkich dat z kolumny StartDate
head(table(prec1$StartDate))

# Wszystkich dat jest
length(table(prec1$StartDate))

# ZAPIS DO PLUKU 159 rekordów
# TIP: http://www.cookbook-r.com/Data_input_and_output/Writing_data_to_a_file/

write.table(table(prec1$StartDate), file='data/conflict-dataset-StartDates.tsv', quote=FALSE, sep='\t', col.names = FALSE)

# GRAF Wszystkie konflitky w latach:

library(ggplot2)
fq  <- data.frame(table(ucdpConflict$Year))
ggplot(fq, aes(x=Var1, y=Freq)) +
  geom_line(aes(group=1)) +     # Group all points; otherwise no line will show
  geom_point(size=3) +
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))