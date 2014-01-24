CASE 
WHEN     IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T4'
      OR IFNULL({Medical\Staging N (Regional Lymph Nodes)},'x',{Medical\Staging N (Regional Lymph Nodes)}) = 'N+'
	  OR IFNULL({Medical\Staging M (Metastases)},'x',{Medical\Staging M (Metastases)}) = 'M+'
THEN 'IV'
WHEN      IFNULL({Medical\Staging N (Regional Lymph Nodes)},'x',{Medical\Staging N (Regional Lymph Nodes)}) = 'N0'
      AND IFNULL({Medical\Staging M (Metastases)},'x',{Medical\Staging M (Metastases)}) = 'M0'
THEN CASE
     WHEN substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T3'
     THEN 'III'
	 WHEN    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2c'
	      OR (    (   substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T1'
		           OR substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T2')
			  AND (   IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >= 20
			       OR IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 8))
	 THEN 'IIB'
	 WHEN    (    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2b'
	         AND (  (    IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) = -1
		             AND IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) = -1)
			      OR(    IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 7
		             AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <20)
			     )
		     )
		  OR ( (    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2b'
		         OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2'
			   )
			   AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <20
			   AND IFNULL({Medical\PSA Level at Diagnosis},-9,{Medical\PSA Level at Diagnosis}) >=10
			   AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
		     )
          OR (    IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2a'
		      AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) = 7
		      AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <20
			 )
          OR (    substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T1'
		      AND (
			         (    IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
		              AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <20
			          AND IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) >=10)
			      OR (    IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) = 7
		              AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) <20)
			      )
		     )				  
	 THEN 'IIA'
     WHEN    ((   substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T1'
	           OR IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2a')
		      AND IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) = -1
		      AND IFNULL({Medical\PSA Level at Diagnosis},-1,{Medical\PSA Level at Diagnosis}) = -1)
		   OR (    (   IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}) = 'T2a'
		            OR substring(IFNULL({Medical\Staging T (Stage)},'x',{Medical\Staging T (Stage)}),1,2) = 'T1')
		       AND IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
		       AND IFNULL({Medical\PSA Level at Diagnosis},9999,{Medical\PSA Level at Diagnosis}) < 10)
     THEN 'I'
     ELSE 'U'
	 END
ELSE 'U'
END
