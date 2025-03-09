/* create database Tweeter*/
Create Database Tweeter;
-- use the db 
use Tweeter;
-- Create Tables
 -- Create Account table
 Create Table Accounts(
  Account_id int auto_increment primary key,
  First_name varchar(225),
  last_name varchar(225),
  Gender char(1),
  Date_of_Birth date,
  Phone_number varchar(225),
  Address varchar(225)
  );
  
  -- Create user table 
  Create table users(
   User_id int auto_increment primary key,
   User_name  varchar(225) unique not null,
   Eamil varchar(225) not null ,
   User_password varbinary(225) not null  ,
   Register_Date date,
   Account_id int not null ,
   Foreign key (Account_id) references Accounts( Account_id)   
  );
 
 -- create table tweets
 Create table Tweets(
  Tweet_id int auto_increment primary key,
  Tweet_Subject varchar(225),
  Tweet_Date date,
  Tweet_Owner int not null ,
  Foreign key(Tweet_Owner) references Users(User_id)   
 );
 
 -- Create table tweet_like
 Create table tweet_like(
  Tweet_id int not null,
  Tweet_like_id int not null,
  Foreign key(Tweet_id) references Tweets(Tweet_id),
  Foreign key (Tweet_like_id ) references users(User_id)   
 );
 
 
 -- create table fans
 Create table Fans
 (
   Fan_Id int auto_increment primary key,
   User_Fan_id int not null,
   Foreign key (User_Fan_id) references users(User_id)
 );
 
 -- create table user_fans
 create table Users_fans(
  User_id int not null,
  Fan_id int not null,
  Foreign key (User_id) references users(User_id),
  Foreign key (Fan_id) references Fans(fan_Id)
 );
 
 -- check if all tables created 
 Show tables from tweeter;
 
 
 drop database tweeter;
 -- fill the tables 
 
  -- create account
  insert into accounts (First_name,last_name,Gender,Date_of_Birth,phone_number,Address) 
  values
  ('Ahmad','jess','M','19-2-1980','222-333-4444','address1');
   insert into accounts (First_name,last_name,Gender,Date_of_Birth,phone_number,Address) 
   values
  ('Fadi','Tess','M','18-2-1981','222-331-4111','address2');
   insert into accounts (First_name,last_name,Gender,Date_of_Birth,phone_number,Address) 
   values
  ('Shadi','Alex','M','18-2-1982','111-231-4551','address3');

 -- create user
 insert into users(user_name,Eamil,user_password,Register_Date,Account_id)
 values('Ahmad1','Ahmad@test.com',md5('hi'),sysdate(),1);
 insert into users(user_name,Eamil,user_password,Register_Date,Account_id)
 values('FadiT','fadi@test.com',md5('world'),sysdate(),2);
insert into users(user_name,Eamil,user_password,Register_Date,Account_id)
 values('ShadiA','shadi@test.com',md5('test'),sysdate(),3);
 select * from users;
 
  
 -- create tweets
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject1','2020-10-01',1);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject2','2020-10-01',1);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject3','2020-11-02',1);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject2-1','2020-10-03',2);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject2-2','2020-10-20',2);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject2-3','2021-12-03',2);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject3-1','2022-05-01',3);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject3-2','2022-10-01',3);
 insert into tweets (tweet_Subject,tweet_Date,tweet_owner)
 values('Subject3-3','2022-10-04',3);
 
 select * from tweets;
 
 -- fill table tweet like
  insert into tweet_like (tweet_id,tweet_like_id)
  values(1,2);
  insert into tweet_like (tweet_id,tweet_like_id)
  values(3,2);
  insert into tweet_like (tweet_id,tweet_like_id)
  values(4,3);
  insert into tweet_like (tweet_id,tweet_like_id)
  values(5,1);
  insert into tweet_like (tweet_id,tweet_like_id)
  values(7,1);
  insert into tweet_like (tweet_id,tweet_like_id)
  values(9,2);
  
  select * from  tweet_like;
  
  
  /* create stored procedure create account
     take the account's information and user information to insert them into 
     account and user tables.
  */
  DELIMITER //
  Create procedure createAccount(
    fname varchar(225),
    lname varchar(225),
    G char(1),
    DOB date,
    Pnum varchar(225),
    Addr varchar(225),
    Uname varchar(225),
    u_email varchar(225),
    u_pass binary(64),
    Acct_id int
  )
  begin 
  insert into Accounts (first_name,last_name,Gender,Date_of_Birth,Phone_number,Address)
  values(fname,lname,G,DOB,Pnum,Addr);
  
  insert into users(user_name,eamil,user_password,register_Date,account_id)
  values(Uname,u_email,md5(u_pass),sysdate(),Acct_id);
  
  end;
  
 -- call the procedure with pass the parameters
  call createAccount('Tarek','Ameen','M','1979-03-05','111-444-5454','address4','TarekA','Tarek@test.com',01101011,4);
  
  -- check if the account and user created 
  select * from accounts
  where account_id=4;
  
  select * from users
  where user_id=4;
  
  /* create index on users (username ) to make the search operation 
     for users by their names faster*/
  Create index uName_Idx on users(user_name);
  -- check if index is created
  show indexes from users;
  /* create procedure User_follow 
     take the user_name and follower user_name and search for their ids to 
     insert them into users_fans and fans tables
 */
 
  DELIMITER //
  Create procedure User_follow(uName varchar(225),fName varchar(225))
  begin
  if( 
      uName is not null 
      &&
      fName is not null
      &&
     (uName != fName) 
     )
  then 
     set @uId =(Select user_id from users where user_name IN (uName));
     set @fanId = (Select user_id from users where user_name IN (fName));
    
     insert into Fans(user_Fan_id)
     values(@fanId);
    
     set @fId = (select Fan_id from fans where user_Fan_id IN (@fanId));
    
     insert into users_fans(user_id,fan_id)
     values(@uId,@fId);
    end if;
end;
   
   -- check the users that i have
    select * from users;
   -- call the procedure
   call User_follow('FadiT','Ahmad1');
   -- check the fans table
   select * from fans;
   -- check the users_fans table 
   select * from users_fans;
   
   -- show all tweets belong to one of users
   Select * from tweets
   where   Tweet_Owner =1;
   
  
