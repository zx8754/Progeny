CASE
WHEN  IFNULL({Query\Practical\GleasonScore},9999,{Query\Practical\GleasonScore}) < 8
THEN 'Low'
WHEN  IFNULL({Query\Practical\GleasonScore},-1,{Query\Practical\GleasonScore}) >= 8
THEN 'High'
ELSE 'U'
END
