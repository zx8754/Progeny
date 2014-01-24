CASE
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 0
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 59
	 AND IFNULL({Medical\PSA Level at Diagnosis},-9,{Medical\PSA Level at Diagnosis})>= 3
THEN 'High'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 60
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 69
	 AND IFNULL({Medical\PSA Level at Diagnosis},-9,{Medical\PSA Level at Diagnosis})>= 4
THEN 'High'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 70
	 AND IFNULL({Medical\PSA Level at Diagnosis},-9,{Medical\PSA Level at Diagnosis})>= 5
THEN 'High'
WHEN     (IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 0
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 59
	 AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 3) 
	 OR  (IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 60
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 69
	 AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 4)
	 OR  (IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 70
	 AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 5)
THEN 'Low'
ELSE 'U'
END
