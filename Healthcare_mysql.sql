create database healthcare;
select * from patients;

#TOTAL Patients
select count(First_Name) from patients;
#TOTAL doctors
select count(*) AS Total_doctors from doctors;

#TOTAL visit
select count(*) AS Total_visit from visit;

select round(avg(age),0) as average_age from patients;

#Top 5 diagnosed condition
select Diagnosis,count(*) as Total_diagnosed_condition from visit group by diagnosis order by total_diagnosed_condition desc limit 5;

#follow-up rate
select concat(round((select count(*) from visit group by Follow_Up_Required having Follow_Up_Required ="Yes")*100
/(select count(*) from visit),2),"%") as follow_up_rate;

#treatment cost per visit
select round(avg(treatment_cost),0)as avg_cost from treatment;

#Total Lab test conducted
select count(*) as total_lab_test_conducted from lab_result;

#percentage of abnormal test result
select concat(round((select count(*) from lab_result group by test_result having test_result="abnormal")*100/
(select count(*) from lab_result),2),"%") as abnormal_test_result;

#doctor workload 
WITH CTE AS (
    SELECT Doctor_ID, COUNT(*) AS PATIENTS_PER_DOCTOR
    FROM visit
    GROUP BY Doctor_ID
)
SELECT ROUND(AVG(PATIENTS_PER_DOCTOR),0) AS DOCTORS_WORKLOAD
FROM CTE;

#Total Revenue
select concat(round((sum(treatment_cost)+sum(cost))/1000000,2),"M") as Total_revenue from treatment;

