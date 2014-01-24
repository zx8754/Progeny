IFNULL({Personal\RMH ID},
        'No RMH ID',
		IF (SELECT count(*)
		    FROM   st_data AS stdatasub
		    WHERE  f77 is not null AND f77={Personal\RMH ID})>1
		THEN 'Not unique'
		ELSE 'OK'
		ENDIF)
