CASE
WHEN IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) <= 6
THEN 'Low'
WHEN IFNULL({Query\Practical\GleasonScore},-9,{Query\Practical\GleasonScore}) = 7
THEN 'Intermediate'
WHEN IFNULL({Query\Practical\GleasonScore},-9,{Query\Practical\GleasonScore}) >= 8
THEN 'High'
ELSE 'U'
END
