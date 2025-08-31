# Survival Analysis Project  

## Project Overview  
In this project, I worked with the **veteran lung cancer dataset** to understand what factors influence patient survival. I applied survival analysis methods like **Kaplan-Meier curves** and **Cox proportional hazards models** to compare treatments, performance scores, and tumor types. I also looked at interaction effects to see how treatment responses varied across different subgroups.  

## Methods & Tools  
- R (survival package)  
- Kaplan-Meier curves for group survival comparison  
- Cox proportional hazards model (with and without interactions)  
- Forest plots to visualize hazard ratios  
- Survival curve predictions for individual patients  

## Key Results & Insights  
- The experimental *Test* treatment didn’t show a significant survival benefit over the standard one.  
- **Karnofsky performance score** was the strongest predictor of survival — patients with higher scores lived longer.  
- Tumor type made a big difference: Small Cell and Adeno cancers were linked with much poorer outcomes than Squamous or Large cell.  
- When I added interactions, I noticed treatment effects varied by tumor type, especially for Small Cell patients.  
- The Cox model had a concordance of about 0.73, which means it could rank patients by survival risk reasonably well.  

## Example Prediction  
For a **65-year-old patient** with a **Karnofsky score of 80** and **Small Cell cancer**, the model predicted:  
- Median survival: ~133 days  
- Hazard ratio slightly above 1 (so, higher risk than baseline)  

## Visualizations  
- Kaplan-Meier curves by tumor type and performance score  
- Adjusted survival curves comparing treatments  
- Forest plots of hazard ratios  
- Predicted survival curves for sample patients  

## Takeaways  
This project showed me how powerful survival analysis is in medical research. Instead of just looking at averages, it helps explain how different factors affect *time-to-event* outcomes. The main lesson here was that **clinical factors (tumor type and performance status) mattered much more than treatment type**.  

It was a great way to practice working with real-world data, build survival models in R, and create visualizations that make results easy to understand.  
