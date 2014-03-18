CASE
WHEN {Summary Fields\Count Individual} = 1
THEN 'U'
WHEN {Summary Fields\Count Cancer Confirmed Unconfirmed 1st Degree} >=1
THEN 'Yes'
ELSE 'No'
END
