Analysis
================

### Section(s) 2

A total of 2 record(s) have been eliminated due to the constraints.

    ## # A tibble: 5 x 10
    ##    mode     n   kapr percent30 duration comfortable_info comfortable_pii
    ##   <dbl> <int>  <dbl>     <dbl>    <dbl>            <dbl>           <dbl>
    ## 1     1    22 100         84.7     8.57             2.14            3.86
    ## 2     2    23   7.85      82.9     8.82             2.43            3.52
    ## 3     3    26   5.33      84.2    10.1              3.04          NaN   
    ## 4     4    26   7.87      87.2    11.0              3.04          NaN   
    ## 5     5    23   3.22      80.8     9.04             2.17            3.43
    ## # ... with 3 more variables: kapr_sd <dbl>, percent30_sd <dbl>,
    ## #   duration_sd <dbl>

# Overview

``` r
summary_overview <-  function(x){
  message(x)
  x <- df_key_info_secs %>% pull(x)
  # browser()
  
  range(x) %>% print()
  mean(x, na.rm = T) %>% print()
  sd(x, na.rm = T) %>% print()
}

walk(c("kapr", "duration", "percent30"), summary_overview)
```

    ## kapr

    ## [1]   0 100
    ## [1] 23.31535
    ## [1] 36.79228

    ## duration

    ## [1]  2.783333 21.333333
    ## [1] 9.5675
    ## [1] 3.667678

    ## percent30

    ## [1]  56.66667 100.00000
    ## [1] 84.03057
    ## [1] 7.985958

## Hypothesis 1

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.77271, df = 43, p-value = 0.4439
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.897961  6.498174
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  82.85357 
    ## 
    ## [1] "p.value: 0.443918731077831"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 4.726e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1246785 -0.6661501
    ## sample estimates:
    ## difference in location 
    ##             -0.9595565 
    ## 
    ## [1] "p.value: 4.72648606657432e-07"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.19662, df = 43, p-value = 0.8451
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2353588  0.1935428
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.221971 
    ## 
    ## [1] "p.value: 0.84505252617326"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 272, p-value = 0.6616
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08860560  0.08869259
    ## sample estimates:
    ## difference in location 
    ##           2.471348e-05 
    ## 
    ## [1] "p.value: 0.661593590449471"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.415, df = 43, p-value = 0.1643
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.46738897  0.08195682
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.311180 
    ## 
    ## [1] "p.value: 0.164283932837353"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2726, df = 43, p-value = 0.21
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.4497794  0.1017462
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.362859 
    ## 
    ## [1] "p.value: 0.209995621951642"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.6672, df = 43, p-value = 0.01074
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.7292100 -0.1012687
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.061776 
    ## 
    ## [1] "p.value: 0.0107391952439951"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.77271, df = 43, p-value = 0.4439
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.897961  6.498174
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  82.85357 
    ## 
    ## [1] "statistic: 0.772713540442644"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 4.726e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1246785 -0.6661501
    ## sample estimates:
    ## difference in location 
    ##             -0.9595565 
    ## 
    ## [1] "statistic: 44"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.19662, df = 43, p-value = 0.8451
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2353588  0.1935428
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.221971 
    ## 
    ## [1] "statistic: -0.196618402525137"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 272, p-value = 0.6616
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08860560  0.08869259
    ## sample estimates:
    ## difference in location 
    ##           2.471348e-05 
    ## 
    ## [1] "statistic: 272"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.415, df = 43, p-value = 0.1643
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.46738897  0.08195682
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.311180 
    ## 
    ## [1] "statistic: -1.41495212535264"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2726, df = 43, p-value = 0.21
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.4497794  0.1017462
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.362859 
    ## 
    ## [1] "statistic: -1.27260772598547"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.6672, df = 43, p-value = 0.01074
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.7292100 -0.1012687
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.061776 
    ## 
    ## [1] "statistic: -2.66716026675396"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.77271, df = 43, p-value = 0.4439
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.897961  6.498174
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  82.85357 
    ## 
    ## [1] "conf.int: -2.89796137644388" "conf.int: 6.49817425701659"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 4.726e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1246785 -0.6661501
    ## sample estimates:
    ## difference in location 
    ##             -0.9595565 
    ## 
    ## [1] "conf.int: -3.1246785374851"   "conf.int: -0.666150146261592"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.19662, df = 43, p-value = 0.8451
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2353588  0.1935428
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.221971 
    ## 
    ## [1] "conf.int: -0.235358767414323" "conf.int: 0.193542797407548"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 272, p-value = 0.6616
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08860560  0.08869259
    ## sample estimates:
    ## difference in location 
    ##           2.471348e-05 
    ## 
    ## [1] "conf.int: -0.0886056021708486" "conf.int: 0.0886925929793059"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.415, df = 43, p-value = 0.1643
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.46738897  0.08195682
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.311180 
    ## 
    ## [1] "conf.int: -0.467388968619602" "conf.int: 0.0819568247475612"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2726, df = 43, p-value = 0.21
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.4497794  0.1017462
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.362859 
    ## 
    ## [1] "conf.int: -0.449779393724633" "conf.int: 0.101746228943582"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.6672, df = 43, p-value = 0.01074
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.7292100 -0.1012687
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.061776 
    ## 
    ## [1] "conf.int: -0.729209968300881" "conf.int: -0.101268731743037"

## Hypothesis 2

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 327, p-value = 0.5762
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.07111456  0.28887374
    ## sample estimates:
    ## difference in location 
    ##           6.038947e-06 
    ## 
    ## [1] "p.value: 0.576237733616322"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.8306, df = 47, p-value = 0.0735
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -137.201828    6.467385
    ## sample estimates:
    ## mean of x mean of y 
    ##  225.6875  291.0547 
    ## 
    ## [1] "p.value: 0.0735017033159552"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2321, df = 47, p-value = 0.224
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.3013187  0.7934592
    ## sample estimates:
    ## mean of x mean of y 
    ##  8.815942 10.069872 
    ## 
    ## [1] "p.value: 0.224041474468167"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 372.5, p-value = 0.07158
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.0000172475  2.4210865257
    ## sample estimates:
    ## difference in location 
    ##             0.08870832 
    ## 
    ## [1] "p.value: 0.0715814910220973"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.11862, df = 47, p-value = 0.9061
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2799905  0.2488099
    ## sample estimates:
    ## mean of x mean of y 
    ##   2.31118   2.32677 
    ## 
    ## [1] "p.value: 0.906080336109719"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.13402, df = 47, p-value = 0.894
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2809428  0.2458476
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.362859  2.380406 
    ## 
    ## [1] "p.value: 0.893956043889995"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.26555, df = 47, p-value = 0.7917
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2936192  0.3829224
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.061776  2.017125 
    ## 
    ## [1] "p.value: 0.791747967844983"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 327, p-value = 0.5762
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.07111456  0.28887374
    ## sample estimates:
    ## difference in location 
    ##           6.038947e-06 
    ## 
    ## [1] "statistic: 327"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.8306, df = 47, p-value = 0.0735
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -137.201828    6.467385
    ## sample estimates:
    ## mean of x mean of y 
    ##  225.6875  291.0547 
    ## 
    ## [1] "statistic: -1.83062028003936"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2321, df = 47, p-value = 0.224
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.3013187  0.7934592
    ## sample estimates:
    ## mean of x mean of y 
    ##  8.815942 10.069872 
    ## 
    ## [1] "statistic: -1.23209676009295"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 372.5, p-value = 0.07158
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.0000172475  2.4210865257
    ## sample estimates:
    ## difference in location 
    ##             0.08870832 
    ## 
    ## [1] "statistic: 372.5"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.11862, df = 47, p-value = 0.9061
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2799905  0.2488099
    ## sample estimates:
    ## mean of x mean of y 
    ##   2.31118   2.32677 
    ## 
    ## [1] "statistic: -0.118622059270659"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.13402, df = 47, p-value = 0.894
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2809428  0.2458476
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.362859  2.380406 
    ## 
    ## [1] "statistic: -0.134023763966459"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.26555, df = 47, p-value = 0.7917
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2936192  0.3829224
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.061776  2.017125 
    ## 
    ## [1] "statistic: 0.265548920813689"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 327, p-value = 0.5762
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.07111456  0.28887374
    ## sample estimates:
    ## difference in location 
    ##           6.038947e-06 
    ## 
    ## [1] "conf.int: -0.0711145649522443" "conf.int: 0.288873740476834"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.8306, df = 47, p-value = 0.0735
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -137.201828    6.467385
    ## sample estimates:
    ## mean of x mean of y 
    ##  225.6875  291.0547 
    ## 
    ## [1] "conf.int: -137.20182816139" "conf.int: 6.4673851606127"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2321, df = 47, p-value = 0.224
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.3013187  0.7934592
    ## sample estimates:
    ## mean of x mean of y 
    ##  8.815942 10.069872 
    ## 
    ## [1] "conf.int: -3.30131873168052" "conf.int: 0.793459199907942"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 372.5, p-value = 0.07158
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.0000172475  2.4210865257
    ## sample estimates:
    ## difference in location 
    ##             0.08870832 
    ## 
    ## [1] "conf.int: -1.72475012899224e-05" "conf.int: 2.42108652567401"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.11862, df = 47, p-value = 0.9061
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2799905  0.2488099
    ## sample estimates:
    ## mean of x mean of y 
    ##   2.31118   2.32677 
    ## 
    ## [1] "conf.int: -0.279990505230095" "conf.int: 0.248809850136395"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.13402, df = 47, p-value = 0.894
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2809428  0.2458476
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.362859  2.380406 
    ## 
    ## [1] "conf.int: -0.280942770063486" "conf.int: 0.245847575410048"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.26555, df = 47, p-value = 0.7917
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2936192  0.3829224
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.061776  2.017125 
    ## 
    ## [1] "conf.int: -0.293619179600967" "conf.int: 0.382922388469393"

## Hypothesis 3.1

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 354.5, p-value = 0.7664
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1112912  0.2238263
    ## sample estimates:
    ## difference in location 
    ##           7.408353e-06 
    ## 
    ## [1] "p.value: 0.766361417184139"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.4588, df = 50, p-value = 0.1509
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -37.28313 235.13084
    ## sample estimates:
    ## mean of x mean of y 
    ##  773.9886  675.0647 
    ## 
    ## [1] "p.value: 0.150882759826624"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2547, df = 50, p-value = 0.2154
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2695832  0.0622785
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.351287  2.454939 
    ## 
    ## [1] "p.value: 0.215424489674998"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 258.5, p-value = 0.2804
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.421081e+00  7.205988e-05
    ## sample estimates:
    ## difference in location 
    ##          -5.534639e-05 
    ## 
    ## [1] "p.value: 0.280408057461222"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.6028, df = 50, p-value = 0.5494
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3153840  0.1697796
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.326770  2.399573 
    ## 
    ## [1] "p.value: 0.549368409764764"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.56528, df = 50, p-value = 0.5744
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3047459  0.1708859
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.380406  2.447336 
    ## 
    ## [1] "p.value: 0.574410406202587"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.077321, df = 48, p-value = 0.9387
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1147859  0.1239674
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.082880  1.078289 
    ## 
    ## [1] "p.value: 0.938689433096295"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 354.5, p-value = 0.7664
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1112912  0.2238263
    ## sample estimates:
    ## difference in location 
    ##           7.408353e-06 
    ## 
    ## [1] "statistic: 354.5"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.4588, df = 50, p-value = 0.1509
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -37.28313 235.13084
    ## sample estimates:
    ## mean of x mean of y 
    ##  773.9886  675.0647 
    ## 
    ## [1] "statistic: 1.45876810261765"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2547, df = 50, p-value = 0.2154
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2695832  0.0622785
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.351287  2.454939 
    ## 
    ## [1] "statistic: -1.25469055235503"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 258.5, p-value = 0.2804
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.421081e+00  7.205988e-05
    ## sample estimates:
    ## difference in location 
    ##          -5.534639e-05 
    ## 
    ## [1] "statistic: 258.5"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.6028, df = 50, p-value = 0.5494
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3153840  0.1697796
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.326770  2.399573 
    ## 
    ## [1] "statistic: -0.602796697285955"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.56528, df = 50, p-value = 0.5744
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3047459  0.1708859
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.380406  2.447336 
    ## 
    ## [1] "statistic: -0.565281188169943"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.077321, df = 48, p-value = 0.9387
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1147859  0.1239674
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.082880  1.078289 
    ## 
    ## [1] "statistic: 0.0773212060963146"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 354.5, p-value = 0.7664
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1112912  0.2238263
    ## sample estimates:
    ## difference in location 
    ##           7.408353e-06 
    ## 
    ## [1] "conf.int: -0.11129117152199" "conf.int: 0.223826265931278"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.4588, df = 50, p-value = 0.1509
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -37.28313 235.13084
    ## sample estimates:
    ## mean of x mean of y 
    ##  773.9886  675.0647 
    ## 
    ## [1] "conf.int: -37.2831332483535" "conf.int: 235.130841232788"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2547, df = 50, p-value = 0.2154
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2695832  0.0622785
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.351287  2.454939 
    ## 
    ## [1] "conf.int: -0.269583201549886" "conf.int: 0.0622785017333171"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 258.5, p-value = 0.2804
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.421081e+00  7.205988e-05
    ## sample estimates:
    ## difference in location 
    ##          -5.534639e-05 
    ## 
    ## [1] "conf.int: -2.42108080403793"    "conf.int: 7.20598838657985e-05"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.6028, df = 50, p-value = 0.5494
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3153840  0.1697796
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.326770  2.399573 
    ## 
    ## [1] "conf.int: -0.315384014250336" "conf.int: 0.169779618645941"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.56528, df = 50, p-value = 0.5744
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.3047459  0.1708859
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.380406  2.447336 
    ## 
    ## [1] "conf.int: -0.304745934425714" "conf.int: 0.170885924631004"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.077321, df = 48, p-value = 0.9387
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.1147859  0.1239674
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.082880  1.078289 
    ## 
    ## [1] "conf.int: -0.114785867577276" "conf.int: 0.12396739089187"

## Hypothesis 3.2

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.6203, df = 47, p-value = 0.0118
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##   1.472142 11.205673
    ## sample estimates:
    ## mean of x mean of y 
    ##  87.17949  80.84058 
    ## 
    ## [1] "p.value: 0.0117955663351341"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -3.465, df = 35.792, p-value = 0.001395
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -333.09852  -87.10024
    ## sample estimates:
    ## mean of x mean of y 
    ##  675.0647  885.1641 
    ## 
    ## [1] "p.value: 0.0013945338519927"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.2997, df = 36.211, p-value = 0.02734
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  0.02674514 0.42554913
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.454939  2.228792 
    ## 
    ## [1] "p.value: 0.0273397713993805"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 220.5, p-value = 0.2365
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.231217e+00  6.220874e-05
    ## sample estimates:
    ## difference in location 
    ##          -3.528996e-05 
    ## 
    ## [1] "p.value: 0.236465158158085"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.048539, df = 47, p-value = 0.9615
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2367211  0.2484268
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.399573  2.393720 
    ## 
    ## [1] "p.value: 0.961492030758567"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.034309, df = 47, p-value = 0.9728
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2320474  0.2400995
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.447336  2.443310 
    ## 
    ## [1] "p.value: 0.972776305510602"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.72647, df = 44, p-value = 0.4714
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.16856358  0.07923944
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.078289  1.122952 
    ## 
    ## [1] "p.value: 0.471399122233281"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.6203, df = 47, p-value = 0.0118
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##   1.472142 11.205673
    ## sample estimates:
    ## mean of x mean of y 
    ##  87.17949  80.84058 
    ## 
    ## [1] "statistic: 2.62026953615476"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -3.465, df = 35.792, p-value = 0.001395
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -333.09852  -87.10024
    ## sample estimates:
    ## mean of x mean of y 
    ##  675.0647  885.1641 
    ## 
    ## [1] "statistic: -3.46496241564271"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.2997, df = 36.211, p-value = 0.02734
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  0.02674514 0.42554913
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.454939  2.228792 
    ## 
    ## [1] "statistic: 2.2996501220986"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 220.5, p-value = 0.2365
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.231217e+00  6.220874e-05
    ## sample estimates:
    ## difference in location 
    ##          -3.528996e-05 
    ## 
    ## [1] "statistic: 220.5"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.048539, df = 47, p-value = 0.9615
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2367211  0.2484268
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.399573  2.393720 
    ## 
    ## [1] "statistic: 0.0485394212655238"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.034309, df = 47, p-value = 0.9728
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2320474  0.2400995
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.447336  2.443310 
    ## 
    ## [1] "statistic: 0.0343086720902016"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.72647, df = 44, p-value = 0.4714
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.16856358  0.07923944
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.078289  1.122952 
    ## 
    ## [1] "statistic: -0.726468039271738"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.6203, df = 47, p-value = 0.0118
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##   1.472142 11.205673
    ## sample estimates:
    ## mean of x mean of y 
    ##  87.17949  80.84058 
    ## 
    ## [1] "conf.int: 1.47214212596697" "conf.int: 11.2056728127176"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## reversed sqaured

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -3.465, df = 35.792, p-value = 0.001395
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -333.09852  -87.10024
    ## sample estimates:
    ## mean of x mean of y 
    ##  675.0647  885.1641 
    ## 
    ## [1] "conf.int: -333.098520558989" "conf.int: -87.10023790324"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## welch two sample t test

    ## 
    ##  Welch Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 2.2997, df = 36.211, p-value = 0.02734
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  0.02674514 0.42554913
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.454939  2.228792 
    ## 
    ## [1] "conf.int: 0.0267451362666158" "conf.int: 0.425549128079051"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 220.5, p-value = 0.2365
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -2.231217e+00  6.220874e-05
    ## sample estimates:
    ## difference in location 
    ##          -3.528996e-05 
    ## 
    ## [1] "conf.int: -2.23121708980746"    "conf.int: 6.22087411781459e-05"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.048539, df = 47, p-value = 0.9615
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2367211  0.2484268
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.399573  2.393720 
    ## 
    ## [1] "conf.int: -0.236721145365759" "conf.int: 0.248426830984487"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 0.034309, df = 47, p-value = 0.9728
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2320474  0.2400995
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.447336  2.443310 
    ## 
    ## [1] "conf.int: -0.23204741091107" "conf.int: 0.240099509964686"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.72647, df = 44, p-value = 0.4714
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.16856358  0.07923944
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.078289  1.122952 
    ## 
    ## [1] "conf.int: -0.168563575178682" "conf.int: 0.0792394382099093"

## Hypothesis 4.1

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2594, df = 46, p-value = 0.2142
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -6.562834  1.511219
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  87.17949 
    ## 
    ## [1] "p.value: 0.214242871354893"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 88, p-value = 1.72e-05
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.134028 -2.978529
    ## sample estimates:
    ## difference in location 
    ##              -3.001376 
    ## 
    ## [1] "p.value: 1.72031166826162e-05"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.9304, df = 46, p-value = 0.005256
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.42826657 -0.07948656
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.454939 
    ## 
    ## [1] "p.value: 0.00525575888670002"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 338, p-value = 0.1701
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.701597e-05  2.142646e+00
    ## sample estimates:
    ## difference in location 
    ##             0.08858239 
    ## 
    ## [1] "p.value: 0.170134914194592"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.2518, df = 46, p-value = 0.02915
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.53238870 -0.02982849
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.399573 
    ## 
    ## [1] "p.value: 0.0291501123914828"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.0982, df = 46, p-value = 0.04141
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.50648201 -0.01050636
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.447336 
    ## 
    ## [1] "p.value: 0.0414108136750139"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.094, df = 44, p-value = 0.04205
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.239223566 -0.004579912
    ## sample estimates:
    ## mean of x mean of y 
    ## 0.9563877 1.0782895 
    ## 
    ## [1] "p.value: 0.0420505572557612"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2594, df = 46, p-value = 0.2142
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -6.562834  1.511219
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  87.17949 
    ## 
    ## [1] "statistic: -1.25938891076434"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 88, p-value = 1.72e-05
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.134028 -2.978529
    ## sample estimates:
    ## difference in location 
    ##              -3.001376 
    ## 
    ## [1] "statistic: 88"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.9304, df = 46, p-value = 0.005256
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.42826657 -0.07948656
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.454939 
    ## 
    ## [1] "statistic: -2.93036879631439"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 338, p-value = 0.1701
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.701597e-05  2.142646e+00
    ## sample estimates:
    ## difference in location 
    ##             0.08858239 
    ## 
    ## [1] "statistic: 338"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.2518, df = 46, p-value = 0.02915
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.53238870 -0.02982849
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.399573 
    ## 
    ## [1] "statistic: -2.25183869645919"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.0982, df = 46, p-value = 0.04141
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.50648201 -0.01050636
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.447336 
    ## 
    ## [1] "statistic: -2.09817481070964"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.094, df = 44, p-value = 0.04205
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.239223566 -0.004579912
    ## sample estimates:
    ## mean of x mean of y 
    ## 0.9563877 1.0782895 
    ## 
    ## [1] "statistic: -2.0940418139812"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.2594, df = 46, p-value = 0.2142
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -6.562834  1.511219
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  87.17949 
    ## 
    ## [1] "conf.int: -6.5628343798314" "conf.int: 1.51121932821635"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 88, p-value = 1.72e-05
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.134028 -2.978529
    ## sample estimates:
    ## difference in location 
    ##              -3.001376 
    ## 
    ## [1] "conf.int: -3.13402773117092" "conf.int: -2.97852854141872"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.9304, df = 46, p-value = 0.005256
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.42826657 -0.07948656
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.454939 
    ## 
    ## [1] "conf.int: -0.428266571035567" "conf.int: -0.0794865637056"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 338, p-value = 0.1701
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.701597e-05  2.142646e+00
    ## sample estimates:
    ## difference in location 
    ##             0.08858239 
    ## 
    ## [1] "conf.int: -3.70159736730921e-05" "conf.int: 2.14264557393971"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.2518, df = 46, p-value = 0.02915
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.53238870 -0.02982849
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.399573 
    ## 
    ## [1] "conf.int: -0.532388699711259"  "conf.int: -0.0298284948588765"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.0982, df = 46, p-value = 0.04141
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.50648201 -0.01050636
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.447336 
    ## 
    ## [1] "conf.int: -0.506482009032819"  "conf.int: -0.0105063601963801"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.094, df = 44, p-value = 0.04205
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.239223566 -0.004579912
    ## sample estimates:
    ## mean of x mean of y 
    ## 0.9563877 1.0782895 
    ## 
    ## [1] "conf.int: -0.239223566216667"   "conf.int: -0.00457991170325899"

## Hypothesis 4.2

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.5092, df = 43, p-value = 0.1386
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -1.282297  8.908497
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  80.84058 
    ## 
    ## [1] "p.value: 0.138567383919865"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 7.219e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1059253 -0.9064695
    ## sample estimates:
    ## difference in location 
    ##              -2.618049 
    ## 
    ## [1] "p.value: 7.21903110867568e-07"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.24675, df = 43, p-value = 0.8063
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2543627  0.1989038
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.228792 
    ## 
    ## [1] "p.value: 0.806276028088324"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 233.5, p-value = 0.8444
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08867824  0.08864445
    ## sample estimates:
    ## difference in location 
    ##          -5.547293e-06 
    ## 
    ## [1] "p.value: 0.844439832048813"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.033, df = 43, p-value = 0.04825
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.54830244 -0.00220907
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.393720 
    ## 
    ## [1] "p.value: 0.0482546462530344"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.9228, df = 43, p-value = 0.06114
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.52136049  0.01242422
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.443310 
    ## 
    ## [1] "p.value: 0.0611430027660279"
    ## [1] "No different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.8156, df = 42, p-value = 0.007383
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.8430003 -0.1390900
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.137582 
    ## 
    ## [1] "p.value: 0.00738294117729816"
    ## [1] "Different"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.5092, df = 43, p-value = 0.1386
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -1.282297  8.908497
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  80.84058 
    ## 
    ## [1] "statistic: 1.50917571883726"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 7.219e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1059253 -0.9064695
    ## sample estimates:
    ## difference in location 
    ##              -2.618049 
    ## 
    ## [1] "statistic: 44"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.24675, df = 43, p-value = 0.8063
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2543627  0.1989038
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.228792 
    ## 
    ## [1] "statistic: -0.24674990209552"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 233.5, p-value = 0.8444
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08867824  0.08864445
    ## sample estimates:
    ## difference in location 
    ##          -5.547293e-06 
    ## 
    ## [1] "statistic: 233.5"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.033, df = 43, p-value = 0.04825
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.54830244 -0.00220907
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.393720 
    ## 
    ## [1] "statistic: -2.03300814496277"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.9228, df = 43, p-value = 0.06114
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.52136049  0.01242422
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.443310 
    ## 
    ## [1] "statistic: -1.92281227430715"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.8156, df = 42, p-value = 0.007383
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.8430003 -0.1390900
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.137582 
    ## 
    ## [1] "statistic: -2.81561244375489"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## PERCENT30

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = 1.5092, df = 43, p-value = 0.1386
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -1.282297  8.908497
    ## sample estimates:
    ## mean of x mean of y 
    ##  84.65368  80.84058 
    ## 
    ## [1] "conf.int: -1.28229671241409" "conf.int: 8.90849659948357"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## KAPR

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 44, p-value = 7.219e-07
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -3.1059253 -0.9064695
    ## sample estimates:
    ## difference in location 
    ##              -2.618049 
    ## 
    ## [1] "conf.int: -3.10592528035946"  "conf.int: -0.906469541110769"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## DURATION

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## log transform

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -0.24675, df = 43, p-value = 0.8063
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.2543627  0.1989038
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.201063  2.228792 
    ## 
    ## [1] "conf.int: -0.25436269898988" "conf.int: 0.198903828594379"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## COMFORTABLE_INFO

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## No transformations worked. Returning original vector.

    ## wilcox test

    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact p-value with ties
    
    ## Warning in wilcox.test.default(x_1, x_2, conf.level = (1 - threshold_2), :
    ## cannot compute exact confidence intervals with ties

    ## 
    ##  Wilcoxon rank sum test with continuity correction
    ## 
    ## data:  x_1 and x_2
    ## W = 233.5, p-value = 0.8444
    ## alternative hypothesis: true location shift is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.08867824  0.08864445
    ## sample estimates:
    ## difference in location 
    ##          -5.547293e-06 
    ## 
    ## [1] "conf.int: -0.0886782364489467" "conf.int: 0.0886444479124502"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.033, df = 43, p-value = 0.04825
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.54830244 -0.00220907
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.118464  2.393720 
    ## 
    ## [1] "conf.int: -0.548302438631454"   "conf.int: -0.00220907031995212"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_RIGHT

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -1.9228, df = 43, p-value = 0.06114
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.52136049  0.01242422
    ## sample estimates:
    ## mean of x mean of y 
    ##  2.188842  2.443310 
    ## 
    ## [1] "conf.int: -0.521360493661131" "conf.int: 0.012424223485548"

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## MEAN_CONFIDENCE_WRONG

    ## >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

    ## normal without transforms

    ## regular two sample t test

    ## 
    ##  Two Sample t-test
    ## 
    ## data:  x_1 and x_2
    ## t = -2.8156, df = 42, p-value = 0.007383
    ## alternative hypothesis: true difference in means is not equal to 0
    ## 95 percent confidence interval:
    ##  -0.8430003 -0.1390900
    ## sample estimates:
    ## mean of x mean of y 
    ##  1.646537  2.137582 
    ## 
    ## [1] "conf.int: -0.843000348437725" "conf.int: -0.139090035925387"

## summary

Sorted by hypothesis.

    ## # A tibble: 42 x 7
    ##    hypothesis var        p_value statistic    conf_1    conf_2 is_different
    ##    <chr>      <chr>        <dbl>     <dbl>     <dbl>     <dbl> <chr>       
    ##  1 1          percent30  1.00e+0    0.773   -2.90e+0   6.50e+0 not_differe…
    ##  2 1          kapr       1.89e-6   44       -3.12e+0  -6.66e-1 different   
    ##  3 1          duration   1.00e+0   -0.197   -2.35e-1   1.94e-1 not_differe…
    ##  4 1          comforta…  1.00e+0  272       -8.86e-2   8.87e-2 not_differe…
    ##  5 1          mean_con…  6.57e-1   -1.41    -4.67e-1   8.20e-2 not_differe…
    ##  6 1          mean_con…  8.40e-1   -1.27    -4.50e-1   1.02e-1 not_differe…
    ##  7 1          mean_con…  4.30e-2   -2.67    -7.29e-1  -1.01e-1 different   
    ##  8 2          percent30  1.00e+0  327       -7.11e-2   2.89e-1 not_differe…
    ##  9 2          kapr       2.94e-1   -1.83    -1.37e+2   6.47e+0 not_differe…
    ## 10 2          duration   8.96e-1   -1.23    -3.30e+0   7.93e-1 not_differe…
    ## 11 2          comforta…  2.86e-1  372.      -1.72e-5   2.42e+0 not_differe…
    ## 12 2          mean_con…  1.00e+0   -0.119   -2.80e-1   2.49e-1 not_differe…
    ## 13 2          mean_con…  1.00e+0   -0.134   -2.81e-1   2.46e-1 not_differe…
    ## 14 2          mean_con…  1.00e+0    0.266   -2.94e-1   3.83e-1 not_differe…
    ## 15 3.1        percent30  1.00e+0  354.      -1.11e-1   2.24e-1 not_differe…
    ## 16 3.1        kapr       6.04e-1    1.46    -3.73e+1   2.35e+2 not_differe…
    ## 17 3.1        duration   8.62e-1   -1.25    -2.70e-1   6.23e-2 not_differe…
    ## 18 3.1        comforta…  1.00e+0  258.      -2.42e+0   7.21e-5 not_differe…
    ## 19 3.1        mean_con…  1.00e+0   -0.603   -3.15e-1   1.70e-1 not_differe…
    ## 20 3.1        mean_con…  1.00e+0   -0.565   -3.05e-1   1.71e-1 not_differe…
    ## 21 3.1        mean_con…  1.00e+0    0.0773  -1.15e-1   1.24e-1 not_differe…
    ## 22 3.2        percent30  4.72e-2    2.62     1.47e+0   1.12e+1 different   
    ## 23 3.2        kapr       5.58e-3   -3.46    -3.33e+2  -8.71e+1 different   
    ## 24 3.2        duration   1.09e-1    2.30     2.67e-2   4.26e-1 not_differe…
    ## 25 3.2        comforta…  9.46e-1  220.      -2.23e+0   6.22e-5 not_differe…
    ## 26 3.2        mean_con…  1.00e+0    0.0485  -2.37e-1   2.48e-1 not_differe…
    ## 27 3.2        mean_con…  1.00e+0    0.0343  -2.32e-1   2.40e-1 not_differe…
    ## 28 3.2        mean_con…  1.00e+0   -0.726   -1.69e-1   7.92e-2 not_differe…
    ## 29 4.1        percent30  8.57e-1   -1.26    -6.56e+0   1.51e+0 not_differe…
    ## 30 4.1        kapr       6.88e-5   88       -3.13e+0  -2.98e+0 different   
    ## 31 4.1        duration   2.10e-2   -2.93    -4.28e-1  -7.95e-2 different   
    ## 32 4.1        comforta…  6.81e-1  338       -3.70e-5   2.14e+0 not_differe…
    ## 33 4.1        mean_con…  1.17e-1   -2.25    -5.32e-1  -2.98e-2 not_differe…
    ## 34 4.1        mean_con…  1.66e-1   -2.10    -5.06e-1  -1.05e-2 not_differe…
    ## 35 4.1        mean_con…  1.68e-1   -2.09    -2.39e-1  -4.58e-3 not_differe…
    ## 36 4.2        percent30  5.54e-1    1.51    -1.28e+0   8.91e+0 not_differe…
    ## 37 4.2        kapr       2.89e-6   44       -3.11e+0  -9.06e-1 different   
    ## 38 4.2        duration   1.00e+0   -0.247   -2.54e-1   1.99e-1 not_differe…
    ## 39 4.2        comforta…  1.00e+0  234.      -8.87e-2   8.86e-2 not_differe…
    ## 40 4.2        mean_con…  1.93e-1   -2.03    -5.48e-1  -2.21e-3 not_differe…
    ## 41 4.2        mean_con…  2.45e-1   -1.92    -5.21e-1   1.24e-2 not_differe…
    ## 42 4.2        mean_con…  2.95e-2   -2.82    -8.43e-1  -1.39e-1 different

Sorted by p.value

    ## # A tibble: 42 x 7
    ##    hypothesis var        p_value statistic    conf_1    conf_2 is_different
    ##    <chr>      <chr>        <dbl>     <dbl>     <dbl>     <dbl> <chr>       
    ##  1 1          kapr       1.89e-6   44       -3.12e+0  -6.66e-1 different   
    ##  2 4.2        kapr       2.89e-6   44       -3.11e+0  -9.06e-1 different   
    ##  3 4.1        kapr       6.88e-5   88       -3.13e+0  -2.98e+0 different   
    ##  4 3.2        kapr       5.58e-3   -3.46    -3.33e+2  -8.71e+1 different   
    ##  5 4.1        duration   2.10e-2   -2.93    -4.28e-1  -7.95e-2 different   
    ##  6 4.2        mean_con…  2.95e-2   -2.82    -8.43e-1  -1.39e-1 different   
    ##  7 1          mean_con…  4.30e-2   -2.67    -7.29e-1  -1.01e-1 different   
    ##  8 3.2        percent30  4.72e-2    2.62     1.47e+0   1.12e+1 different   
    ##  9 3.2        duration   1.09e-1    2.30     2.67e-2   4.26e-1 not_differe…
    ## 10 4.1        mean_con…  1.17e-1   -2.25    -5.32e-1  -2.98e-2 not_differe…
    ## 11 4.1        mean_con…  1.66e-1   -2.10    -5.06e-1  -1.05e-2 not_differe…
    ## 12 4.1        mean_con…  1.68e-1   -2.09    -2.39e-1  -4.58e-3 not_differe…
    ## 13 4.2        mean_con…  1.93e-1   -2.03    -5.48e-1  -2.21e-3 not_differe…
    ## 14 4.2        mean_con…  2.45e-1   -1.92    -5.21e-1   1.24e-2 not_differe…
    ## 15 2          comforta…  2.86e-1  372.      -1.72e-5   2.42e+0 not_differe…
    ## 16 2          kapr       2.94e-1   -1.83    -1.37e+2   6.47e+0 not_differe…
    ## 17 4.2        percent30  5.54e-1    1.51    -1.28e+0   8.91e+0 not_differe…
    ## 18 3.1        kapr       6.04e-1    1.46    -3.73e+1   2.35e+2 not_differe…
    ## 19 1          mean_con…  6.57e-1   -1.41    -4.67e-1   8.20e-2 not_differe…
    ## 20 4.1        comforta…  6.81e-1  338       -3.70e-5   2.14e+0 not_differe…
    ## 21 1          mean_con…  8.40e-1   -1.27    -4.50e-1   1.02e-1 not_differe…
    ## 22 4.1        percent30  8.57e-1   -1.26    -6.56e+0   1.51e+0 not_differe…
    ## 23 3.1        duration   8.62e-1   -1.25    -2.70e-1   6.23e-2 not_differe…
    ## 24 2          duration   8.96e-1   -1.23    -3.30e+0   7.93e-1 not_differe…
    ## 25 3.2        comforta…  9.46e-1  220.      -2.23e+0   6.22e-5 not_differe…
    ## 26 1          percent30  1.00e+0    0.773   -2.90e+0   6.50e+0 not_differe…
    ## 27 1          duration   1.00e+0   -0.197   -2.35e-1   1.94e-1 not_differe…
    ## 28 1          comforta…  1.00e+0  272       -8.86e-2   8.87e-2 not_differe…
    ## 29 2          percent30  1.00e+0  327       -7.11e-2   2.89e-1 not_differe…
    ## 30 2          mean_con…  1.00e+0   -0.119   -2.80e-1   2.49e-1 not_differe…
    ## 31 2          mean_con…  1.00e+0   -0.134   -2.81e-1   2.46e-1 not_differe…
    ## 32 2          mean_con…  1.00e+0    0.266   -2.94e-1   3.83e-1 not_differe…
    ## 33 3.1        percent30  1.00e+0  354.      -1.11e-1   2.24e-1 not_differe…
    ## 34 3.1        comforta…  1.00e+0  258.      -2.42e+0   7.21e-5 not_differe…
    ## 35 3.1        mean_con…  1.00e+0   -0.603   -3.15e-1   1.70e-1 not_differe…
    ## 36 3.1        mean_con…  1.00e+0   -0.565   -3.05e-1   1.71e-1 not_differe…
    ## 37 3.1        mean_con…  1.00e+0    0.0773  -1.15e-1   1.24e-1 not_differe…
    ## 38 3.2        mean_con…  1.00e+0    0.0485  -2.37e-1   2.48e-1 not_differe…
    ## 39 3.2        mean_con…  1.00e+0    0.0343  -2.32e-1   2.40e-1 not_differe…
    ## 40 3.2        mean_con…  1.00e+0   -0.726   -1.69e-1   7.92e-2 not_differe…
    ## 41 4.2        duration   1.00e+0   -0.247   -2.54e-1   1.99e-1 not_differe…
    ## 42 4.2        comforta…  1.00e+0  234.      -8.87e-2   8.86e-2 not_differe…
