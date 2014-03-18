#PRACTICAL - Ethnicity_extra
CASE
WHEN    IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Other White'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'White and Asian'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'White and Black African'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'White and Black Caribbean'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Other Mixed'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Other Asian'
     OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Other Black'
	 OR IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Refused'
THEN {Personal\P Ethnicity} + IFNULL({Personal\P Ethnicity Other},'','.'+{Personal\P Ethnicity Other})
WHEN IFNULL({Personal\P Ethnicity},'x',{Personal\P Ethnicity}) = 'Other (please specify)'
THEN IFNULL({Personal\P Ethnicity Other},'',{Personal\P Ethnicity Other})
END
