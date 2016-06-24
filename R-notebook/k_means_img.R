# Manipulation 1 :  Chargement des données et lire l'image  
# 1- Commençons par télécharger l'image dans notre espace de travail, et dire à R que les données est un fichier JPEG.

library(jpeg)
url <- "http://www.wall321.com/thumbnails/detail/20120304/colorful%20birds%20tropical%20head%203888x2558%20wallpaper_www.wall321.com_40.jpg"

# 2 Téléchargez le fichier et l'enregistrer comme "Image.jpg" dans le répertoire 

dFile <- download.file(url, "Image.jpg", mode="wb")
img <- readJPEG("Image.jpg") # Read the image


#Manipulation 2 :  Nettoyage des données 

# 1- Extraire les informations nécessaires à partir de l'image et d'organiser cela pour notre calcul : 

# Obtenir la dimension
imgDm <- dim(img)


# Attribuer des canaux "RGB" à unetrame de données
imgRGB <- data.frame(
  x = rep(1:imgDm[2], each = imgDm[1]),
  y = rep(imgDm[1]:1, imgDm[2]),
  R = as.vector(img[,,1]),
  G = as.vector(img[,,2]),
  B = as.vector(img[,,3])
)


# Manipulation 3 :  Visualiser les données 
# Tracer l'image originale en utilisant les codes suivants :

library(ggplot2)

# ggplot theme to be used
plotTheme <- function() {
  theme(
    panel.background = element_rect(
      size = 3,
      colour = "black",
      fill = "white"),
    axis.ticks = element_line(
      size = 2),
    panel.grid.major = element_line(
      colour = "gray80",
      linetype = "dotted"),
    panel.grid.minor = element_line(
      colour = "gray90",
      linetype = "dashed"),
    axis.title.x = element_text(
      size = rel(1.2),
      face = "bold"),
    axis.title.y = element_text(
      size = rel(1.2),
      face = "bold"),
    plot.title = element_text(
      size = 20,
      face = "bold",
      vjust = 1.5)
  )
}

# Plot the image
ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = rgb(imgRGB[c("R", "G", "B")])) +
  labs(title = "Original Image: Colorful Bird") +
  xlab("x") +
  ylab("y") +
  plotTheme()

#Manipulation 4 :  Appliquer l'algorithme du k-means 
#1- Appliquer le clustering k-Means sur l'image : avec en premier k = 3  


kClusters <- 3
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
kColours <- rgb(kMeans$centers[kMeans$cluster,])


#2- Tracer les couleurs en cluster :


ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = kColours) +
  labs(title = paste("k-Means Clustering of", kClusters, "Colours")) +
  xlab("x") +
  ylab("y") + 
  plotTheme()

#3- Appliquer le clustering k-Means sur l'image : avec en premier k = 2  

kClusters <- 2
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
kColours <- rgb(kMeans$centers[kMeans$cluster,])



# 4- Tracer les couleurs en cluster :
ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = kColours) +
  labs(title = paste("k-Means Clustering of", kClusters, "Colours")) +
  xlab("x") +
  ylab("y") + 
  plotTheme()

# 5- Appliquer le clustering k-Means sur l'image : avec en premier k = 6  

kClusters <- 6
kMeans <- kmeans(imgRGB[, c("R", "G", "B")], centers = kClusters)
kColours <- rgb(kMeans$centers[kMeans$cluster,])



# 6- Tracer les couleurs en cluster :

ggplot(data = imgRGB, aes(x = x, y = y)) + 
  geom_point(colour = kColours) +
  labs(title = paste("k-Means Clustering of", kClusters, "Colours")) +
  xlab("x") +
  ylab("y") + 
  plotTheme()



