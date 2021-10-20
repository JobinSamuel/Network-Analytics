##Question -1
library(igraph)#it is a library used for network analysis
flight <- read.csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/flight_hault.csv") #Read data
colnames(flight) <- c("ID","Name","City","Country","IATA_FAA","ICAO","Latitude","Longitude","Altitude","Time","DST","Tz database time")#Assigning column names
head(flight) #Shows initial few rows of the loaded file

Fconnect <- read.csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/connecting_routes.csv")#Read data
colnames(Fconnect) <- c("flights", " ID", "main Airport”, “main Airport ID", "Destination ","Destination  ID","haults","machinary")#Assigning column names
head(Fconnect)# shows initial few rows of the loaded file

flt <- graph.edgelist(as.matrix(Fconnect[1:1000,c(3,5)]),directed = TRUE)#Choosing only first 1000 rows and create a graph from an  edge list matrix
plot(flt) #plot

#Counting number of vertices in the network
vcount(flt)
#Counting number of Edges in the network
ecount(flt)

#Airport which has most flights coming in and how many?
in_d <- degree(flt, mode = "in")
max(in_d)
index <- which(in_d == max(in_d))
in_d[index]
which(flight$IATA_FAA == "CTU")
flight[3298, ]

#Airport which has most flights going out and how many?
ot_d <- degree(flt,mode = "out")
max(ot_d)
index<-which(ot_d == max(ot_d))
ot_d[index]
which(flight$IATA_FAA == "CTU")
flight[3298, ]

#Airport which is close to most of the airports in terms of number of flights?
cls <- closeness(flt, mode = "in",normalized = TRUE)
max(cls)
index <- which(cls == max(cls))
cls[index]
which(flight$IATA_FAA == "CTU")
flight[3298 , ]

#Airport which comes in between most of the routes and hence is an important international hub?
btwn <- betweenness(flt,directed = TRUE,normalized = TRUE)
max(btwn)
index <- which(btwn==max(btwn))
btwn[index]
which(flight$IATA_FAA == "CTU")
flight[3298, ]

#Column binding the centralities which were calculated earlier
centralts <- cbind(in_d,ot_d,cls,btwn)
head(centralts)

# correlations of the centralities
cor(centralts)

#plotting closeness and betweeness
plot(centralts[, "cls"], centralts[, "btwn"])
subset(centralts, (centralts[, "cls"] < 0.005) & (centralts[, "btwn"] < 0.02))
flight[which(flight$IATA_FAA == "PMI"), ]

###Question- 2

###Circular Network using Adjacency Matrix
FB <- read.csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/facebook.csv", header=TRUE)
head(FB) # shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
fb <- graph.adjacency(as.matrix(FB), mode="undirected", weighted=TRUE)
plot(fb)

####Star network  using Adjacency Matrix #########
Insta <- read.csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/instagram.csv", header = TRUE)
head(Insta) # shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
instagram <- graph.adjacency(as.matrix(Insta), mode = "undirected", weighted = TRUE)
plot(instagram)

####Star network  using Adjacency Matrix #########
lnkdin <- read.csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/linkedin.csv", header = TRUE)
head(lnkdin) # shows initial few rows of the loaded file

# create a newtwork using adjacency matrix
linkedin <- graph.adjacency(as.matrix(lnkdin), mode = "undirected", weighted = TRUE)
plot(linkedin)
