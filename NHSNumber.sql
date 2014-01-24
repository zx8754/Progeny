IFNULL({Personal\P NHS Number},
       'No NHS Number',
	   IF (SELECT count(*)
	       FROM   st_data AS stdatasub
		   WHERE  f100 is not null AND f100={Personal\P NHS Number})>1
       THEN 'Not unique'
	   ELSE 'OK'
	   ENDIF)
