CASE
WHEN IFNULL({Medical\PSA Level at Diagnosis},-9,{Medical\PSA Level at Diagnosis}) >= 10
THEN 'High'
WHEN IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 10
THEN 'Low'
ELSE 'U'
END
