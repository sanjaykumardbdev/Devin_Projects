CREATE VIEW v_member_loans AS
SELECT m.member_id, m.member_name, l.loan_id, l.loan_amount, l.loan_date
FROM members m
JOIN loans l ON m.member_id = l.member_id;