print REPLACE('鈴木一郎','一','あ')

print Left('aabbbc',3)

print RIGHT('aaabbbc',4)

print substring('aaaaccc',4,3)

print upper('aaa')

print lower('AAA')

print trim(' aaa ')

print len('aaa')

print datalength('aaa')

print charindex('b','aaaba',1)

print cast('1000' as int)

print convert(int ,'1000');

print 1/3

print 1.0/3.0

print round(123.456,-2)

print floor(123.456)

print ceiling(123.456)

create table[成績](
	[学籍番号] int
	,[氏名] nvarchar(40)
	,[国語] int
	,[数学] int
	,[理科] int
	,[社会] int
	,[英語] int
);

insert into[成績]
Values(1,'a',77,66,77,66,99);

insert into[成績]
Values(2,'b',77,66,77,66,99);

insert into[成績]
Values(3,'c',77,66,77,66,99);

insert into[成績]
Values(4,'d',77,66,77,66,99);

insert into[成績]
Values(5,'e',77,66,77,66,99);

select avg(distinct 国語) as 国語の平均点 
from 成績

select 
(
	(select Max(国語) from 
		(select top 50 percent [国語] from 成績 order by [国語]) as [下位])
	+
	(select Min(国語) from 
		(select top 50 percent [国語] from 成績 order by [国語]) as [上位])
) /2 as [中央値];

create table[点数]
(
	[コード] int
	,[氏名] nvarchar(10)
	,[点]int
);

insert into[点数]
values(1,'a',98);

insert into[点数]
values(2,'b',100);

insert into[点数]
values(3,'c',95);

insert into[点数]
values(4,'d',99);

insert into[点数]
values(5,'e',98);

insert into[点数]
values(6,'f',92);

insert into[点数]
values(7,'g',92);

insert into[点数]
values(8,'h',96);

insert into[点数]
values(9,'a',99);

insert into[点数]
values(10,'a',91);

select [コード],[氏名],[点]
,ROW_NUMBER() over(order by[点] desc) as '結果１'
,RANK() over(order by[点] desc) as '結果2'
,NTILE(6) over(order by[点] desc) as '結果3'
from [点数]
order by [コード];

print cast(current_timestamp as varchar);

print convert(varchar,current_timestamp,120);

create table 作業単位(
	開始日付 datetime
	,終了日付 datetime
)

insert into 作業単位
values(convert(datetime,'2019-01-01')
,convert(datetime,'2019-01-31'));

select * from sys.objects;

declare @ホーム負数 int

DECLARE CUR_AAA CURSOR FOR
select 
	count(ost.w)
	from bbsn_off_sum_team_tb ost
	INNER JOIN bbm1_cup_tb c on  c.cup_id = 30038 and c.year_id = ost.year_id
	where home_away_sec = 1
	AND ost.game_kind_id in(1,2)
	AND ost.is_deleted = 0
	AND c.is_deleted = 0
	group by ost.team_name,team_id
	order by ost.team_id

	--カーソルオープン
OPEN CUR_AAA;

--最初の1行目を取得して変数へ値をセット
FETCH NEXT FROM CUR_AAA
INTO @ホーム負数;

--データの行数分ループ処理を実行する
WHILE @@FETCH_STATUS = 0
BEGIN

	-- ========= ループ内の実際の処理 ここから===

	print @ホーム負数

	-- ========= ループ内の実際の処理 ここまで===


	--次の行のデータを取得して変数へ値をセット
	FETCH NEXT FROM CUR_AAA
	INTO @ホーム負数;

END

--カーソルを閉じる
CLOSE CUR_AAA;
DEALLOCATE CUR_AAA;


--ホームでの勝ち数
	select 
		@ホーム勝数 = count(ost.w)
	
	INNER JOIN bbm1_cup_tb c on  c.cup_id = @カップID and c.year_id = ost.year_id
	where home_away_sec = 1
	AND ost.game_kind_id in(1,2)
	AND ost.is_deleted = 0
	AND c.is_deleted = 0
	group by ost.team_name,team_id
	order by ost.team_id

	--ビジターでの勝ち数
	select 
		@ビジター勝数 = count(ost.w)
	
	INNER JOIN bbm1_cup_tb c on  c.cup_id = @カップID and c.year_id = ost.year_id
	where home_away_sec = 2
	AND ost.game_kind_id in(1,2)
	AND ost.is_deleted = 0
	AND c.is_deleted = 0
	group by ost.team_name,team_id
	order by ost.team_id

	--ホームでの負け数
	select 
		@ホーム負数 = count(ost.w)
	
	INNER JOIN bbm1_cup_tb c on  c.cup_id = @カップID and c.year_id = ost.year_id
	where home_away_sec = 1
	AND ost.game_kind_id in(1,2)
	AND ost.is_deleted = 0
	AND c.is_deleted = 0
	group by ost.team_name,team_id
	order by ost.team_id

	--ビジターでの負け数
	select 
		@ホーム勝数 = l
	
	where home_away_sec = 2
	AND is_deleted = 0


	INSERT @retFindReports
	SELECT 
		@試合日付詳細 = game_date / 10000
		,@試合日 = game_date
		, 試合種別ID
		,@チームID = team_id
		,@順位 = rank
		,@差 = gb_from_leading_team
		,@マジック = magic_number
		,@試合数 =  g
		,@残り試合数 = left_game
		,@勝数 = w
		, ホーム勝数
		, ビジター勝数
		,@負数 = l
		, ホーム負数
		, ビジター負数
		, @引分数 = t
		, ホーム引分数
		, ビジター引分数
		, @勝率 = wpct
		, ホーム勝率
		, ビジター勝率
		, 打率
		, ホーム打率
		, ビジター打率
		, 防御率
		, ホーム防御率
		, ビジター防御率
		, 得点
		, 失点
		, 本塁打
		, 盗塁
		, 規定打席数
		, 規定投球回数
	
	WHERE
		試合日付 = dbo.getYYYYMMDD(DATEADD(d, -1, GETDATE()))
		AND 削除F = 0