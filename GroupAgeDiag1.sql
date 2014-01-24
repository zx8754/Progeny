CASE
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 0
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})< 54
THEN '0-54'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 55
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 59
	 THEN '55-59'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 60
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 64
THEN '60-64'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 65
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 69
THEN '65-69'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 70
THEN '70+'
ELSE 'U'
END
