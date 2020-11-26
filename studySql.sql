update 家計簿
set 出金額 = 9000
where 日付 = '2018-02-25';

delete from 家計簿
where 日付 = '2018-02-25';

select 費目 AS ITEM
from 家計簿
where 費目 = '給料';

update 家計簿
set 入金額 = 999;

select * from 家計簿
where 出金額 is null

select * from 家計簿 
where メモ like '%1月%'

select * from 家計簿 
where 出金額 between 1000
and 30000

select * from 家計簿
where 費目 in('食費','交際費')

select * from 家計簿
where 費目 NOT in('食費','交際費')

select * from 口座
where 口座番号 = 0037651;

select * from 口座
where 残高 > 0;

SELECT * FROM 口座
 WHERE 更新日 < '2017-01-01'

SELECT * FROM 口座
WHERE 残高 > 1000000

SELECT * FROM 口座
WHERE 種別 <> '1'

SELECT * FROM 口座
where 更新日 is null

SELECT * FROM 口座
 WHERE 名義 like '%ハシ%'

SELECT * FROM 口座
 WHERE 更新日 between '2018-01-01' and '2018-01-31'

SELECT * FROM 口座
 WHERE 種別 in('2','3') 

SELECT * FROM 口座
 WHERE 名義 = 'サカタ リョウヘイ' 
 and 名義 = 'マツモト　ミワコ'
 and 名義 = 'ハマダ サトシ'

SELECT * FROM 口座
 WHERE 更新日 between '2017-12-30' and '2018-01-04'
 
SELECT * FROM 口座
 WHERE 残高 >= 10000
   AND 更新日 is not NULL

SELECT * FROM 口座
 WHERE 口座番号 >= '2000000'
   AND 名義 like 'エ__　%コ'

select distinct 入金額 from 家計簿