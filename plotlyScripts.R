# install.packages("data.table")
# install.packages("ggplot2")
# install.packages("plotly")

require(data.table)
require(ggplot2)
require(plotly)

Sys.setenv("plotly_username"="userName") # For plotly credentials and publishing 
Sys.setenv("plotly_api_key"="d1X0u74H4rAm3") # DO NOT POST IN GITHUB

### FOR FIRST PLOT FOR BOTH PRESIDENTIAL CANDIDATES

# FIRST WE CREATE A DATA FRAME WITH ARBITRARY NAMES 
df1 <-data.table(
  a.1 = c(26, 42, 37), 
  a.2 = c(17, 27, 12),
  a.3 = c(12, 17, 6), 
  a.4 = c(16, 21, 8),
  a.5 = c(15, 29, 33),
  a.6 = c(17, 28, 21),
  a.7 = c(9, 9, 10))
# HERE WE TRANSPOSE THE DATA FRAME
trans <- data.table(t(df1))
# SEE THE OUTPUT
trans

# GIVE COLUMN NAMES WHICH WILL BE IMPORTANT LATER ON
colnames(trans) <- c("Positive", "Neutral", "Negative")

# WE ADD A WEEKDAY COLUMN
trans$day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")

# WE MELT THE DAY BY DAY OF THE WEEK SO OUR DATA CAN LOOK AND BE EXACTLY AS WE WANT IT FOR GGPLOT2 STUFF
df.a <- melt(trans, id.var="day")
df.a

df.a$day <- factor(df.a$day, levels =c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))

colnames(df.a) <- c("day", "label", "value")

df.a$label <- factor(df.a$label, levels = c("Positive", "Neutral", "Negative"))
df.a$day

ggBth <- ggplot(df.a, aes(day, value, fill = label, width = .75)) + geom_bar(stat="identity", position = "dodge", colour = "turquoise2") +
  scale_fill_manual(values = c("#006622", "#08519C", "#991f00")) + theme_minimal() + 
  labs(x = "Days of the Week", y = "Sentiment Count", title="Weekly Sentiment Count for Both Presidential Candidates") 
ggplotly(ggBth)

# IF YOU WOULD LIKE TO PUBLISH DO THE NEXT LINE OF CODE IF NOT IGNORE
# plotly_POST(ggBth, filename = "sentAnalBoth")

### SENTIMENT PLOT FOR HILLARY CLINTON
df1 <-data.table(
  b.1 = c(15, 24, 20), 
  b.2 = c(5, 10, 4),
  b.3 = c(5, 10, 5), 
  b.4 = c(11, 16, 8),
  b.5 = c(10, 20, 11),
  b.6 = c(7, 14, 1),
  b.7 = c(6, 6, 1))
trans1 <- data.table(t(df1))
trans1

colnames(trans1) <- c("Positive", "Neutral", "Negative")
trans1
trans1$day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
trans1

df.b <- melt(trans1, id.var="day")
df.b

df.b$day <- factor(df.b$day, levels =c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
df.b

colnames(df.b) <- c("day", "label", "value")

df.b$label <- factor(df.b$label, levels = c("Positive", "Neutral", "Negative"))
df.b

ggHC <- ggplot(df.b, aes(day, value, fill = label, width = .75)) + geom_bar(stat="identity", position = "dodge", colour = "turquoise2") +
  scale_fill_manual(values = c("#006622", "#08519C", "#991f00")) + theme_minimal() + 
  labs(x = "Days of the Week", y = "Sentiment Count", title="Weekly Sentiment Count for Presidential Candidate Hillary Clinton") 
ggHC
ggplotly(ggHC)
# plotly_POST(ggHC, filename = "sentAnalHC")

### PLOT FOR DONALD TRUMP
df2 <-data.table(
  c.1 = c(11, 18, 17), 
  c.2 = c(12, 17, 8),
  c.3 = c(7, 7, 1), 
  c.4 = c(5, 5, 0),
  c.5 = c(5, 9, 22),
  c.6 = c(10, 14, 20),
  c.7 = c(3, 3, 9))
trans2 <- data.table(t(df2))
trans2

colnames(trans2) <- c("Positive", "Neutral", "Negative")
trans2
trans2$day <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")
trans2

df.c <- melt(trans2, id.var="day")
df.c

df.c$day <- factor(df.c$day, levels =c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"))
df.c

colnames(df.c) <- c("day", "label", "value")

df.c$label <- factor(df.c$label, levels = c("Positive", "Neutral", "Negative"))
df.c

ggDT <- ggplot(df.c, aes(day, value, fill = label, width = .75)) + geom_bar(stat="identity", position = "dodge", colour = "turquoise2") +
  scale_fill_manual(values = c("#006622", "#08519C", "#991f00")) + theme_minimal() + 
  labs(x = "Days of the Week", y = "Sentiment Count", title="Weekly Sentiment Count for Presidential Candidate Donald Trump")
ggDT
ggplotly(ggDT)
# plotly_POST(ggDT, filename = "sentAnalFDT")
