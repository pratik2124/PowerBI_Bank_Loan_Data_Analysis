USE bank_loan_data;
SELECT * FROM bank_loan_data;

	----> TOTAL LOAN APPLICATIONS

	SELECT COUNT(id) AS Total_Loan_Applications FROM bank_loan_data;

	---> TOTAL FUNDED AMOUNT

	SELECT SUM(loan_amount) AS Total_Funded_Amount FROM bank_loan_data;	

	---> TOTAL AMOUNT RECEIVED 

	SELECT SUM(total_payment) AS Total_Amount_Received FROM bank_loan_data;

	---> AVERAGE INTEREST RATE

	SELECT AVG(int_rate) * 100 AS Avg_Interest_Rate FROM bank_loan_data; 

	---> AVERAGE DEBT-TO-INCOME RATIO (DTI)

	SELECT AVG(dti) * 100 AS Avg_DTI FROM bank_loan_data; 

	---> GOOD LOAN PERCENTAGE 

	SELECT 
		(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END ) * 100)
		/
		COUNT(id) AS Good_Loan_Percentage
		FROM bank_loan_data

	--->  GOOD LOAN APPLICATIONS

		SELECT COUNT(id) AS Good_Loan_Applications FROM bank_loan_data
		WHERE loan_status = 'Fully Paid' OR loan_status = 'CURRENT';

	--->  GOOD LOAN FUNDED AMOUNT

		SELECT SUM(loan_amount) AS Good_Loan_Funded_Amount FROM bank_loan_data 
		WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

	--->  GOOD LOAN TOTAL RECEIVED AMOUNT 

		SELECT SUM(total_payment) AS Good_Loan_Received_Amount FROM bank_loan_data
		WHERE loan_status = 'Fully Paid' OR loan_status = 'Current';

	--->  BAD LOAN PERCENTAGE 
	
		SELECT		
				(COUNT(CASE WHEN loan_status = 'Charged Off' THEN id END) * 100) / 
					COUNT(id) AS Bad_Loan_Percentage 
				FROM bank_loan_data; 

	--->  BAD LOAN APPLICATIONS 

		SELECT COUNT(id) AS Bad_Loan_Applications FROM bank_loan_data 
		WHERE loan_status = 'Charged Off';

	--->  BAD LOAN FUNDED AMOUNT

		SELECT SUM(loan_amount) AS Bad_Loan_Funded_Amount FROM bank_loan_data 
		WHERE loan_status = 'Charged Off';
	
	--->  BAD LOAN RECEIVED AMOUNT 

		SELECT SUM(total_payment) AS Bad_Loan_Received_Amount FROM bank_loan_data
		WHERE loan_status = 'Charged Off'; 

	--->  LOAN STATUS

		SELECT 
				loan_status,
				COUNT(id) AS Total_Loan_Applications,
				SUM(total_payment) AS Total_Amount_Received,
				SUM(loan_amount) AS Total_Funded_Amount,
				AVG(int_rate * 100) AS Interest_Rate,
				AVG(dti * 100) AS DTI
			FROM 
				bank_loan_data
			GROUP BY 
				loan_status;
		
		--->  MONTHLY TRENDS BY ISSUE DATE

			SELECT
					MONTH(issue_date) AS Month_Number,
					DATENAME(Month, issue_date) AS Month_Name,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY MONTH(issue_date), DATENAME(MONTH, issue_date)
			ORDER BY MONTH(issue_date);

		--->  REGIONAL ANALYSIS BY STATE

			SELECT 
					address_state,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY address_state
			ORDER BY address_state;
		
		--->  LOAN TERM ANALYSIS
			
			SELECT 
					Term,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY address_state
			ORDER BY address_state;

		--->  EMPLOYEE LENGTH ANALYSIS

			SELECT
					emp_length,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY emp_length
			ORDER BY emp_length;
		
		--->  LOAN PURPOSE BREAKDOWN

			SELECT
					purpose,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY purpose
			ORDER BY COUNT(id) DESC;


		--->  HOME OWNERSHIP ANALYSIS

			SELECT
					home_ownership,
					COUNT(id) AS Total_Loan_Applications,
					SUM(loan_amount) AS Total_Funded_Amount,
					SUM(total_payment) AS Total_Received_Amount
			FROM bank_loan_data
			GROUP BY home_ownership
			ORDER BY COUNT(id) DESC;

		
