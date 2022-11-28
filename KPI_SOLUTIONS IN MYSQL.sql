use yashraj;

select * from finance_1;

select * from finance_2;

/* KPI_1 :- Year wise loan amount Stats*/


select YEAR(STR_TO_DATE(issue_d, '%d-%m-%Y')) as year, sum(loan_amnt) as Total_Loan_amnt 
from finance_1 
group by YEAR(STR_TO_DATE(issue_d, '%d-%m-%Y'));


/* KPI_2 :- Grade and sub grade wise revol_bal */

select grade, sub_grade,sum(revol_bal) as Total_revol_bal
from finance_1 inner join finance_2 
on(finance_1.id = finance_2.id) 
group by grade,sub_grade
order by grade;

/* KPI_3 :- Total Payment for Verified Status Vs Total Payment for Non Verified Status */

select verification_status, round(sum(total_pymnt),2) as Total_payment
from finance_1 inner join finance_2 
on(finance_1.id = finance_2.id) 
where verification_status in('Verified', 'Not Verified')
group by verification_status;

/* KPI_4 :- State wise and last_credit_pull_d wise loan status - Final */

select distinct addr_state as States,loan_status
,MAX(DATE_FORMAT(STR_TO_DATE(last_credit_pull_d, '%b-%y'),'%Y-%m')) OVER(PARTITION BY addr_state) as latest_credit_pull_date
from finance_1 inner join finance_2 
on(finance_1.id = finance_2.id) 
group by addr_state, DATE_FORMAT(STR_TO_DATE(last_credit_pull_d, '%b-%y'),'%Y'),loan_status;


/* KPI_5 :- Home ownership Vs last payment date stats */

select home_ownership
,MAX(DATE_FORMAT(STR_TO_DATE(last_pymnt_d, '%b-%y'),'%Y-%m'))
from finance_1 inner join finance_2 
on(finance_1.id = finance_2.id) 
group by home_ownership #, DATE_FORMAT(STR_TO_DATE(last_pymnt_d, '%b-%y'),'%Y')
order by home_ownership;

