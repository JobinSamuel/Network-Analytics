import pandas as pd
import networkx as nx #NetworkX is a Python package for the creation, manipulation, and study of the structure, dynamics, and functions of complex networks.
import matplotlib.pyplot as plt #Used for plots

###Question- 1


flg = pd.read_table("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/connecting_routes.csv",sep=",") # Read data
flg.columns=["flights", " ID", "main Airportmain Airport ID", "Destination ","Destination  ID","haults","machinary","O","CR"] #Assigning Column names


g = nx.Graph() 

g = nx.from_pandas_edgelist(flg, source = 'main Airportmain Airport ID', target = 'Destination ') # Choosing only 2 columns and creating an edge list matrix

print(nx.info(g)) #to find the information regarding the data

dc = nx.degree_centrality(g)  # Degree Centrality
print(dc)


fli=pd.read_table("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/connecting_routes.csv",sep=",") #read data
fli.columns=["Airline","Airline ID","Source Airport","Source Airport ID","Destination Airport","Destination Airport ID","Codeshare","Stops","Equipment"] #assign column names

fli = fli.iloc[1:40,1:10] #Using only a part of data instead of using the whole data
c = nx.Graph()

c = nx.from_pandas_edgelist(fli.iloc[1:40,1:10], source = 'Source Airport', target = 'Destination Airport',edge_attr=True) #Choosing only 2 columns and creating an edge list matrix

print(nx.info(c)) #to find the information regarding the data

btwn = nx.betweenness_centrality(c) # Betweeness_Centrality
print(btwn)

#Plotting betweenness centrality
plt.figure(figsize=(20,20))
pos=nx.spring_layout(c,k=0.15)
nx.draw_networkx(c,pos,node_size=25,node_color="blue")
plt.show()

#Using already existing data to find closeness centrality

print(nx.info(g)) #to find the information regarding the data

g=nx.erdos_renyi_graph(10,0.4)

#closeness centrality
closeness = nx.closeness_centrality(g)
print(closeness)

# Average clustering
Ac = nx.average_clustering(g) 
print(Ac)

#Question -2 

Insta = pd.read_csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/instagram.csv") #Raed data

#Plotting a star graph
In = nx.star_graph(Insta)
   
# illustrate graph
nx.draw(In, node_color = 'green',
        node_size = 100)

print(nx.info(In)) #to find the information regarding the data

Linkdin = pd.read_csv("/Users/jobinsamuel/Desktop/Assignments/Network Analytics/Datasets_Network Analytics/linkedin.csv") #Read data

#Plotting a star graph
linkedIn = nx.star_graph(Linkdin)

# illustrate graph
nx.draw(linkedIn, node_color = 'Blue',
        node_size=100)

print(nx.info(linkedIn)) #to find the information regarding the data

