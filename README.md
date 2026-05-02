# Flight Delay Analysis: Operational Performance and System Patterns

Flight delays are not random. This analysis shows that delays follow predictable system patterns driven by accumulation and extreme events, not traffic volume.

---

## Dashboard Preview

### System Overview

<img width="2075" height="1200" alt="Flight_Delay_Analysis_v2_Dash_page-0001" src="https://github.com/user-attachments/assets/566d8acd-c955-4595-84ea-2124c7782763" />

### Airport-Level Analysis

<img width="2075" height="1200" alt="Flight_Delay_Analysis_v2_Dash_page-0002" src="https://github.com/user-attachments/assets/c69bb79e-2092-4c8e-9055-a968af588f17" />

---
## Reports

This project includes two versions of the analysis:

### Analytical Report
A detailed, step-by-step breakdown of the methodology, queries, and statistical analysis.

### McKinsey-Style Report
A concise, decision-focused version emphasizing key findings, insights, and recommendations.

- [Analytical Report](analytical_report.md)
- [McKinsey-Style Report](mckinsey_style_report.md)

---
## Skills Demonstrated

- SQL: complex aggregations, window functions, percentile calculations (P95)
- Statistical analysis: correlation, distribution analysis, variability (standard deviation)
- Data modeling: filtering for reliability (volume thresholds), structured aggregation
- Data visualization: Power BI dashboard design for decision-making
- Analytical thinking: identifying system-level patterns (accumulation, skew, extreme events)
- Business insight: translating data into operational recommendations
---
## 1. Overview

This project analyzes flight delays using the 2015 Flight Delays dataset to determine whether delays occur randomly or follow predictable patterns.

The analysis focuses on delay behavior rather than root causes and examines how delays evolve across time, volume, distribution, and airport-level performance.

---

## 2. Key Findings

* Delays are not random and follow consistent system-level patterns
* Delays accumulate over time and peak during evening operations
* Flight volume has minimal impact on delays (correlation = -0.13)
* Extreme delays (P95 = 67 minutes) drive overall system performance
* Airport performance varies due to stability and operational efficiency rather than traffic volume

---

## 3. Analytical Approach

The analysis evaluates delay behavior across four dimensions:

1. Time-Based Patterns — how delays evolve throughout the day
2. Volume vs Delay — relationship between traffic and performance
3. Distribution Analysis — understanding skew and extreme delays
4. Airport-Level Analysis — comparing performance, variability, and risk

---

## 4. Dashboard

The Power BI dashboard translates statistical findings into visual insights for decision-making.

### 4.1 System Overview (Page 1)

* Time-based delay accumulation
* Weak relationship between volume and delay
* Distribution analysis highlighting extreme delay impact

### 4.2 Airport-Level Analysis (Page 2)

* Volume vs delay comparison
* Extreme delay ranking (P95)
* Performance vs stability comparison

*See dashboard preview above for visuals

---

## 5. SQL Workflow

The analysis is structured into modular SQL queries:

| File | Purpose |
|------|--------|
| [01_data_preparation.sql](sql/01_data_preparation.sql) | Clean dataset by removing NULL delays |
| [02_feature_engineering.sql](sql/02_feature_engineering.sql) | Extract departure hour |
| [03_time_segmentation.sql](sql/03_time_segmentation.sql) | Define operational time segments |
| [04_timebased_delay_analysis.sql](sql/04_timebased_delay_analysis.sql) | Analyze delays by time segment |
| [05_hourly_aggregation.sql](sql/05_hourly_aggregation.sql) | Aggregate hourly metrics |
| [06_corr_volumedelay.sql](sql/06_corr_volumedelay.sql) | Compute volume-delay correlation |
| [07_corr_segment.sql](sql/07_corr_segment.sql) | Correlation by time segment |
| [08_distribution.sql](sql/08_distribution.sql) | Distribution metrics (median, P95, etc.) |
| [09_airport_level_aggregation.sql](sql/09_airport_level_aggregation.sql) | Airport performance metrics |
| [10_top_airports_extreme_delay.sql](sql/10_top_airports_extreme_delay.sql) | Rank airports by extreme delays |

---

## 6. Key Insights

### 6.1 Delay Accumulation

Delays remain relatively stable during early hours but increase throughout the day, peaking during evening operations due to accumulated disruptions.

### 6.2 Volume Is Not the Primary Driver

The weak correlation between flight volume and delay (-0.13) indicates that operational efficiency, rather than traffic volume, is the primary driver of delay performance.

### 6.3 Extreme Delays Drive System Impact

The delay distribution is highly skewed. While the median delay is low, extreme delays significantly impact overall system performance.

### 6.4 Airport Performance Differences

Airports with similar average delays exhibit significant differences in variability and extreme delays, highlighting differences in operational stability.

---

## 7. Recommendations

1. Stabilize early-day operations to prevent delay propagation
2. Focus on high-impact delays (greater than 60 minutes)
3. Optimize evening operations where delays peak
4. Implement real-time monitoring for early intervention

---

## 8. Limitations

* Analysis is limited to 2015 data
* Root causes of delays (e.g., weather, carrier) are not included
* External operational constraints are not explicitly modeled

---

## 9. Tools Used

* SQL Server for data extraction and analysis
* Power BI for visualization and dashboard development
* Excel for data validation

---

## 10. Next Steps

A follow-up project will focus on root cause analysis of flight delays, including factors such as weather, carrier performance, and airspace congestion.

---

## 11. Author

Consolador M. Plaza, Jr

---

## 12. Key Takeaway

Flight delays behave as a connected system driven by accumulation and extreme events rather than random disruptions or traffic volume alone.
