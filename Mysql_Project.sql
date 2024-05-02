create database LibraryData;
use LibraryData;
create table Branch(Branch_no int primary key, Manager_id int not null, Branch_adderss varchar(20), Contact_no char(10));
create table Employee(Emp_id int primary key, Emp_name varchar(20), Position varchar(20), Salary int, Branch_no int, foreign key(Branch_no)references Branch(Branch_no));
create table Customer(Customer_id int primary key, Customer_name varchar(20), Customer_adderss varchar(20), Reg_date date);
create table Books(ISBN varchar(20) primary key, Book_title varchar(20), Category varchar(20), Rental_Price int, Status enum('yes','no'), Author varchar(30), Publisher varchar(20));
create table IssueStatus(Issue_id int primary key, Issued_cust int, foreign key(Issued_cust)references Customer(Customer_id), Issued_book_name varchar(20), Issue_date date, Isbn_book varchar(30), foreign key(Isbn_book)references Books(ISBN));
create table ReturnStatus(Return_id int primary key, Return_cust varchar(20), Return_book_name varchar(30), Rerturn_date date, Isbn_book2 varchar(20), foreign key(Isbn_book2)references Books(ISBN));
insert into Branch(Branch_no, Manager_id, Branch_adderss, Contact_no)values(1, 116, 'jhs322', 6657678788),
                                                                           (2, 160, 'hes327', 7878776678),
                                                                           (3, 211, 'shv333', 6327697638),
                                                                           (4, 385, 'kjx381', 9238047287);
insert into Employee(Emp_id, Emp_name, Position, salary, Branch_no)values(116, 'thomas', 'librarian', 50000, 1),
                                                                         (160, 'dani', 'ass.librarian', 30000, 2),
                                                                         (211, 'olivia', 'clerk', 20000, 3),
                                                                         (385, 'ammu', 'typist', 10000, 4);
insert into Customer(Customer_id, Customer_name, Customer_adderss, Reg_date)values(42, 'aleena', 'ghi592', '2010-08-10'),
                                                                                  (43, 'john', 'hju523', '2011-03-13'), 
                                                                                  (44, 'abi', 'ksb187', '2011-01-18'),
                                                                                  (45, 'niya', 'fha079', '2013-07-12');
insert into Books values('8171300243', 'GOAT LIFE', 'NOVEL', 450, 'yes', 'BENYAMIN', 'DC BOOKS'),
					   ('0443377450', 'PRIDE AND PREJUDICE', 'NOVEL', 440, 'yes', 'JANE AUSTEN', 'Dover Publications'),
					   ('97887264755568', 'PREMALEKHANAM', 'ROMANCE', 350, 'yes', 'VAIKOM MUHAMMAD BASHEER', 'DC BOOKS'),
					   ('9780143416333', 'RAM C\O ANANDI', 'NOVEL', 350, 'no', 'AKHIL PI DHARMAJAN', 'PENGUIN BOOKS');
insert into IssueStatus values(200, 42, 'PRIDE AND PREJUDICE', '2020-03-28', '0443377450'),
                              (201, 43, 'GOAT LIFE', '2013-08-10', '8171300243'),
                              (202, 44, 'RAM C\O ANANDI', '2018-05-17', '9780143416333'),
                              (203, 45, 'PREMALEKHANAM', '2023-12-10', '97887264755568');
insert into ReturnStatus values(501, 401, 'PRIDE AND PREJUDICE', '2020-04-29', '0443377450'),
                               (502, 402, 'GOAT LIFE', '2013-09-11', '8171300243'),
                               (503, 403, 'RAM C\O ANANDI', '2018-06-18', '9780143416333'),
                               (504, 404, 'PREMALEKHANAM', '2024-01-11', '97887264755568');
select*from books;
select*from branch;
select*from customer;
select*from employee;
select*from issuestatus;
select*from returnstatus;
select  Book_title, Category, Rental_Price from Books where status='yes';
select Emp_name, Salary from Employee order by Salary desc;
select IssueStatus.Issued_cust, IssueStatus.Issued_book_name, Customer.Customer_name from IssueStatus  inner join  Customer on IssueStatus.Issued_cust=Customer.Customer_id;
select Category, count(Isbn)as count_Category from Books group by Category;
select Emp_name, Position, Salary from Empolyee where Salary>50000;
select Customer_name, Reg_date from Customer where Reg_date<'2022-01-01' and Customer_id not in (select Issued_cust from IssueStatus);
select Branch_no, count(Branch_no)as count_of_branch from Employee group by Branch_no;
select Customer.Customer_name from Customer where Reg_date<'2022-01-01' and Customer_id not in (select Issued_cust from IssueStatus);
select Branch_no, count(*)as TotalEmployees From Employee group by Branch_no;
select Customer.Customer_name from IssueStatus inner join Customer on IssueStatus.Issued_cust = Customer.Customer_id where year(Issue_date)=2023 and month(Issue_date)=6;
select Book_title from Books where Category ='Historical Fiction';
select Branch_no, count(*)as Employee_Count From Employee group by Branch_no having count(*)>5;   
                       
                         
                       
                                                                                     
