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
    
### 10/25 performance 업데이트 관련
performance 테이블 insert (perfor_RegisterForm.jsp) 공연포스터 업로드 시 본인 workspace 하위 경로에 upload 파일 생성

Ex) D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TicketingWebApp\upload



## 📂 폴더 구조
```
src
 ┣ myUtil
 ┃ ┗ HanConv.java
 ┗ ticketing
 ┃ ┣ manager
 ┃ ┃ ┣ ManagerBean.java
 ┃ ┃ ┗ ManagerDBBean.java
 ┃ ┗ member
 ┃ ┃ ┣ MemberBean.java
 ┃ ┃ ┗ MemberDBBean.java
WebContent
 ┣ css
 ┃ ┗ styles.css
 ┣ js
 ┃ ┗ scripts.js
 ┣ manager
 ┃ ┣ managerLoginForm.jsp
 ┃ ┣ managerLoginOk.jsp
 ┃ ┣ managerLogout.jsp
 ┃ ┣ managerRegisterForm.jsp
 ┃ ┗ managerRegisterOk.jsp
 ┣ managerMain
 ┃ ┗ managerMain.jsp
 ┣ member
 ┃ ┣ memberDeleteForm.jsp
 ┃ ┣ memberDeleteOk.jsp
 ┃ ┣ memberLoginForm.jsp
 ┃ ┣ memberLoginOk.jsp
 ┃ ┣ memberLogout.jsp
 ┃ ┣ memberRegisterForm.jsp
 ┃ ┣ memberRegisterOk.jsp
 ┃ ┣ memberUpdateForm.jsp
 ┃ ┗ memberUpdateOk.jsp
 ┣ memberMain
 ┃ ┣ footer.jsp
 ┃ ┣ header.jsp
 ┗ ┗ index.jsp
```
