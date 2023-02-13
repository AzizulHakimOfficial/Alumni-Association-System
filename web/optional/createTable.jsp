<%@page  import="database.ConnectionProvider" %>
<%@page  import="java.sql.*" %>
<%
    try{
        Connection con=ConnectionProvider.getCon();
        Statement st=con.createStatement();
        String q1="create table user(userId int primary key auto_increment,name varchar(255),email varchar(255),password varchar(50),gender varchar(50),about varchar(500),Registration_Date timestamp on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,profile varchar(100))";
        String q6="create table categories(catId int primary key auto_increment,name varchar(100),description varchar(1000))";
        String q2="create table posts(pId int primary key auto_increment,pTitle varchar(500),pContent varchar(2000),pCode varchar(500),pPic varchar(50),pDate timestamp on update CURRENT_TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,catId int,userId int,foreign key(catId) references categories(catId),,foreign key(userId) references user(userId))";
        String q3="create table liked(userId int,pId int,foreign key(pId) references posts(pId),foreign key(userId) references user(userId))";
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