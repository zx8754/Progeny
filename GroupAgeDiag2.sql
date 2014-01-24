CASE
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})>= 0
     AND IFNULL({Query\Practical\AgeDiag},9999,{Query\Practical\AgeDiag})<= 55
THEN '0-55'
WHEN     IFNULL({Query\Practical\AgeDiag},-9,{Query\Practical\AgeDiag})> 55
THEN '56+'
ELSE 'U'
END
