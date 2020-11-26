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