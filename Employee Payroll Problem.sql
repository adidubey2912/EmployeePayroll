--UC1-Create database
create database Payroll_Service;
use Payroll_Service;

--UC2-Create table
create table EmployeePayroll(ID int identity(1,1)primary key, Empname varchar(200), Salary bigint, Startdate date);

--UC3-Insert record
insert into EmployeePayroll (Empname,Salary,Startdate) values ('Ram',25000,'2019-05-01');

--UC4-Retrive data
select * from EmployeePayroll;

--UC5-Retrive data with whare condittion
select * from EmployeePayroll where Empname='Aditya';
select * from EmployeePayroll where Startdate BETWEEN CAST('2018-01-01' AS DATE) AND Getdate();

--UC6-Add coloum and update row
alter table EmployeePayroll add Gender char(1);
update EmployeePayroll set Gender='M' where Empname='Aditya';

--UC7-Find sum, average, min, max and number of male and female employees
select Sum(Salary) as Total_SUM from EmployeePayroll where Gender='M' group by Gender;
select Avg(Salary) as AvgSalary from EmployeePayroll where Gender='M' group by Gender;
select Min(Salary) as MinSalary from EmployeePayroll where Gender='M' group by Gender;
select Max(Salary) as MaxSalary from EmployeePayroll where Gender='M' group by Gender;
select Gender, count(*) as TotalRecord from EmployeePayroll group by Gender;

--UC8-Data to store employee information like employee phone, address and department
alter table EmployeePayroll add PhoneNumber bigint, Address varchar(200), Department varchar(50) not null default('Tester');

--UC-9-extend employee_payroll table to have Basic Pay, Deductions, Taxable Pay, Income Tax, Net Pay
alter table EmployeePayroll add  BasicPay float not null default ('0'), Deductions float not null default ('0'), TaxablePay float not null default ('0'), IncomeTax float not null default ('0'), NetPay float  not null default ('0');

select * from EmployeePayroll

--UC-10
insert into EmployeePayroll (Empname,Salary,Startdate,Gender,PhoneNumber,Address,Department,BasicPay,Deductions,TaxablePay,IncomeTax,Netpay) 
values ('Terisa',26000,'2019-01-03','F',7878797920,'Mumbai','HR',20000,2000,1000,200,18000);

select * from EmployeePayroll where Empname='Terisa';






