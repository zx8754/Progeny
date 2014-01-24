CASE
	WHEN IFNULL({Audit\Consent Date},'noConsent','')='noConsent' THEN 'Consent Date is Blank'
	WHEN {Audit\Consent Date}=convert(datetime,'1900-01-01',111) THEN 'Consent Dummy Date'
	WHEN {Audit\Consent Date} <= {Personal\P DOB} THEN 'Consent Date before DOB'
	WHEN {Audit\Consent Date} >= {Personal\P DOD} THEN 'Consent Date after DOD'	
ELSE 'OK'
END
