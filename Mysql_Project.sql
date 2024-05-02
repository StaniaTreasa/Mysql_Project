-- Create Database
create database LibraryData;
-- Use Datbase
use LibraryData;
-- Create Branch Table
create table Branch(Branch_no int primary key, Manager_id int not null, Branch_adderss varchar(20), Contact_no char(10));
-- Create Employee Table
create table Employee(Emp_id int primary key, Emp_name varchar(20), Position varchar(20), Salary int, Branch_no int, foreign key(Branch_no)references Branch(Branch_no));
-- Create Customer Table 
create table Customer(Customer_id int primary key, Customer_name varchar(20), Customer_adderss varchar(20), Reg_date date);
-- Create Books Table
create table Books(ISBN varchar(20) primary key, Book_title varchar(20), Category varchar(20), Rental_Price int, Status enum('yes','no'), Author varchar(30), Publisher varchar(20));
-- Create IssueStatus Table
create table IssueStatus(Issue_id int primary key, Issued_cust int, foreign key(Issued_cust)references Customer(Customer_id), Issued_book_name varchar(20), Issue_date date, Isbn_book varchar(30), foreign key(Isbn_book)references Books(ISBN));
-- Create ReturnStatus Table
create table ReturnStatus(Return_id int primary key, Return_cust varchar(20), Return_book_name varchar(30), Rerturn_date date, Isbn_book2 varchar(20), foreign key(Isbn_book2)references Books(ISBN));
-- Inserting values into Branch Table
insert into Branch(Branch_no, Manager_id, Branch_adderss, Contact_no)values(1, 116, 'jhs322', 6657678788),
                                                                           (2, 160, 'hes327', 7878776678),
                                                                           (3, 211, 'shv333', 6327697638),
                                                                           (4, 385, 'kjx381', 9238047287);

-- Inserting values into Employee Table
insert into Employee(Emp_id, Emp_name, Position, salary, Branch_no)values(116, 'thomas', 'librarian', 50000, 1),
                                                                         (160, 'dani', 'ass.librarian', 30000, 2),
                                                                         (211, 'olivia', 'clerk', 20000, 3),
                                                                         (385, 'ammu', 'typist', 10000, 4);
--Inserting values into Customer Table
insert into Customer(Customer_id, Customer_name, Customer_adderss, Reg_date)values(42, 'aleena', 'ghi592', '2010-08-10'),
                                                                                  (43, 'john', 'hju523', '2011-03-13'), 
                                                                                  (44, 'abi', 'ksb187', '2011-01-18'),
                                                                                  (45, 'niya', 'fha079', '2013-07-12');
-- Inserting values into Books Table 
insert into Books values('8171300243', 'GOAT LIFE', 'NOVEL', 450, 'yes', 'BENYAMIN', 'DC BOOKS'),
					   ('0443377450', 'PRIDE AND PREJUDICE', 'NOVEL', 440, 'yes', 'JANE AUSTEN', 'Dover Publications'),
					   ('97887264755568', 'PREMALEKHANAM', 'ROMANCE', 350, 'yes', 'VAIKOM MUHAMMAD BASHEER', 'DC BOOKS'),
					   ('9780143416333', 'RAM C\O ANANDI', 'NOVEL', 350, 'no', 'AKHIL PI DHARMAJAN', 'PENGUIN BOOKS');
-- Inserting values into IssueStatus Table  
insert into IssueStatus values(200, 42, 'PRIDE AND PREJUDICE', '2020-03-28', '0443377450'),
                              (201, 43, 'GOAT LIFE', '2013-08-10', '8171300243'),
                              (202, 44, 'RAM C\O ANANDI', '2018-05-17', '9780143416333'),
                              (203, 45, 'PREMALEKHANAM', '2023-12-10', '97887264755568');
-- Insreting values into ReturnStatus Table 
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
-- (1) Retrieve the Book Title, Category and Rental Price off all available books 
select  Book_title, Category, Rental_Price from Books where status='yes';
-- (2) List the Employee names and their respective Salaries in descending order of Salary 
select Emp_name, Salary from Employee order by Salary desc;
-- (3) Retrieve the Books Title and the corresponding Customer who have Issued those Books    
select Books.Books_title, Customer.Customer_name from IssueStatus  inner join Books on IssueStatus.Isbn_book = Books.ISBN join Customer on IssueStatus.Issued_cust = Customer.Customer_id;
-- (4) Display the Total count of Books in each Category 
select Category, count(*)as TotalBooks from Books group by Category;
-- (5) Retrieve the Emoployee name and their Postion for the Employees whose Salaries are above 50,000 
select Emp_name, Position, Salary from Empolyee where Salary>50000;
-- (6) List the Customer name who registered before '2022-01-01' and have not Issued any Books yet
select Customer.Customer_name from Customer where Reg_date<'2022-01-01' and Customer_id not in (select Issued_cust from IssueStatus);
-- (7) Display the Branch number and total no of Employees in each Branch 
select Branch_no, count(*)as TotalEmployees From Employee group by Branch_no;
-- (8) Display the names of Customers  who have Issued Books in the month of june
select Customer.Customer_name from IssueStatus inner join Customer on IssueStatus.Issued_cust = Customer.Customer_id where year(Issue_date)=2023 and month(Issue_date)=6;
-- (9) Retrieve the Book Title from Book Table  containing history
select Book_title from Books where Category ='Historical Fiction';
-- (10) Retrieve the Branch number along with the count of Employees for Branches having more than 5 Employees
select Branch_no, count(*)as Employee_Count From Employee group by Branch_no having count(*)>5;   
                       
                         
                       
                                                                                     
