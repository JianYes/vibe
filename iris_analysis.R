data(iris)
head(iris)
summary(iris)
str(iris)
head(iris$Sepal.Length)
hist(iris$Sepal.Length, 
       main="Histogram of Sepal Length", xlab="Sepal Length", col="lightblue", border="black")
boxplot(iris$Sepal.Length ~ iris$Species, 
        main="Boxplot of Sepal Length by Species", 
        xlab="Species", ylab="Sepal Length", col=c("lightgreen", "lightpink", "lightyellow"))
