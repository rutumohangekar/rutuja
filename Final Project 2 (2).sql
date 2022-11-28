create database project2;
use project2;
#----Q4-----#
select s.snum,s.sname,s.comm,c.cnum,c.cname,c.rating,c.snum,s.city from salespeople s
inner join cust c on s.city=c.city
order by city asc; 

#----Q5-----#
select s.snum,c.cname,s.sname from salespeople s
inner join cust c on s.snum=c.snum
order by snum asc;

#----Q6-----#
select o.onum,s.sname,s.city,c.cname,c.city from salespeople s,cust c,orders o where s.city != c.city;
 
#----Q7-----#
select o.onum,c.cname from orders o
inner join cust c on o.cnum=c.cnum;

#----Q8-----#
select c.cname,c.rating from cust c 
order by c.rating ;

#----Q9-----#
select s.snum,s.sname,c.cname from salespeople s
 join cust c on s.snum=c.snum
 order by snum asc;
 
 #----Q10-----#
select s.sname,s.city from salespeople s
order by city;

#----Q11-----#
select round(sum(amt),2) as 'Orders Credited' from orders o inner join salespeople s  on o.snum=s.snum where s.snum=(
select s.snum from salespeople s
inner join cust c on s.snum=c.snum
where c.cnum=2008);

#----Q12-----#
select * from orders  where amt>(select avg(amt) from orders where odate='1994-10-04');

#----Q13-----#
select sum(o.amt) as 'Order Amount' from orders o inner join 
salespeople s on o.snum=s.snum where s.city='London';

#----Q14-----#
select c.cnum,c.cname,s.snum,s.sname from cust c,salespeople s where s.snum+1000=c.cnum; 

#----Q15-----#
select count(c.cnum) from cust c where rating>(
select avg(rating) from cust c where city='san jose');

#----Q16-----#
select s.sname,c.cname from salespeople s, cust c where s.snum=c.snum 
order by s.snum;
