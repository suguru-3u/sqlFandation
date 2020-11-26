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

select * from 家計簿
order by 日付 desc

select * from 家計簿
order by 入金額 desc , 出金額 desc

select * from 家計簿
order by 出金額 desc
limit 3

select 費目,入金額,出金額 from 家計簿
union
select 費目,入金額,出金額 from 家計簿アーカイブ
order by 出金額 

select 費目,入金額,出金額 from 家計簿
EXCEPT
select 費目,入金額,出金額 from 家計簿アーカイブ

select 費目 from 家計簿
intersect
select 費目 from 家計簿アーカイブ

1
select * from 注文テーブル
order by 注文番号 ASC,注文枝番 ASC

2
select distinct 商品名 from 注文テーブル
where 日付 <= '2018-01-01' and 日付 >= '2018-01-31'
order by 商品名

3
select 注文番号,注文枝番,注文金額 from 注文テーブル
where 分類 = '1' 
order by 注文金額 

4
select 日付 ,商品名,単価,数量,注文金額 from 注文テーブル
where 分類 = '2' and 数量 >= 2
order by 購入日,数量 desc

5 
select 分類,商品名,サイズ,単価 from 注文テーブル
where 分類 = '1'
UNION
select 分類,商品名,null,単価 from 注文テーブル
where 分類 = '2'
UNION
select 分類,商品名,null,単価 from 注文テーブル
where 分類 = '3'
order by 分類,商品名

select 口座番号　from 口座テーブル
order by 口座番号

select distinct 名義 from 口座テーブル
order by 名義

SELECT 口座番号, 名義, 種別, 残高, 更新日
  FROM 口座
 ORDER BY 4 DESC, 1