# Hospital Admissions SQL Analysis

## Project Overview

This project analyzes a fictional hospital admissions dataset using SQL in Google BigQuery. The goal was to explore hospital utilization patterns, length of stay, and 30-day readmissions while identifying trends that could help guide further investigation.

The analysis focuses on questions relevant to healthcare operations and nursing informatics, including differences in readmission rates by hospital unit, admission type, discharge disposition, diagnosis group, and patient age.

All data used in this project is fictional and contains no protected health information (PHI).

## Skills & Tools

- **SQL:** SELECT, WHERE, COUNT, COUNTIF, AVG, ROUND, GROUP BY, ORDER BY, HAVING, CASE WHEN
- **Google BigQuery:** Querying and analyzing structured healthcare data
- **Healthcare Data Analysis:** Length of stay, hospital utilization, and 30-day readmission analysis
- **Data Interpretation:** Comparing counts and rates, evaluating sample sizes, and identifying potential confounding factors
- **Clinical Informatics:** Applying clinical knowledge to identify meaningful questions for further investigation

## Key Questions

The analysis explored the following questions:

1. Which hospital units had the highest number of admissions?
2. Which units had the longest average length of stay?
3. How did 30-day readmission rates differ across hospital units?
4. Did readmission rates differ by discharge disposition?
5. Among patients discharged to a Skilled Nursing Facility, did readmission rates differ by diagnosis group?
6. Did patients who were readmitted have a different average initial length of stay?
7. Did readmission rates differ by admission type?
8. How did readmission rates vary across patient age groups?
9. Which combinations of admission type and discharge disposition had the highest readmission rates?
10. Among Emergency admissions, how did readmission rates differ by discharge disposition?

 ## Key Findings

- **Hospital utilization:** Medical had the highest number of admissions with 71, while ICU had the fewest with 45.

- **Readmissions by unit:** ICU had the highest observed 30-day readmission rate at 20.0%, despite Medical having the highest number of readmissions. This demonstrates the importance of comparing rates rather than counts alone.

- **Discharge disposition:** Patients discharged to a Skilled Nursing Facility had the highest observed readmission rate at 29.6% (16 of 54 admissions).

- **SNF diagnosis patterns:** Among Skilled Nursing Facility discharges, the Cardiac diagnosis group had the highest observed readmission rate at 71.4% (5 of 7). However, the small sample size limits how much can be concluded from this finding.

- **Length of stay:** Patients who were readmitted within 30 days had a slightly longer average initial length of stay (5.5 days) than patients who were not readmitted (5.1 days).

- **Admission type:** Emergency admissions had the highest observed readmission rate at 20.5%, compared with 16.2% for Transfer admissions and 14.9% for Elective admissions.

- **Age:** Patients ages 50–64 had the highest observed readmission rate at 23.8%. Readmission rates did not consistently increase with age in this dataset.

- **Emergency admissions:** Among Emergency admissions, patients discharged to a Skilled Nursing Facility had the highest observed readmission rate at 28.6% (10 of 35 admissions).

 ## Interpretation & Limitations

The results of this analysis identify patterns and associations within the dataset but do not establish causation. Differences in readmission rates may be influenced by factors that are not available in the dataset.

Important limitations include:

- **Fictional dataset:** The data was created for educational purposes and does not represent an actual hospital population.
- **Small sample sizes:** Some subgroups contain relatively few admissions. For example, the Cardiac group among Skilled Nursing Facility discharges contained only seven admissions, making the 71.4% observed readmission rate less reliable for drawing broader conclusions.
- **Patient complexity:** The dataset does not include detailed information about comorbidities, illness severity, functional status, or other clinical factors that may influence readmission risk.
- **Readmission reason:** The dataset identifies whether a patient was readmitted within 30 days but does not include the reason or diagnosis associated with the readmission. Therefore, it is not possible to determine whether the readmission was related to the original hospitalization.
- **Association vs. causation:** Higher observed readmission rates among certain groups, such as patients discharged to Skilled Nursing Facilities, should not be interpreted as evidence that the discharge destination caused the readmission.
- **Further investigation:** Findings from this analysis could be used to identify areas for additional review using larger datasets and more detailed clinical information.

 ## Project Files

- `hospital_admissions_analysis.sql` - Complete SQL analysis containing all queries used in this project.


 ## About This Project

This project was completed as part of my nursing informatics portfolio to demonstrate the application of SQL and clinical reasoning to healthcare data. My background in nursing informed the questions explored in the analysis, while SQL was used to investigate patterns in hospital utilization and 30-day readmissions.
