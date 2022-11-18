# В цій лабораторній роботі необхідно зчитати WEB сторінку з сайту IMDB.com зі 100 фільмами 2017 року виходу за посиланням «http://www.imdb.com/search/titlecount=100&release_date=2017,2017&title_ty pe=feature». Необхідно створити data.frame «movies» з наступними даними: номер фільму (rank_data), назва фільму (title_data), тривалість (runtime_data). Для виконання лабораторної рекомендується використати бібліотеку «rvest». CSS селектори для зчитування необхідних даних: rank_data: «.text-primary», title_data: «.lister-item-header a», runtime_data: «.text-muted .runtime». Для зчитування url використовується функція read_html, для зчитування даних по CSS селектору – html_nodes і для перетворення зчитаних html даних в текст -html_text. Рекомендується перетворити rank_data та runtime_data з тексту в числові значення. При формуванні дата фрейму функцією data.frameрекомендується використати параметр «stringsAsFactors = FALSE».
```{r}
install.packages("rvest")
install.packages("broom", type="binary")
library(rvest) 
movies <- read_html("http://www.imdb.com/search/title?count=100&release_date=2017,2017&title_type=feature") 
movies

{html_document}
<html xmlns:og="http://ogp.me/ns#" xmlns:fb="http://www.facebook.com/2008/fbml">
[1] <head>\n<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">\n<script type="text/javascript">var ue_t0=ue_t0||+new ...
[2] <body id="styleguide-v2" class="fixed">\n            <img height="1" width="1" style="display:none;visibility:hidden;" src="//fls ...

rank_data_html<-html_nodes(movies,'.text-primary') 
rank_data_html

{xml_nodeset (100)}
 [1] <span class="lister-item-index unbold text-primary">1.</span>
 [2] <span class="lister-item-index unbold text-primary">2.</span>
 [3] <span class="lister-item-index unbold text-primary">3.</span>
 ...

rank_data <- html_text(rank_data_html) 
rank_data

 [1] "1."   "2."   "3."   "4."   "5."   "6."   "7."   "8."   "9."   "10."  "11."  "12."  "13."  "14."  "15."  "16."  "17."  "18." 
 [19] "19."  "20."  "21."  "22."  "23."  "24."  "25."  "26."  "27."  "28."  "29."  "30."  "31."  "32."  "33."  "34."  "35."  "36." 
 [37] "37."  "38."  "39."  "40."  "41."  "42."  "43."  "44."  "45."  "46."  "47."  "48."  "49."  "50."  "51."  "52."  "53."  "54." 
 [55] "55."  "56."  "57."  "58."  "59."  "60."  "61."  "62."  "63."  "64."  "65."  "66."  "67."  "68."  "69."  "70."  "71."  "72." 
 [73] "73."  "74."  "75."  "76."  "77."  "78."  "79."  "80."  "81."  "82."  "83."  "84."  "85."  "86."  "87."  "88."  "89."  "90." 
 [91] "91."  "92."  "93."  "94."  "95."  "96."  "97."  "98."  "99."  "100."

rank_data<-as.numeric(rank_data)
title_data_html <- html_nodes(movies,'.lister-item-header a') 
title_data_html

{xml_nodeset (100)}
 [1] <a href="/title/tt1396484/?ref_=adv_li_tt">Воно</a>
 [2] <a href="/title/tt5052448/?ref_=adv_li_tt">Пастка</a>
 [3] <a href="/title/tt1856101/?ref_=adv_li_tt">Той, хто біжить по лезу 2049</a>
 [4] <a href="/title/tt5362988/?ref_=adv_li_tt">Вітряна ріка</a>
 [5] <a href="/title/tt5013056/?ref_=adv_li_tt">Дюнкерк</a>
 ...

title_data <- html_text(title_data_html)
title_data

[1] "Воно"                                     "Пастка"                                   "Той, хто біжить по лезу 2049"            
  [4] "Вітряна ріка"                             "Дюнкерк"                                  "Найвеличніший шоумен"                    
  [7] "Три білборди під Еббінґом, Міссурі"       "Назви мене своїм ім'ям"                   "Коко"                                    
 [10] "Джон Вік 2"                               "Мати!"                                    "Kingsman: Золоте кільце"                 
 [13] "Форма води"                               "Вартові Галактики 2"                      "Джуманджі: Поклик джунглів"         

runtime_data_html <- html_nodes(movies,'.text-muted .runtime')
runtime_data_html

{xml_nodeset (100)}
 [1] <span class="runtime">135 min</span>
 [2] <span class="runtime">104 min</span>
 [3] <span class="runtime">164 min</span>
 [4] <span class="runtime">107 min</span>
 [5] <span class="runtime">106 min</span>
 ...

runtime_data <- html_text(runtime_data_html)
runtime_data

[1] "135 min" "104 min" "164 min" "107 min" "106 min" "105 min" "115 min" "132 min" "105 min" "122 min" "121 min" "141 min" "123 min"
 [14] "136 min" "119 min" "129 min" "113 min" "121 min" "151 min" "130 min" "114 min" "129 min" "141 min" "116 min" "133 min" "120 min"
 [27] "98 min"  "111 min" "137 min" "104 min" "105 min" "152 min" "122 min" "104 min" "140 min" "113 min" "118 min" "125 min" "122 min"
 [40] "94 min"  "103 min" "101 min" "136 min" "133 min" "130 min" "85 min"  "118 min" "126 min" "154 min" "114 min" "103 min" "115 min"
 [53] "94 min"  "119 min" "109 min" "107 min" "124 min" "134 min" "115 min" "108 min" "118 min" "100 min" "102 min" "108 min" "107 min"
 ...

runtime_data<-gsub(" min","",runtime_data)
runtime_data
runtime_data<-as.numeric(runtime_data)
runtime_data
movies <- data.frame(Rank = rank_data, Title = title_data, Runtime = runtime_data, stringsAsFactors = FALSE )
movies

  Rank                                    Title Runtime
1      1                                     Воно     135
2      2                                   Пастка     104
3      3             Той, хто біжить по лезу 2049     164
4      4                             Вітряна ріка     107
5      5                                  Дюнкерк     106
6      6                     Найвеличніший шоумен     105
7      7       Три білборди під Еббінґом, Міссурі     115
8      8                   Назви мене своїм ім'ям     132
9      9                                     Коко     105
10    10                               Джон Вік 2     122
...


```
# В результаті виконання лабораторної роботи необхідно відповісти на запитання: 1. Виведіть перші 6 назв фільмів дата фрейму.
```{r}
head(movies['Title'], 6)

                         Title
1                         Воно
2                       Пастка
3 Той, хто біжить по лезу 2049
4                 Вітряна ріка
5                      Дюнкерк
6         Найвеличніший шоумен

```

# 2.Виведіть всі назви фільмів с тривалістю більше 120 хв.
```{r}
movies[movies['Runtime'] > 120, ]["Title"]

                                     Title
1                                      Воно
3              Той, хто біжить по лезу 2049
8                    Назви мене своїм ім'ям
10                               Джон Вік 2
11                                    Мати!
12                  Kingsman: Золоте кільце
13                               Форма води
14                      Вартові Галактики 2
16                     Красуня і Чудовисько
18                Вбивство священного оленя
19                                  Квадрат
20                            Тор: Раґнарок
22 Пірати Карибського моря: Помста Салазара
23                               Диво-жінка
25          Людина-павук: Повернення додому
29                          Логан: Росомаха
32  Зоряні війни: Епізод 8 - Останні Джедаї
33                    Roman J. Israel, Esq.
35                                Гра Моллі
38                               Темні часи
39                           Чужий: Заповіт
43           Валеріан і місто тисячі планет
44                                  Метелик
45                           Примарна нитка
48               Король Артур: Легенда меча
49             Трансформери: Останній лицар
57                Saban's Могутні рейнджери
58                                   Вороги
72                                 Форсаж 8
83                               Сім сестер
85                        Постріл в безодню
89                         The Glass Castle
94                               Вогнеборці
96                    Війна за планету мавп
```
# 3. Скільки фільмів мають тривалість менше 100 хв.
```{r}
x = movies[movies['Runtime'] < 100, ]['Title']
nrow(x)

[1] 14
```
