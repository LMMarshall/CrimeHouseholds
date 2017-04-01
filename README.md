# CrimeHouseholds
Violent crime in households with children (data from National Crime Victimization Survey via data.gov)

This dataset initially looked very interesting. It records the number of violent crimes in U.S. households with children and breaks this down by the gender and race of the head of household. However, it has a number of problems:
* The crimes are broken down into 'serious violent crime' and 'simple assault'. There's also data on totals. But the total figures are larger than the two sub-figures combined with no clear explanation for the discrepancy. 
* The data doesn't represent actual counts of crimes. Samples of populations were surveyed and then weighted to represent the full U.S. population. You can find more about the process here: https://www.bjs.gov/index.cfm?ty=dcdetail&iid=245. And you can view the actual survey here: https://www.bjs.gov/content/pub/pdf/ncvs2_2014.pdf.
* Data for several of the head-of-household race subgroups (Asian/Pacific Islander, Mixed-Race, and Native American) is so sparse it seems misleading to include it, so I didn't. Data for black male head of households was very sparse for a number of the years given (sparse meaning that the data is based on 10 or fewer incident reports); I included it with a caveat.
* There was no clear documentation accompanying the dataset. So it must be interpreted with caution. It's easy, for example, to assume the crimes tallied here were against children (in fact, they are against individuals 12 and older, including adults). It's also easy to assume that the gender column ('Sex') lists the gender of the person who carried out the crime, whereas it is instead the gender of the head of the household where the crime took place. There doesn't seem to be any record of whether children were present during the incidents; instead the data just tracks households where children live.

The data took quite a bit of manipulation, since the same incidents were counted in several categories (once as a factor of gender, once as a factor of race, once as a factor of the total, etc). I had to make judgement calls on where those duplicates were, and while I think I made them accurately, there's the potential for error there. 


