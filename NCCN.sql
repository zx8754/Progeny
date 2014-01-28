CASE
WHEN    IFNULL({Medical\Staging N (Regional Lymph Nodes)},'x',{Medical\Staging N (Regional Lymph Nodes)}) = 'N+'
	 OR IFNULL({Medical\Staging M (Metastases)},'x',{Medical\Staging M (Metastases)}) = 'M+'
THEN 'Metastatic'
WHEN    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3b'
     OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3c'
     OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T4'
THEN 'VeryHigh'
WHEN    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T3a'
	 OR (    IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 8
         AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 10 )
	 OR IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) > 20
THEN 'High'
WHEN    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2b'
     OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2c'
	 OR IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) = 7
	 OR (     IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >= 10
		  AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <= 20)
THEN 'Intermediate'
WHEN (   IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1'
	  OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1a'
      OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1b'
      OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T1c'
      OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2'
      OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2a')
     AND IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 2
     AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
     AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 10
     AND IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >= 0
THEN 'Low'
ELSE 'U'
END
