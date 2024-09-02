select 
	MONTH(issue_date) as month_number,
	DATENAME(MONTH, issue_date) as month,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by MONTH(issue_date), DATENAME(MONTH, issue_date)
order by MONTH(issue_date)

select 
	address_state,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by address_state
order by address_state

select 
	term,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by term
order by term

select 
	emp_length,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by emp_length
order by emp_length

select 
	purpose,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by purpose
order by purpose

select 
	home_ownership,
	count(id) as total_loans,
	sum(total_payment) as total_amount_received,
	sum(loan_amount) as total_amount_funded
from bank_loan
group by home_ownership
order by home_ownership

select * from bank_loan	