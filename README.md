# Food Demand Forecasting Challenge

Demand Forcasting for Food company, A food delivery service has to deal with a lot of perishable raw materials which makes it all the more important for such a company to accurately forecast daily and weekly demand.  


<p align="center"><img width=100% src=https://user-images.githubusercontent.com/44467789/71721417-f6207000-2e4a-11ea-8647-0fe313136b74.jpg>
                                                              Source: mpracticle.com                                               
                                                 


## Table of Content

- [Data Analysis](#data-analysis)
- [Data Process and Cleaning](#data-process-and-cleaning)
- [Model Building](#model-building)
- [Performance Measurement](#performance-measurement)
- [Conclusion](#conclusion)
- 

<br>

## Data Analysis

Befor starting any project, it's important to do the Multi variant data analysis. We have done few analysis on the data as follows,

Based on the data seet we merged all the sheets. And following is the data summary. 

```
> head(train)
  center_id meal_id      id week checkout_price base_price emailer_for_promotion homepage_featured
1        10    2126 1193219   22         529.68     529.68                     0                 0
2        10    1778 1367365   29         181.39     183.39                     0                 0
3        10    2139 1314059  141         283.24     285.24                     0                 0
4        10    2664 1136385  119         302.64     304.64                     0                 0
5        10    1311 1247333  108         166.90     165.90                     0                 0
6        10    2760 1245112   19         241.53     241.53                     0                 1
  num_orders     category cuisine city_code region_code center_type op_area
1        256        Pasta Italian       590          56      TYPE_B     6.3
2        365    Beverages Italian       590          56      TYPE_B     6.3
3        161    Beverages  Indian       590          56      TYPE_B     6.3
4        852        Salad Italian       590          56      TYPE_B     6.3
5        811       Extras    Thai       590          56      TYPE_B     6.3
6        473 Other Snacks    Thai       590          56      TYPE_B     6.3
```

Structure of the data,

```
> str(train)
'data.frame':	456548 obs. of  15 variables:
 $ center_id            : int  10 10 10 10 10 10 10 10 10 10 ...
 $ meal_id              : int  2126 1778 2139 2664 1311 2760 1993 1525 1962 1438 ...
 $ id                   : int  1193219 1367365 1314059 1136385 1247333 1245112 1031751 1224037 1161919 1018617 ...
 $ week                 : int  22 29 141 119 108 19 35 18 144 72 ...
 $ checkout_price       : num  530 181 283 303 167 ...
 $ base_price           : num  530 183 285 305 166 ...
 $ emailer_for_promotion: int  0 0 0 0 0 0 0 0 0 0 ...
 $ homepage_featured    : int  0 0 0 0 0 1 0 0 0 0 ...
 $ num_orders           : int  256 365 161 852 811 473 1214 350 553 42 ...
 $ category             : Factor w/ 14 levels "Beverages","Biryani",..: 7 1 1 10 4 6 1 6 8 13 ...
 $ cuisine              : Factor w/ 4 levels "Continental",..: 3 3 2 3 4 4 4 4 1 4 ...
 $ city_code            : int  590 590 590 590 590 590 590 590 590 590 ...
 $ region_code          : int  56 56 56 56 56 56 56 56 56 56 ...
 $ center_type          : Factor w/ 3 levels "TYPE_A","TYPE_B",..: 2 2 2 2 2 2 2 2 2 2 ...
 $ op_area              : num  6.3 6.3 6.3 6.3 6.3 6.3 6.3 6.3 6.3 6.3 ...

```

Now, following data analysisi is done with the use of Tableua tool, 

#### 


