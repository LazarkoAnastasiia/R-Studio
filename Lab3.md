# В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100 фільмами 2017 року виходу за посиланням 
# «http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_ty pe=feature». Необхідно створити data.frame «movies» з наступними даними: 
# номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). Для виконання лабораторної рекомендується використати бібліотеку «rvest». 
# CSS селектори для зчитування необхідних даних: rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». Для 
# зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення зчитаних html даних в текст -
# html_text. Рекомендується перетворити rank_data та runtime_data з тексту в числові значення. При формуванні дата фрейму функцією data.frame
# рекомендується використати параметр «stringsAsFactors = FALSE».

install.packages("rvest")
install.packages("broom", type="binary")
library(rvest) 
movies <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature") 
movies
rank_data_html<-html_nodes(movies,'.text-primary') 
rank_data_html
rank_data <- html_text(rank_data_html) 
rank_data
rank_data<-as.numeric(rank_data)
rank_data
title_data_html <- html_nodes(movies,'.lister-item-header a') 
title_data_html
title_data <- html_text(title_data_html)
title_data
runtime_data_html <- html_nodes(movies,'.text-muted .runtime')
runtime_data_html
runtime_data <- html_text(runtime_data_html)
runtime_data
runtime_data<-gsub(" min","",runtime_data)
runtime_data
runtime_data<-as.numeric(runtime_data)
runtime_data
movies <- data.frame(Rank = rank_data, Title = title_data, Runtime = runtime_data, stringsAsFactors = FALSE )
movies

# В результаті виконання лабораторної роботи необхідно відповісти на запитання: 1. Виведіть перші 6 назв фільмів дата фрейму.

head(movies['Title'], 6)


# 2.Виведіть всі назви фільмів с тривалістю більше 120 хв.

movies[movies['Runtime'] > 120, ]["Title"]

# 3. Скільки фільмів мають тривалість менше 100 хв.

x = movies[movies['Runtime'] < 100, ]['Title']
nrow(x)

