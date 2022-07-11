--Data Cleaning
DELETE FROM dbo.covid19case3 where State = 'Cases being reassigned to states';
DELETE FROM dbo.covid19case3 where State = 'Daman & Diu';
DELETE FROM dbo.covid19case3 where State = 'Unassigned';
UPDATE dbo.covid19case3
	SET State = 'Dadra and Nagar Haveli and Daman and Diu' 
  WHERE State = 'Dadra and Nagar Haveli';
UPDATE dbo.covid19case3
	SET State = 'Bihar' 
  WHERE State = 'Bihar****';
UPDATE dbo.covid19case3
	SET State = 'Telangana' 
  WHERE State = 'Telengana';