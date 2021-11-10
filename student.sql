create database student;

create table student(
    stud_id serial not null primary key,
    firstname varchar(20) not null,
    pasport_series varchar(4) not null,
    pasport_num varchar(6) not null,
    constraint pasportunique unique(pasport_series,pasport_num)
);
create table subjects(
    subj_id serial not null primary key,
    subj_name varchar(20) not null
);
create table progress(
    pr_id serial not null primary key,
    stud_id int,
    subj_id int,
    constraint FK_stud_id foreign key (stud_id) references student(stud_id) match full on delete cascade,
    constraint FK_subj_id foreign key (subj_id) references subjects(subj_id) match full on delete cascade,
    mark int not null check(mark>=2 and mark<=5)
);


insert into student values
(1,'Anton',1111,111111),
(2,'Bogdan',1112,111112),
(3,'Vitaly',1113,111113),
(4,'Georgy',1114,111114),
(5,'Dima',1115,111115),
(6,'Egor',1116,111116),
(7,'Ioan',1117,111117);

insert into subjects values
(1,'geometry'),
(2,'algebra'),
(3,'english'),
(4,'russian'),
(5,'literature');

insert into progress values
(1,1,4),
(2,2,4),
(3,3,2),
(1,2,3),
(2,2,2),
(3,2,3),
(1,3,5),
(2,4,4),
(3,5,5);

insert into progress values
(1,4,4),
(2,5,2),
(4,5,2),
(5,4,3),
(2,5,2),
(3,3,3),
(5,4,3),
(2,3,4),
(3,5,3);


--------------------------------------------------------------------------------------------------------------------------------
2.select firstname, mark from student as j1
inner join Progress as j2 on j1.stud_id = j2.stud_id
where mark > 3;

7. select subj_name, avg(mark) from subjects as j1
inner join progress as j2 on j1.subj_id = j2.subj_id
group by subj_name;

8. select j1.stud_id, firstname, avg(mark) from student as j1
inner join progress as j2 on j1.stud_id = j2.stud_id
group by j1.stud_id;

10. select subj_id, subj_name, count(mark) from subjects as j1
inner join progress as j2 on j1.subj_id = j2.subj_id
group by subj_name
order by count(mark) desc limit 3;

--------------------------------------------------------------------------------





