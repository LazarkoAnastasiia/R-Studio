#1. За допомогою download.file() завантажте любий excel файл з порталу 
#http://data.gov.ua та зчитайте його (xls, xlsx – бінарні формати, тому  встановить mode = “wb”. Виведіть перші 6 строк отриманого фрейму даних.
```{r}
install.packages("openxlsx")
library(openxlsx)
download.file('https://data.gov.ua/dataset/c445c6ea-f0c3-4167-abb1-5afb4a0e5499/resource/d55eebcf-4660-4919-96b3-4894be5a6cda/download/nuclear_safety_q4_2021.xlsx', 
destfile = "D:/data_lab1.xlsx", mode = "wb")
data11=read.xlsx("D:/data_lab1.xlsx")
head(data11,6)

 year quarter station irg irg_index iodine_.radionuclides iodine_.radionuclides_index stable_radionuclides stable_.radionuclides_index cs_137_emission co_60_.emission
1 2018       1    ЗАЕС  89      0.13                 260.0                       <0,01                650.0                        0.03          1980.0          1020.0
2 2018       1    РАЕС 105      0.16                 147.0                       <0,01                269.0       7.0000000000000007E-2           587.0           165.0
3 2018       1   ЮУАЕС  45      0.10                  76.0                       <0,01                116.0                        0.02           136.0           373.0
4 2018       1    ХАЕС  31      0.07                  26.8                  <0,01                      37.5             <0,01                      29.4            13.8
5 2018       2    ЗАЕС  84      0.12                 262.0                       <0,01                640.0                        0.03           453.0          1003.0
6 2018       2    РАЕС 113      0.17                  73.0                       <0,01                231.0                        0.06           367.0           281.0
  cs_137_dump co_60_dump  volume index_radioactive_releas            index_dump
1        4330       3670  833000                    0.149                  0.33
2        4800        620 2220000                    0.780 9.6000000000000002E-2
3         390        370   14600                    0.136   0.28399999999999997
4         380         NA   22070                    0.110                  0.03
5        4627       3432  812667                    0.115                  0.91
6       13704        813 3621800                    0.920   0.28000000000000003
```
#2 За допомогою download.file() завантажте файл getdata_data_ss06hid.csv за посиланням  https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv та 
#завантажте дані в R. Code book, що пояснює значення змінних  знаходиться за посиланням https://www.dropbox.com/s/dijv0rlwo4mryv5/PUMSDataDict06.pdf?dl=0 
#Необхідно знайти, скільки property мають value $1000000+
```{r}
download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv', destfile = "D:/data2.csv")
data2=read.csv('data2.csv')
head(data2)
val24<-which(data2$VAL==24)
length(val24)

  RT SERIALNO DIVISION PUMA REGION ST  ADJUST WGTP NP TYPE ACR AGS BDS BLD BUS CONP ELEP FS FULP GASP HFL INSP KIT MHP MRGI MRGP MRGT MRGX PLM RMS RNTM RNTP SMP TEL TEN
1  H      186        8  700      4 16 1015675   89  4    1   1  NA   4   2   2   NA  180  0    2    3   3  600   1  NA    1 1300    1    1   1   9   NA   NA  NA   1   1
2  H      306        8  700      4 16 1015675  310  1    1  NA  NA   1   7  NA   NA   60  0    2    3   3   NA   1  NA   NA   NA   NA   NA   1   2    2  600  NA   1   3
3  H      395        8  100      4 16 1015675  106  2    1   1  NA   3   2   2   NA   70  0    2   30   1  200   1  NA   NA   NA   NA    3   1   7   NA   NA  NA   1   2
4  H      506        8  700      4 16 1015675  240  4    1   1  NA   4   2   2   NA   40  0    2   80   1  200   1  NA    1  860    1    1   1   6   NA   NA 400   1   1
5  H      835        8  800      4 16 1015675  118  4    1   2   1   5   2   2   NA  250  0    2    3   3  700   1  NA    1 1900    1    1   1   7   NA   NA 650   1   1
  VACS VAL VEH WATP YBL FES  FINCP FPARC GRNTP GRPIP HHL HHT  HINCP HUGCL HUPAC HUPAOC HUPARC LNGI MV NOC NPF NPP NR NRC OCPIP PARTNER PSF R18 R60 R65 RESMODE SMOCP SMX
1   NA  17   3  840   5   2 105600     2    NA    NA   1   1 105600     0     2      2      2    1  4   2   4   0  0   2    18       0   0   1   0   0       1  1550   3
2   NA  NA   1    1   3  NA     NA    NA   660    23   1   4  34000     0     4      4      4    1  3   0  NA   0  0   0    NA       0   0   0   0   0       2    NA  NA
3   NA  18   2   50   5   7   9400     2    NA    NA   1   3   9400     0     2      2      2    1  2   1   2   0  0   1    23       0   0   1   0   0       1   179  NA
4   NA  19   3  500   2   1  66000     1    NA    NA   1   1  66000     0     1      1      1    1  3   2   4   0  0   2    26       0   0   1   0   0       2  1422   1
5   NA  20   5    2   3   1  93000     2    NA    NA   1   1  93000     0     2      2      2    1  1   1   4   0  0   1    36       0   0   1   0   0       1  2800   1
  SRNT SVAL TAXP WIF WKEXREL WORKSTAT FACRP FAGSP FBDSP FBLDP FBUSP FCONP FELEP FFSP FFULP FGASP FHFLP FINSP FKITP FMHP FMRGIP FMRGP FMRGTP FMRGXP FMVYP FPLMP FRMSP
1    0    1   24   3       2        3     0     0     0     0     0     0     0    0     0     0     0     0     0    0      0     0      0      0     0     0     0
2    1    0   NA  NA      NA       NA     0     0     0     0     0     0     0    0     0     0     0     0     0    0      0     0      0      0     0     0     0
3    0    1   16   1      13       13     0     0     0     0     0     0     0    0     0     0     0     0     0    0      0     0      0      0     0     0     0
4    0    1   31   2       2        1     0     0     0     0     0     0     0    0     0     0     0     0     0    0      0     0      0      0     0     0     0
5    0    1   25   3       1        1     0     0     0     0     0     0     0    0     0     0     0     0     0    0      0     0      0      0     0     0     0
  FRNTMP FRNTP FSMP FSMXHP FSMXSP FTAXP FTELP FTENP FVACSP FVALP FVEHP FWATP FYBLP wgtp1 wgtp2 wgtp3 wgtp4 wgtp5 wgtp6 wgtp7 wgtp8 wgtp9 wgtp10 wgtp11 wgtp12 wgtp13
1      0     0    0      0      0     0     0     0      0     0     0     0     0    87    28   156    95    26    25    95    93    93     91     87    166     90
2      0     0    0      0      0     0     0     0      0     0     0     0     1   539   363   293   422   566   289    87   242   453    453    334    358    414
3      0     0    0      0      0     0     0     0      0     0     0     0     0   187    35   184   178    83    95    31    32   177    118    110    114    184
4      0     0    0      0      0     0     0     0      0     0     0     0     0   232   406   234   270   249   242   406   249   287     67     72    413    399
5      0     0    0      0      0     0     0     0      0     0     0     0     0   107   194   129    41   156   174    47   113   101     33    115     52    113
  wgtp14 wgtp15 wgtp16 wgtp17 wgtp18 wgtp19 wgtp20 wgtp21 wgtp22 wgtp23 wgtp24 wgtp25 wgtp26 wgtp27 wgtp28 wgtp29 wgtp30 wgtp31 wgtp32 wgtp33 wgtp34 wgtp35 wgtp36 wgtp37
1     25    153     89    148     82     25    180     90     24    140     92     25     27     86     84     87     93     90    149     91     28    143     81    144
2    102    281     99    108    278    131    407    447    264    352    238    390    336    122    374    482    468    335    251    613    104    284    116     91
3    107     95    115     33    118    120     37    184     35    176    176    110    103     29     30    197    127     92    118    177     99     99    109     34
4     77    245    424     67     63    226    254    238     69    238    255    239    248     69    234    247    437    423     74     61    401    267     72    388
5     95    135    206    100    185    135    279    116     33    105    244     38     30    230    123    123    243    120    238     98     90    107     44    122
  wgtp38 wgtp39 wgtp40 wgtp41 wgtp42 wgtp43 wgtp44 wgtp45 wgtp46 wgtp47 wgtp48 wgtp49 wgtp50 wgtp51 wgtp52 wgtp53 wgtp54 wgtp55 wgtp56 wgtp57 wgtp58 wgtp59 wgtp60 wgtp61
1     95     27     22     90    171     27     83    153    148     92     91     91     93     90     26     94    142     24     91     29     84    148     30     93
2    326    102    361    107    253    321    289     96    343    564    274    118    118    321    261    130    463    294    479    391    307    476    283    116
3    100    105     33    173     36    168    175     99    103     30     35    155    102     95    107    185    120    114    113     36    115    103     29    183
4    335    229    236    239     65    259    247    230    225     82    220    233    419    390     69     74    391    276     70    422    409    223    245    269
5     32    127    195    116     36    135    237     33     33    249    102     84    224    119    250    119    125    126     32    112     33    131     45    101
  wgtp62 wgtp63 wgtp64 wgtp65 wgtp66 wgtp67 wgtp68 wgtp69 wgtp70 wgtp71 wgtp72 wgtp73 wgtp74 wgtp75 wgtp76 wgtp77 wgtp78 wgtp79 wgtp80
1    143     24     88    147    145     91     83     83     86     81     27     93    151     28     79     25    101    157    129
2    353    323    374    106    236    380    313     90     94    292    401     81    494    346    496    615    286    454    260
3     35    179    169     95    110     28     34    233     97    123    119    168    107     95    101     30    124    106     31
4    488    221    250    247    240    415    234    219     66     68    359    385     71    234    421     76     77    242    231
5    165    125     41    191    195     49    119     92     44    127     36    119    121    116    209     97    176    144     38

[1] 53


```
#Зчитайте xml файл за посиланням http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml Скільки ресторанів мають zipcode 21231?
```{r}
install.packages("XML")
library(XML)
data3=xmlTreeParse("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml", useInternal=TRUE)
rootNode<-xmlRoot(data3)
rootNode[[1]][[1]]
sum(xpathSApply(xmlRoot(data3), "//zipcode", xmlValue)==21231)

<row _id="1" _uuid="93CACF6F-C8C2-4B87-95A8-8177806D5A6F" _position="1" _address="http://data.baltimorecity.gov/resource/k5ry-ef3g/1">
  <name>410</name>
  <zipcode>21206</zipcode>
  <neighborhood>Frankford</neighborhood>
  <councildistrict>2</councildistrict>
  <policedistrict>NORTHEASTERN</policedistrict>
  <location_1 human_address="{&quot;address&quot;:&quot;4509 BELAIR ROAD&quot;,&quot;city&quot;:&quot;Baltimore&quot;,&quot;state&quot;:&quot;MD&quot;,&quot;zip&quot;:&quot;&quot;}" needs_recoding="true"/>
</row> 

[1] 127
```
