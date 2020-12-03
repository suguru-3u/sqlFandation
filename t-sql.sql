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