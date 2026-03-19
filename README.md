**IBM HR Analytics — Workforce & Attrition Analysis**

**Problem Statement:**
HR teams lack visibility into which employees are at risk of leaving and why, 
making it difficult to intervene before attrition occurs and revenue is lost 
through rehiring and retraining costs.

**Proposed Solution:**
An end-to-end analytics pipeline that queries employee records, flags retention 
risk, builds a predictive attrition model, and delivers actionable dashboards 
for HR and People Analytics teams.

**Key Findings:**
- **16.1% overall attrition rate** across 1,470 employees
- **56 employees flagged as high retention risk** based on satisfaction and overtime signals
- **Sales department** leads attrition at 20.6% — nearly 1 in 5 employees leaving
- **0-2 year employees** at highest churn risk — 29.8% attrition rate
- Employees who left earned **$2,045/month less** than those who stayed
- **Overtime, frequent travel, and low job satisfaction** are top attrition drivers
- Model achieved **ROC-AUC of 0.79** on holdout test set

**Dataset Overview:**
Public dataset simulating realistic HR operational data for a mid-size enterprise.
- **Total Records:** 1,470 employees
- **Features:** 35 attributes per employee
- **Target:** Binary attrition label (Yes/No)
- **Source:** [IBM HR Analytics Dataset — Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)

**Tech Stack:**
| Layer | Tool |
|---|---|
| Data Storage | SQL Server (SSMS) |
| SQL Analysis | T-SQL |
| ML Model | Python (scikit-learn, pandas) |
| Visualization | Tableau Public |
| Version Control | GitHub |

**Project Structure:**
```
Employee-Attrition-Analytics/
├── SQL/
│   ├── tenure_trends.sql               ** Avg tenure by department
│   ├── attrition_by_department.sql     ** Attrition rate by department
│   ├── tenure_cohorts.sql              ** Attrition by tenure bucket
│   ├── income_vs_attrition.sql         ** Avg income by attrition status
│   └── retention_risk_flags.sql        ** High/Medium/Low risk flagging
│
├── Python/
│   └── attrition_model.py              ** Logistic regression model
│
├── Outputs/
│   └── attrition_predictions.csv       ** Model predictions (294 test records)
│
└── README.md
```

**Data Lineage:**
Raw CSV → SQL Server (SSMS) → T-SQL Analysis → Python Model → Tableau Dashboards

**SQL Analysis:**
- Tenure trends by department
- Attrition rate by department and job role
- Tenure cohort analysis (0-2, 3-5, 6-10, 10+ years)
- Income gap analysis (left vs stayed)
- High risk employee flagging using satisfaction and overtime logic

**Python Model**
- Logistic Regression with StandardScaler normalization
- Train/Test Split: 80/20
- **ROC-AUC: 0.79**
- Top attrition drivers: Overtime, Business Travel, Years at Company
- Top retention factors: Years in Current Role, Job Satisfaction, Environment Satisfaction

**Tableau Dashboard**
[View Live Dashboard](https://public.tableau.com/app/profile/lakshmi14k/viz/EmployeeAttritionAnalytics_17738539332290/WorkforceOverview)

**3 dashboards:**
- **Workforce Overview** — Headcount, attrition rate, department breakdown
- **Attrition Cohorts** — Tenure buckets, age groups, overtime analysis
- **Retention Risk** — Income gap, job satisfaction, top risk drivers

**Results**
- 1,470 employee records analyzed
- 5 SQL scripts covering tenure, attrition, income, and risk flagging
- 1 logistic regression model with 0.79 ROC-AUC
- 56 high-risk employees identified for immediate HR intervention
- 3 Tableau dashboards delivering actionable insights
