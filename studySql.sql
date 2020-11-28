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

 SELECT 更新日
  FROM 口座
 WHERE 更新日 IS NOT NULL
 ORDER BY 更新日
        OFFSET 0
 FETCH FIRST 10 ROWS ONLY

 SELECT 更新日, 残高
  FROM 口座
 WHERE 残高 > 0
   AND 更新日 IS NOT NULL
 ORDER BY 残高, 更新日 DESC
OFFSET 10
 FETCH FIRST 10 ROWS ONLY

 SELECT 口座番号
  FROM 口座
 UNION
SELECT 口座番号
  FROM 廃止口座
 ORDER BY 1

 SELECT 名義
  FROM 口座
EXCEPT
SELECT 名義
  FROM 廃止口座
 ORDER BY 1 DESC

    SELECT 名義
     FROM 口座
INTERSECT
   SELECT 名義
     FROM 廃止口座
    ORDER BY 1

SELECT 口座番号, 残高
  FROM 口座
 WHERE 残高 = 0
 UNION
SELECT 口座番号, 解約時残高
  FROM 廃止口座
 WHERE 解約時残高 <> 0
 ORDER BY 1

SELECT 口座番号, 名義, '○' AS 口座区分
  FROM 口座
 UNION
SELECT 口座番号, 名義, '×' AS 口座区分
  FROM 廃止口座
 ORDER BY 名義

select 出金額,出金額 + 100 as aaa,'SQL' as aaaa
from 家計簿

insert into 家計簿(出金額)
values(1000+150)

update 家計簿
set 出金額 = 出金額 + 100

select 費目,出金額,
  case 費目 when '居住費' then '固定費'
            when '水道光熱費' then '固定費'
            else '変動費'
          end AS 出費の分類
from 家計簿 where 出金額 > 0

select メモ ,Length(メモ) AS　メモの長さ
from 家計簿

select メモ,trim(メモ) as 空白除去したメモ
from 家計簿

update 家計簿
set メモ = REPLACE(メモ,'購入','買った')

select メモ ,SUBSTRING(メモ,'購入',3)
from 家計簿

select 出金額,ROUND(出金額,-2)
from 家計簿

insert into 家計簿
values (current_date,'食費','ドーナツを買った',0,260)

update 受験者テーブル
set 午後1 = 320 - (86 + 68 + 92)
where 受験者１ID = SW1046

問題1
update 試験結果 as 合格者ID 
from 試験結果
where 午前 >= 60 
and (午後1 + 午後2) >= 120
and 論述 >= (午前 + 午後1 + 午後2 + 論述) * 0.3

問題2
2-1
update 回答者
set 国名 = case 
substring(Trim(メールアドレス),length(trim(メールアドレス))-1 2)
when 'jp' then '日本'
end

2-2
select TRIM(メールアドレス),性別 || ':' || 年齢
from 回答者

問題3
5-1
update 受注
set 文字数 = length(REPLACE(文字,' ',''))

5-2
select 受注日,受注ID,文字数
case COALESCE(書体コード,'1')
when '1' then 'ブロック体' end as 書体名,
case COALESCE(書体コード,'1')
when '1' then 100 end as 単価,
case when 文字数 10 > then 500
else 0 end as 特別加工料
from 受注
order by 受注日,受注ID

5-3
update 受注
set 文字 = REPLACE(文字,' ',*)
where 受注ID = 113




































