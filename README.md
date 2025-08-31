**Survival Analysis Project**
 **Project Overview**

This project applies Survival Analysis techniques on the veteran lung cancer dataset to study factors that influence patient survival. I used Kaplan-Meier estimators, Cox proportional hazards models, and interaction effects to explore how treatment type, age, performance score, and tumor cell type affect survival outcomes.

 **Methods & Tools**

R Programming (survival package)

Kaplan-Meier Curves for group comparisons

Cox Proportional Hazards Model (unadjusted & with interactions)

Forest plots for visualizing hazard ratios

Predicted survival curves for example patients

 **Key Results & Insights**

Treatment Effect: The experimental “Test” treatment did not significantly improve survival compared to the standard treatment.

Performance Status (Karnofsky Score): Strongest predictor of survival — patients with higher scores had consistently better outcomes.

Tumor Cell Type: Adeno and Small Cell types had much poorer survival compared to Squamous and Large cell tumors.

Interactions: The effect of treatment varied by tumor type, especially for Small Cell patients, highlighting potential treatment-specific biology.

Model Fit: The Cox model achieved good concordance (~0.73), showing reliable predictive ability.

** Example Prediction**

For a 65-year-old patient with a Karnofsky score of 80 and Small Cell cancer, the model predicted a median survival of ~133 days, with a hazard ratio slightly above 1 compared to baseline.

** Visualizations**

Kaplan-Meier survival curves by tumor type and performance score

Adjusted survival curves by treatment

Forest plots of hazard ratios

Predicted survival curve for a sample patient

 **Takeaways**

Clinical characteristics (tumor type, performance status) have much greater influence on survival than treatment type in this dataset.

Survival analysis is a powerful tool for healthcare analytics, going beyond averages to model time-to-event outcomes.

This project strengthened my skills in statistical modeling, medical data interpretation, and R visualization.
