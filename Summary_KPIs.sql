select count(id) as total_loan_applications from bank_loan 
select count(id) as MTD_total_loan_applications from bank_loan where MONTH(issue_date)= MONTH(CURRENT_TIMESTAMP)
select count(id) as prev_MTD_total_loan_applications from bank_loan where MONTH(issue_date)= 7

select sum(loan_amount) as total_funded_amount from bank_loan
select sum(loan_amount) as MTD_total_funded_amount from bank_loan where MONTH(issue_date)= MONTH(current_timestamp)
select sum(loan_amount) as prev_MTD_total_funded_amount from bank_loan where MONTH(issue_date)= 7

select sum(total_payment) as total_reveived_amount from bank_loan
select sum(total_payment) as MTD_total_received_amount from bank_loan where MONTH(issue_date)= MONTH(current_timestamp)
select sum(total_payment) as prev_MTD_total_received_amount from bank_loan where MONTH(issue_date)= 7

select round(avg(int_rate),4)*100 as avg_interest_rate from bank_loan
select round(avg(int_rate),4)*100 as MTD_avg_interest_rate from bank_loan where MONTH(issue_date)= MONTH(current_timestamp)
select round(avg(int_rate),4)*100 as prev_MTD_avg_interest_rate from bank_loan where MONTH(issue_date)= 7

select round(avg(dti),4)*100 as avg_DTI from bank_loan
select round(avg(dti),4)*100 as MTD_avg_DTI from bank_loan where MONTH(issue_date)= MONTH(current_timestamp)
select round(avg(dti),4)*100 as prev_MTD_avg_DTI from bank_loan where MONTH(issue_date)= 7

--Good Loans
/*select 
	(count(case when loan_status='Fully Paid' or loan_status='Current' then id end)* 100)
	/ 
	count(id) as good_loan_percentage
from bank_loan*/

select count(loan_status) as good_loans from bank_loan where loan_status='Fully Paid' or loan_status='Current'

select sum(loan_amount) as good_loans_funded from bank_loan where loan_status='Fully Paid' or loan_status='Current'

select sum(total_payment) as good_loans_received from bank_loan where loan_status='Fully Paid' or loan_status='Current'


--Bad Loans
select 
	(count(case when loan_status='Charged Off' then id end)* 100.0)
	/ 
	count(id) as bad_loan_percentage
from bank_loan

select count(loan_status) as bad_loans from bank_loan where loan_status='Charged Off'

select sum(loan_amount) as bad_loans_funded from bank_loan where loan_status='Charged Off'

select sum(total_payment) as bad_loans_received from bank_loan where loan_status='Charged Off'

--Loan Status

select 
	loan_status,
	count(id) as loancount,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded,
	avg(int_rate *100) as interest_rate,
	avg(dti *100) as DTI
from
	bank_loan
group by loan_status

select 
	loan_status,
	sum(total_payment) as MTD_total_amount_received,
	sum(loan_amount) as MTD_total_amount_funded
from
	bank_loan
where MONTH(issue_date) = MONTH(current_timestamp)
group by loan_status
