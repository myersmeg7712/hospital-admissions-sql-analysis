-- Hospital Admissions SQL Analysis
-- Dataset: Fictional hospital admission data
-- Purpose: Explore hospital utilization, length of stay, and 30-day readmissions.
-- This dataset is fictional and contains no protected health information (PHI).


-- ============================================================
-- 1. TOTAL ADMISSIONS BY UNIT
-- Question: Which hospital units had the highest number of admissions?
-- ============================================================

SELECT
    unit,
    COUNT(*) AS total_admissions
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY unit
ORDER BY total_admissions DESC;

-- ============================================================
-- 2. AVERAGE LENGTH OF STAY BY UNIT
-- Question: Which hospital units had the longest average length of stay?
-- ============================================================

SELECT
    unit,
    ROUND(AVG(length_of_stay_days), 1) AS average_length_of_stay
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY unit
ORDER BY average_length_of_stay DESC;

-- ============================================================
-- 3. 30-DAY READMISSION RATE BY UNIT
-- Question: Which hospital units had the highest 30-day readmission rates?
-- ============================================================

SELECT
    unit,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY unit
ORDER BY readmission_rate DESC;

-- ============================================================
-- 4. 30-DAY READMISSION RATE BY DISCHARGE DISPOSITION
-- Question: Does the 30-day readmission rate differ by discharge destination?
-- ============================================================

SELECT
    discharge_disposition,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY discharge_disposition
ORDER BY readmission_rate DESC;

-- ============================================================
-- 5. SNF READMISSION RATE BY DIAGNOSIS GROUP
-- Question: Among patients discharged to a Skilled Nursing
-- Facility, which diagnosis groups had the highest observed
-- 30-day readmission rates?
-- ============================================================

SELECT
    diagnosis_group,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
WHERE discharge_disposition = 'Skilled Nursing Facility'
GROUP BY diagnosis_group
ORDER BY readmission_rate DESC;

-- ============================================================
-- 6. AVERAGE LENGTH OF STAY BY READMISSION STATUS
-- Question: Did patients who were readmitted within 30 days
-- have a different average initial length of stay?
-- ============================================================

SELECT
    readmission_30d,
    COUNT(*) AS total_admissions,
    ROUND(AVG(length_of_stay_days), 1) AS average_length_of_stay
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY readmission_30d
ORDER BY readmission_30d DESC;

-- ============================================================
-- 7. 30-DAY READMISSION RATE BY ADMISSION TYPE
-- Question: Does the 30-day readmission rate differ by
-- admission type?
-- ============================================================

SELECT
    admission_type,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY admission_type
ORDER BY readmission_rate DESC;

-- ============================================================
-- 8. 30-DAY READMISSION RATE BY AGE GROUP
-- Question: Does the 30-day readmission rate differ across
-- patient age groups?
-- ============================================================

SELECT
    CASE
        WHEN age < 50 THEN 'Under 50'
        WHEN age BETWEEN 50 AND 64 THEN '50-64'
        WHEN age BETWEEN 65 AND 79 THEN '65-79'
        ELSE '80+'
    END AS age_group,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY age_group
ORDER BY readmission_rate DESC;

-- ============================================================
-- 9. READMISSION RATE BY ADMISSION TYPE AND DISCHARGE DISPOSITION
-- Question: Which combinations of admission type and discharge
-- disposition had the highest 30-day readmission rates among
-- groups with at least 20 admissions?
-- ============================================================

SELECT
    admission_type,
    discharge_disposition,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
GROUP BY admission_type, discharge_disposition
HAVING COUNT(*) >= 20
ORDER BY readmission_rate DESC;

-- ============================================================
-- 10. EMERGENCY ADMISSIONS BY DISCHARGE DISPOSITION
-- Question: Among Emergency admissions, which discharge
-- dispositions had the highest 30-day readmission rates?
-- ============================================================

SELECT
    discharge_disposition,
    COUNT(*) AS total_admissions,
    COUNTIF(readmission_30d = TRUE) AS readmissions,
    ROUND(COUNTIF(readmission_30d = TRUE) / COUNT(*) * 100, 1) AS readmission_rate
FROM `nurse-analyst.hospital_admissions.admissions`
WHERE admission_type = 'Emergency'
GROUP BY discharge_disposition
ORDER BY readmission_rate DESC;
