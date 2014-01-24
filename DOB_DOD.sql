CASE
	WHEN IFNULL({Personal\P DOB},'noDOB','')='noDOB' AND IFNULL({Personal\P DOD},'noDOD','')='noDOD' THEN 'DOB and DOD is Blank'
	WHEN IFNULL({Personal\P DOB},'noDOB','')='noDOB' AND IFNULL({Personal\P DOD},'noDOD','')='' THEN 'DOB is Blank'
	WHEN IFNULL({Personal\P DOB},'noDOB','')='' AND IFNULL({Personal\P DOD},'noDOD','')='noDOD' THEN 'DOD is Blank'
	WHEN {Personal\P DOB}>{Personal\P DOD} THEN 'Age is negative'
ELSE 'OK'
END
