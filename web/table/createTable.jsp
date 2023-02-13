<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    try{
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        String q1="create table student(email varchar(100) primary key,name varchar(100),mobileNumber bigint unique,department varchar(50);studentid varchar(20) unique,session varchar(50),sequrityQuestion varchar(200),answer varchar(200),password varchar(100))";
        String q6="create table alumni(email varchar(100) primary key,name varchar(100),mobileNumber bigint,admissionSession varchar(50),passingSession varchar(50),sequrityQuestion varchar(200),answer varchar(200),password varchar(100),studentid varchar(20) unique,department varchar(20),employeeStatus varchar(10),companyName varchar(100),designation varchar(100),jobYear varchar(20),alumniType varchar(50),status varchar(50))";
        String q2="create table notice(noticeId int primary key auto_increment,noticeSubject varchar(500),noticeDescription varchar(2000))";
        String q3="create table event(eventId int primary key AUTO_INCREMENT,type varchar(50),title varchar(1000),date varchar(20),time varchar(20),venue varchar(200),description varchar(2000),status varchar(100))";
        String q4="create table meeting(meetingId int primary key AUTO_INCREMENT,date varchar(100),time varchar(100),description varchar(2000)";
        String q5="create table job(jobId int primary key AUTO_INCREMENT,cName varchar(200),cProfile varchar(200),vPosition varchar(200),description varchar(2000),vCategory varchar(200),location varchar(500),experience varchar(100),deadline varchar(50),type varchar(50),cPerson varchar(200),phone bigint,email varchar(200))";
        String q7="create table fundsDetails(fundId int primary key AUTO_INCREMENT,fName varchar(500),fDescription varchar(2000),amount varchar(50),deadline varchar(50),status varchar(50))";
        String q8="create table fundsPayment(paymentId int primary key AUTO_INCREMENT,email varchar(200),date varchar(100),time varchar(100),paymentMethod varchar(100),paymentBy varchar(100),transectionId varchar(100),amount varchar(50),status varchar(50),fundId int,foreign key(fundId) references fundsDetails(fundId))";
        String q9="create table membershipFee(feesId int primary key AUTO_INCREMENT,month varchar(50),date varchar(100),time varchar(100),paymentMethod varchar(50),paymentBy varchar(100),transectionId varchar(100),amount varchar(50),status varchar(50),email varchar(200),foreign key(email) references alumni(email))";
        String q10="create table alumniAccount(email int primary key AUTO_INCREMENT,month varchar(50),date varchar(100),time varchar(100),paymentMethod varchar(50),paymentBy varchar(100),TransectionId varchar(100),amount varchar(50),status varchar(50),email varchar(200),foreign key(email) references alumniAccount(email))";
        String q11="create table contact(contactId int primary key AUTO_INCREMENT,mFrom varchar(100),mTo varchar(100),subject varchar(500),message varchar(5000))";
        String q12="create table associationAccount(Id int primary key AUTO_INCREMENT,totalAmount varchar(50),fundId int,fundCollection varchar(50),fundCost varchar(50),eventId int,eventCollection varchar(50),eventCost varchar(50),,foreign key(fundId) references fundsDetails(fundId),foreign key(eventId) references event(eventId))";
        st.execute(q1);
        st.execute(q2);
        st.execute(q3);
        st.execute(q4);
        System.out.println("Table Created");
        con.close();
        
    }catch(Exception e)
    {System.out.println(e);
    }

%>