---
title: "machine learning project"
author: "omar marey"
date: "3/13/2021"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
## load libraries 
```{r}
library(caret)
library(dplyr)

```
## downloading and loading the data 
```{r}
download.file('https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv','pml-training.csv')
download.file('https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv','pml-testing.csv')

training <- read.csv('pml-training.csv',na.strings = "#DIV/0!")
testing <- read.csv('pml-testing.csv',na.strings = "#DIV/0!")

```
it appears that the data has some null values coded as "#DIV/0!"
## exploring the data 
```{r}
summary(training)
str(training)
unique(training)
```


## cleaning the data 
```{r}
cleaning <- function(Data){
  for(i in c(8:ncol(Data)-1)) {Data[,i] = as.numeric(as.character(Data[,i]))}
  complete_cols <- colnames(Data[colSums(is.na(Data)) == 0])[-(1:7)]
  Data <- Data[complete_cols]
  Data$classe <- as.factor(Data$classe)
  Data
}
training <- cleaning(training)
testing <- cleaning(testing)


```


## model creation
```{r}
modfit <- train(classe~.,data = training,method='rf',prox=T)




```