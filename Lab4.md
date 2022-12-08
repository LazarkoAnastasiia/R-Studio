#В результаті виконання лабораторної роботи необхідно створити фрейми даних:

install.packages("DBI")
install.packages("RSQLite")
library(DBI)
library(RSQLite)
conn <- dbConnect(RSQLite::SQLite(), "D:/database.sqlite")
res <- dbSendQuery(conn, "SELECT Name as Author FROM Authors ORDER BY Name")
df <- dbFetch(res, n=10)
df
dbClearResult(res) 
#1. Ім’я автора (Name), Назва статті (Title). Необхідно вивести всі назви статей для автора «Josh Tenenbaum». Сортування по назві статті.
conn <- dbConnect(RSQLite::SQLite(), "D:/database.sqlite")
res_2 <- dbSendQuery(conn, "SELECT Papers.Title, Authors.Name FROM Papers INNER JOIN PaperAuthors ON Papers.Id = PaperAuthors.PaperId 
                                        INNER JOIN Authors ON Authors.Id = PaperAuthors.AuthorId 
                            WHERE Name = 'Josh Tenenbaum' ORDER BY Papers.Title")
df_2 <- dbFetch(res_2, n=10)
df_2
dbClearResult(res_2) 

#3. Вибрати всі назви статей (Title), в яких є слово «statistical». Сортування по назві статті.

res_3 <- dbSendQuery(conn, "SELECT Title FROM Papers WHERE Title LIKE '%statistical%' ORDER BY Title")
df_3 <- dbFetch(res_3, n=10)
df_3
dbClearResult(res_3)

#4. Ім’я автору (Name), кількість статей по кожному автору (NumPapers). Сортування по кількості статей від більшої кількості до меньшої.

res_4 <- dbSendQuery(conn, "SELECT Name, count(AuthorId) as NumPapers
                    FROM Authors INNER JOIN PaperAuthors ON PaperAuthors.AuthorId=Authors.Id  
                    GROUP BY Name
                    ORDER BY NumPapers desc")
df4 <- dbFetch(res_4,10)
df4

dbClearResult(res_4)
