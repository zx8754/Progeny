CASE
WHEN {Summary Fields\Count Individual} = 1
THEN ''
WHEN {Summary Fields\Count Cancer Confirmed Unconfirmed 1st Degree} >=1
THEN {Summary Fields\Count Cancer Confirmed Unconfirmed 1st Degree}
END
