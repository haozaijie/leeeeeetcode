# use case when and group by
SELECT ad_id, 
       Round(( CASE 
                 WHEN Sum(action='clicked') 
                      + Sum(action='viewed') = 0 THEN 0 
                 ELSE 100 * Sum(action = 'clicked') / ( Sum(action='clicked') 
                                                        + Sum(action='viewed') ) 
               END ), 2) AS ctr 
FROM   ads 
GROUP  BY ad_id 
ORDER  BY ctr DESC, 
          ad_id ASC;
