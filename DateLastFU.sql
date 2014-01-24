ISNULL({Personal\P DOD},
IF
(
	CASE 
	WHEN 		isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111))
	END
) = convert(datetime,'1900-01-02',111)
THEN NULL
ELSE 
(
	CASE 
	WHEN 		isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Consent Date},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Date Last Seen},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-02',111))
	WHEN 		isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Tracing Received Date},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Query\Front Sheet\Date Blood Received},convert(datetime,'1900-01-01',111))
		AND 	isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111)) >= isnull({Audit\Consent Date},convert(datetime,'1900-01-01',111))
	THEN isnull({Audit\Date Last Seen},convert(datetime,'1900-01-02',111))
	END
)
ENDIF
)
