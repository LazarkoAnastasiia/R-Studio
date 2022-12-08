#В результаті виконання лабораторної роботи необхідно створити фрейми даних:
```{r}
install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)
conn <- dbConnect(RSQLite::SQLite(), "D:/database.sqlite")
res <- dbSendQuery(conn, "SELECT Name as Author FROM Authors ORDER BY Name")
df <- dbFetch(res, n=10)
df
dbClearResult(res) 

               Author
1       ABHISEK KUNDU
2      Aaditya Ramdas
3  Aaron C. Courville
4         Aaron Klein
5          Aaron Roth
6         Aarti Singh
7   Abbas Abdolmaleki
8  Abhradeep Thakurta
9          Adam Smith
10      Adarsh Prasad
```
#1. Назва статті (Title), тип виступу (EventType). Необхідно вибрати тільки статті 
#с типом виступу Spotlight. Сортування по назві статті.
```{r}
res_1 <- dbSendQuery(conn, "SELECT Title FROM Papers WHERE EventType = 'Spotlight' ORDER BY Title")
df_1 <- dbFetch(res_1, n=10)
df_1
dbClearResult(res_1) 

                                                                                         Title
1  A Tractable Approximation to Optimal Point Process Filtering: Application to Neural Encoding
2                                    Accelerated Mirror Descent in Continuous and Discrete Time
3                        Action-Conditional Video Prediction using Deep Networks in Atari Games
4                                                                      Adaptive Online Learning
5                          Asynchronous Parallel Stochastic Gradient for Nonconvex Optimization
6                                                 Attention-Based Models for Speech Recognition
7                                                       Automatic Variational Inference in Stan
8                                   Backpropagation for Energy-Efficient Neuromorphic Computing
9                       Bandit Smooth Convex Optimization: Improving the Bias-Variance Tradeoff
10                         Biologically Inspired Dynamic Textures for Probing Motion Perception
```

#2. Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.

```{r}
res_2 <- dbSendQuery(conn, "SELECT Papers.Title, Authors.Name FROM Papers INNER JOIN PaperAuthors ON Papers.Id = PaperAuthors.PaperId 
                                        INNER JOIN Authors ON Authors.Id = PaperAuthors.AuthorId 
                            WHERE Name = 'Josh Tenenbaum' ORDER BY Papers.Title")
df_2 <- dbFetch(res_2, n=10)
df_2
dbClearResult(res_2) 

                                                                                             Title           Name
1                                                       Deep Convolutional Inverse Graphics Network Josh Tenenbaum
2 Galileo: Perceiving Physical Object Properties by Integrating a Physics Engine with Deep Learning Josh Tenenbaum
3                                                Softstar: Heuristic-Guided Probabilistic Inference Josh Tenenbaum
4                                                        Unsupervised Learning by Program Synthesis Josh Tenenbaum
```
#3. Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.
```{r}
res_3 <- dbSendQuery(conn, "SELECT Title FROM Papers WHERE Title LIKE '%statistical%' ORDER BY Title")
df_3 <- dbFetch(res_3, n=10)
df_3
dbClearResult(res_3)

                                                                               Title
1 Adaptive Primal-Dual Splitting Methods for Statistical Learning and Image Processing
2                                Evaluating the statistical significance of biclusters
3                  Fast Randomized Kernel Ridge Regression with Statistical Guarantees
4     High Dimensional EM Algorithm: Statistical Optimization and Asymptotic Normality
5                Non-convex Statistical Optimization for Sparse Tensor Graphical Model
6            Regularized EM Algorithms: A Unified Framework and Statistical Guarantees
7                            Statistical Model Criticism using Kernel Two Sample Tests
8                         Statistical Topological Data Analysis - A Kernel Perspective
```
#4. Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.
```{r}
res_4 <- dbSendQuery(conn, "SELECT Name, count(AuthorId) as NumPapers
                    FROM Authors INNER JOIN PaperAuthors ON PaperAuthors.AuthorId=Authors.Id  
                    GROUP BY Name
                    ORDER BY NumPapers desc")
df4 <- dbFetch(res_4,10)
df4

dbClearResult(res_4)

                  Name NumPapers
1  Pradeep K. Ravikumar         7
2        Lawrence Carin         6
3               Han Liu         6
4     Zoubin Ghahramani         5
5               Le Song         5
6   Inderjit S. Dhillon         5
7          Zhaoran Wang         4
8         Yoshua Bengio         4
9  Simon Lacoste-Julien         4
10          Shie Mannor         4
```
