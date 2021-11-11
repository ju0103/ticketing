# 티켓팅

## 💻 실행 환경
- windows 10
- eclipse 2020-06
- Apache Tomcat 7.0

## 💻 실행하기
### Oracle에 사용자 추가
1. System 계정으로 접속하여 'TICKETING'이라는 이름의 사용자를 추가한다.

2. 'TICKETING' 사용자로 데이터베이스에 접속한다.

3. [파일] > [열기] 에서 다운 받은 'ticketingSchema.ddl'을 클릭한다.

4. F5키를 클릭하여 스크립트를 실행한다.

### context 및 DBCP 등록
1. Server.xml 파일 하단에 아래 소스를 추가
    ``` xml
    <Context docBase="TicketingWebApp" path="/TicketingWebApp" reloadable="true" source="org.eclipse.jst.jee.server:TicketingWebApp"></Context>
    ```
2. `<Context></Context>` 내에 아래 소스를 추가
    ``` xml
    <Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" maxActive="100" maxIdle="30" maxWait="10000" name="jdbc/oracle" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="TICKETING"/>
    ```
    
### 공연 이미지 업로드 관련
performance 테이블 insert (perfor_RegisterForm.jsp) 공연포스터 업로드 시 본인 workspace 하위 경로에 upload 파일 생성

Ex) D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TicketingWebApp\upload


## 📂 폴더 구조
```
src
 ┣ myUtil
 ┃ ┣ AscendingString.java
 ┃ ┗ HanConv.java
 ┗ ticketing
 ┃ ┣ faq
 ┃ ┃ ┣ FaqBean.java
 ┃ ┃ ┗ FaqDBBean.java
 ┃ ┣ inquiry
 ┃ ┃ ┣ InquiryBean.java
 ┃ ┃ ┗ InquiryDBBean.java
 ┃ ┣ manager
 ┃ ┃ ┣ ManagerBean.java
 ┃ ┃ ┗ ManagerDBBean.java
 ┃ ┣ member
 ┃ ┃ ┣ MemberBean.java
 ┃ ┃ ┗ MemberDBBean.java
 ┃ ┣ performance
 ┃ ┃ ┣ PerformanceBean.java
 ┃ ┃ ┗ PerformanceDBBean.java
 ┃ ┣ reservation
 ┃ ┃ ┣ ReservationBean.java
 ┃ ┃ ┗ ReservationDBBean.java
 ┃ ┣ review
 ┃ ┃ ┣ ReviewBean.java
 ┗ ┗ ┗ ReviewDBBean.java
WebContent
 ┣ css
 ┃ ┗ styles.css
 ┣ js
 ┃ ┣ check.js
 ┃ ┗ scripts.js
 ┣ images
 ┃ ┗ photo.png
 ┣ faq
 ┃ ┣ faq_DeleteForm.jsp
 ┃ ┣ faq_DeleteOk.jsp
 ┃ ┣ faq_RegisterForm.jsp
 ┃ ┣ faq_RegisterOk.jsp
 ┃ ┣ faq_UpdateForm.jsp
 ┃ ┣ faq_UpdateOk.jsp
 ┃ ┣ manager_faq_Left.jsp
 ┃ ┣ manager_faq_List.jsp
 ┃ ┣ member_faq_Left.jsp
 ┃ ┗ member_faq_List.jsp
 ┣ inquiry
 ┃ ┣ manager_inquiry_AnswerForm.jsp
 ┃ ┣ manager_inquiry_AnswerOk.jsp
 ┃ ┣ manager_inquiry_List.jsp
 ┃ ┣ member_inquiry_List.jsp
 ┃ ┣ member_inquiry_RegisterForm.jsp
 ┃ ┣ member_inquiry_RegisterOk.jsp
 ┣ manager
 ┃ ┣ manager_LoginForm.jsp
 ┃ ┣ manager_LoginOk.jsp
 ┃ ┣ manager_Logout.jsp
 ┃ ┣ manager_RegisterForm.jsp
 ┃ ┣ manager_RegisterOk.jsp
 ┃ ┣ membership_Delete.jsp
 ┃ ┣ membership_DeleteOk.jsp
 ┃ ┣ membership_View.jsp
 ┃ ┗ membership_ViewOk.jsp
 ┣ managerMain
 ┃ ┣ manager_Fotter.jsp
 ┃ ┣ manager_Header.jsp
 ┃ ┗ manager_Main.jsp
 ┣ member
 ┃ ┣ member_DeleteForm.jsp
 ┃ ┣ member_DeleteOk.jsp
 ┃ ┣ member_LoginForm.jsp
 ┃ ┣ member_LoginOk.jsp
 ┃ ┣ member_Logout.jsp
 ┃ ┣ member_RegisterForm.jsp
 ┃ ┣ member_RegisterOk.jsp
 ┃ ┣ member_UpdateForm.jsp
 ┃ ┗ member_UpdateOk.jsp
 ┣ memberMain
 ┃ ┣ member_Fotter.jsp
 ┃ ┣ member_Header.jsp
 ┃ ┗ member_Main.jsp
 ┣ performance
 ┃ ┣ manager_performance_List.jsp
 ┃ ┣ member_performance_List.jsp
 ┃ ┣ perform_Info.jsp
 ┃ ┣ performance_DeleteForm.jsp
 ┃ ┣ performance_DeleteOk.jsp
 ┃ ┣ performance_RegisterForm.jsp
 ┃ ┣ performance_RegisterOk.jsp
 ┃ ┣ performance_UpdateForm.jsp
 ┃ ┣ performance_UpdateOk.jsp 
 ┃ ┗ performance_View.jsp
 ┣ reservation
 ┃ ┣ reservation_check.jsp
 ┃ ┣ reservation_form.jsp
 ┃ ┣ reservation_pay.jsp 
 ┃ ┗ reservation_success.jsp
 ┣ review
 ┃ ┣ review_delete.jsp
 ┃ ┣ review_deleteOk.jsp
 ┃ ┣ review_edit.jsp
 ┃ ┣ review_editOk.jsp
 ┃ ┣ review_list.jsp
 ┃ ┣ review_writeForm.jsp
 ┗ ┗ review_writeOk.jsp
 ┣ service
 ┃ ┗ service_Main.jsp
 ┣ WEB--INF
 ┃ ┣ lib
 ┃ ┃ ┣ cos.jar
 ┗ ┗ ┗ upload.jar
```