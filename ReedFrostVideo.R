# This program will produce a .mp4 video of a disease spreading through a population according to the
# Reed-Frost epidemiologic model.

library(igraph)
library(animation)

# Creating a video with the animation package requires external software called FFmpeg.
# You will need to download FFmpeg and then tell R the file pathway on your computer.
# This is the pathway on my computer.
ani.options("ffmpeg" = "C:/Users/jamie/Downloads/ffmpeg-2020-11-18-git-e3081d6f4f-full_build/bin/ffmpeg")

# The rfvideo function creates a video of a disease spreading through a population according to the 
# Reed-Frost Susceptible-Infected-Recovered (SIR) Model.
# size = population size
# I0 = initial number of infected individuals
# p = probability of contact between each infected and susceptible person at each time step
# note: the nodes' relative positions on the graph are meaningless and do not affect probability of contact
rfvideo <- function(size, I0, p) {
  g1 <- graph(edges=c(), n=size, directed=F) #create a graph with size vertices, no edges
  Status <- c() #vector representing the status of each person in the population
  for (i in 1:(I0)) { #set the first I0 people to "infected"
    Status <- c(Status, "I")
  }
  for (i in 1:(size - I0)) { #set the rest of the population to "susceptible"
    Status <- c(Status, "S")
  }
  V(g1)$status = Status # assign the elements in the "Status" vector to the nodes in the graph
  
  #begin the animation
  saveVideo({
    #plot the initial graph
    ## Susceptible "S" = green
    ## Infected "I" = red
    ## Recovered "R" = gray
    plot(g1, vertex.color=c("green", "red", "gray")[1+(V(g1)$status=="I")+(2*(V(g1)$status=="R"))], 
         vertex.size=6, vertex.label=NA, 
         main=paste("Reed-Frost Simulation, population size =", size, ", p =", p))
    legend(1, 1, legend=c("S", "I", "R"), pch=19, col=c("green", "red", "gray"))
    
    newStatus <- Status # vector for the status of the nodes at the new time step
    
    while ("I" %in% Status) { #while there are infected people in the population
      for (i in 1:length(Status)) { #for each node in the population
        if (Status[i] == "I") { #if they are infected
          newStatus[i] <- "R" #set their new status to recovered
          for (j in 1:length(Status)) { #traverse the population again
            if (Status[j] == "S") { #if they are susceptible
              u <- runif(1) #create a Uniform(0,1) random variable
              if (u < p) { #if u is less than the p specified in the parameters
                g1 <- g1 + edge(i,j) #draw an edge between the infected node and the susceptible node
                if (newStatus[j] != "I") { #if node j hasn't already been infected this time step
                  newStatus[j] <- "I" #set its new status to infected
                }
              }
            }
          }
        }
      }
      
      Status <- newStatus #set status to new status
      V(g1)$status <- Status #assign the new status to each node in the graph
      
      # plot the new time step
      plot(g1, vertex.color=c("green", "red", "gray")[1+(V(g1)$status=="I")+(2*(V(g1)$status=="R"))], 
           vertex.size=6, vertex.label=NA,
           main=paste("Reed-Frost Simulation, population size =", size, ", p =", p))
      legend(1, 1, legend=c("S", "I", "R"), pch=19, col=c("green", "red", "gray"))
    }
    
  }, video.name="rfvideo.mp4", interval=1)
}

# Run the function to create the video
rfvideo(150, 1, 0.03) #example: population size=150, initial infections=1, p=0.03
