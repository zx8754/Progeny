IF (   IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >= 20 
    OR IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 8
	OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3'
	OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3a'
	OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3b'
	OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3c'
	OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T4')
THEN 'High'
ELSE IF (   (    IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) > 10
             AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 20)
	     OR IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) = 7
         OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2b'
         OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2c')
     THEN 'Intermediate'
	 ELSE IF (    IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <= 10 
	          AND IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >= 0
			  AND IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 1
			  AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
			  AND (    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1'
			        OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1a'
			        OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1b'
			        OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1c'
			        OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2a'))
	      THEN 'Low'
		  ELSE 'U'
		  ENDIF
     ENDIF
ENDIF
