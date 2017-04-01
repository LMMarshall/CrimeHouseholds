CrimeAppPresentation
========================================================
author: LMMarshall
date: 4/1/2017
autosize: true

Violent Crime in Households with Children
========================================================



- An interactive plotting app 
- Estimates violent crimes in U.S. households with children 2000-2012
- Based on National Crime Victimization Survey data

Usage
========================================================


The app lets you view the number of incidents of violent crime in households with children (with victims ages 12 and older) broken down by the gender and race of the head of the household. 

Select the **severity of crime** and the **gender of the head of household** and hit the "plot" button to see the data.

Caveats
========================================================
The app **doesn't show national totals**, since the data for several populations (Native American, mixed race, and Asian/Pacific Islander) is incomplete or of very low quality.

**Incidence counts are not actual counts** but estimates based on sample populations. For some populations (e.g., black male heads of household), the data for many of the years is based on **10 or fewer sample cases**. Specifically, this problem affects


```
[1] 200
```
records out of a total of

```
[1] 468
```


Interpretation
========================================================


The data **does not represent violent crimes against children** specifically. It represents violent crimes committed inside households where children live. The victims of these crimes mapped in this data were all aged 12 and older -- into adulthood. 

**One use for this data is to get a general sense of how many U.S. children are being exposed to violence in the home** and couple that information with insights about any mental and physical health ramifications, ability to thrive, and success in school and/or society. 

Give it a try
========================================================

Access the app at:
https://lmmarshall.shinyapps.io/crime_households/

