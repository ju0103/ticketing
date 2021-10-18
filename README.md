# 티켓팅
---

## 💻 실행 환경
- windows 10
- eclipse 2020-06
- Apache Tomcat 7.0

## 💻 실행하기
---
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
2. <Context></Context> 내에 아래 소스를 추가
    ``` xml
    <Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" maxActive="100" maxIdle="30" maxWait="10000" name="jdbc/oracle" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="TICKETING"/>
    ```

## 📂 폴더 구조
---
```bash
.
+-- src
|   +-- myUtil
|   |   +-- HanConv.java
|   +-- tickeing.member
|   |   +-- MemberBean.java
|   |   +-- MemberDBBean.java
|   +-- tickeing.manager
|   |   +-- ManagerBean.java
|   |   +-- ManagerDBBean.java
+-- WebContent
|   +-- member
|   |   +-- memberLoginForm.jsp
|   |   +-- memberLoginOk.jsp
|   |   +-- memberLogout.jsp
|   |   +-- memberRegisterForm.jsp
|   |   +-- memberRegisterOk.jsp
|   |   +-- memberUpdateForm.jsp
|   |   +-- memberUpdateOk.jsp
|   |   +-- memberDeleteForm.jsp
|   |   +-- memberDeleteOk.jsp
|   +-- manager
|   |   +-- managerLoginForm.jsp
|   |   +-- managerLoginOk.jsp
|   |   +-- managerLogout.jsp
|   |   +-- managerRegisterForm.jsp
|   |   +-- managerRegisterOk.jsp
|   +-- index.jsp
|   +-- managerMain.jsp
```