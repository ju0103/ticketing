# ํฐ์ผํ

## ๐ป ์คํ ํ๊ฒฝ

- windows 10
- eclipse 2020-06
- Apache Tomcat 7.0

## ๐ป ์คํํ๊ธฐ

### Oracle์ ์ฌ์ฉ์ ์ถ๊ฐ

1. System ๊ณ์ ์ผ๋ก ์ ์ํ์ฌ 'TICKETING'์ด๋ผ๋ ์ด๋ฆ์ ์ฌ์ฉ์๋ฅผ ์ถ๊ฐํ๋ค.

2. 'TICKETING' ์ฌ์ฉ์๋ก ๋ฐ์ดํฐ๋ฒ ์ด์ค์ ์ ์ํ๋ค.

3. [ํ์ผ] > [์ด๊ธฐ] ์์ ๋ค์ด ๋ฐ์ 'ticketingSchema.ddl'์ ํด๋ฆญํ๋ค.

4. F5ํค๋ฅผ ํด๋ฆญํ์ฌ ์คํฌ๋ฆฝํธ๋ฅผ ์คํํ๋ค.

### context ๋ฐ DBCP ๋ฑ๋ก

1. Server.xml ํ์ผ ํ๋จ์ ์๋ ์์ค๋ฅผ ์ถ๊ฐ
   ```xml
   <Context docBase="TicketingWebApp" path="/TicketingWebApp" reloadable="true" source="org.eclipse.jst.jee.server:TicketingWebApp"></Context>
   ```
2. `<Context></Context>` ๋ด์ ์๋ ์์ค๋ฅผ ์ถ๊ฐ
   ```xml
   <Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" maxActive="100" maxIdle="30" maxWait="10000" name="jdbc/oracle" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="TICKETING"/>
   ```

### ๊ณต์ฐ ์ด๋ฏธ์ง ์๋ก๋ ๊ด๋ จ

- performance ํ์ด๋ธ insert (perfor_RegisterForm.jsp) ๊ณต์ฐํฌ์คํฐ ์๋ก๋ ์ ๋ณธ์ธ workspace ํ์ ๊ฒฝ๋ก์ upload ํ์ผ ์์ฑ
  - Ex) D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TicketingWebApp\upload

### ์คํ ํ์ผ ์ด๋ฆ

- ๊ด๋ฆฌ์ ํ์ด์ง: managerMain ํด๋์ manager_Main.jsp
- ํ์ ํ์ด์ง: memberMain ํด๋์ member_Main.jsp

## โ ๊ธฐ๋ฅ ์ค๋ช

### ๊ด๋ฆฌ์ ํ์ด์ง

1. ๊ณต์ฐ ๊ด๋ฆฌ: ๊ณต์ฐ ๋ชฉ๋ก ์กฐํ ๋ฐ ๊ณต์ฐ ๋ฑ๋ก, ์์ , ์ญ์ 

   - ์ฐํธ ๋ฒํธ ์ฐพ๊ธฐ: ์นด์นด์ค ์ฃผ์ ์ฐพ๊ธฐ API ์ด์ฉ(์ฐธ๊ณ : [์นด์นด์ค ์ฐํธ๋ฒํธ ์๋น์ค](http://postcode.map.daum.net/guide)

2. ํ์ ๊ด๋ฆฌ: ํ์ ์ ๋ณด ์กฐํ ๋ฐ ์ญ์ 
3. FAQ ๊ด๋ฆฌ: ์์ฃผ ๋ฌป๋ ์ง๋ฌธ ์กฐํ ๋ฐ ๋ฑ๋ก, ์์ , ์ญ์ 
4. 1:1 ๋ฌธ์ ๊ด๋ฆฌ: 1:1 ๋ฌธ์ ์กฐํ, ๋ต๋ณ
5. ๊ณต์ง์ฌํญ ๊ด๋ฆฌ: ๊ณต์ง์ฌํญ ์กฐํ ๋ฐ ๋ฑ๋ก, ์์ , ์ญ์ 

### ํ์ ํ์ด์ง

1. ๋ฉ์ธ ํ์ด์ง: ๊ณต์ฐ ๋ชฉ๋ก ์กฐํ ๋ฐ ๊ณต์ฐ ์์ธ ์ ๋ณด ์กฐํ

   - ๊ณต์ฐ QnA: ๊ณต์ฐ QnA ์กฐํ ๋ฐ ๋ฑ๋ก, ์์ , ์ญ์ 
   - ๊ณต์ฐ ํ๊ธฐ: ๊ณต์ฐ ํ๊ธฐ ์กฐํ ๋ฐ ๋ฑ๋ก, ์์ , ์ญ์ 
   - ์๋งคํ๊ธฐ: ์ข์ ์ ํ ๋ฐ ๊ฒฐ์ , ์๋งค
     - ๊ฒฐ์ : [์์ํฌํธ](https://www.iamport.kr/) ํ์คํธ ๊ฒฐ์  ์ด์ฉ

2. ๋ง์ดํ์ด์ง: ๋์ ์๋งค ๋ด์ญ ์กฐํ, ๋์ ๋ฌธ์ ๋ด์ญ ์กฐํ, ํ์ ์ ๋ณด ์์  ๋ฐ ํํด
3. ๊ณ ๊ฐ ์ผํฐ: ๊ณต์ง์ฌํญ ๋ฐ FAQ ์กฐํ, 1:1 ๋ฌธ์ํ๊ธฐ

## ๐ ํด๋ ๊ตฌ์กฐ

```
src
 โฃ myUtil
 โ โฃ AscendingString.java
 โ โ HanConv.java
 โ ticketing
 โ โฃ faq
 โ โ โฃ FaqBean.java
 โ โ โ FaqDBBean.java
 โ โฃ inquiry
 โ โ โฃ InquiryBean.java
 โ โ โ InquiryDBBean.java
 โ โฃ manager
 โ โ โฃ ManagerBean.java
 โ โ โ ManagerDBBean.java
 โ โฃ member
 โ โ โฃ MemberBean.java
 โ โ โ MemberDBBean.java
 โ โฃ notice
 โ โ โฃ noticeBean.java
 โ โ โ noticeDBBean.java
 โ โฃ performance
 โ โ โฃ PerformanceBean.java
 โ โ โ PerformanceDBBean.java
 โ โฃ qna
 โ โ โฃ QnABean.java
 โ โ โ QnADBBean.java
 โ โฃ reservation
 โ โ โฃ ReservationBean.java
 โ โ โ ReservationDBBean.java
 โ โฃ review
 โ โ โฃ ReviewBean.java
 โ โ โ ReviewDBBean.java
WebContent
 โฃ css
 โ โ styles.css
 โฃ js
 โ โฃ check.js
 โ โฃ qna.js
 โ โ scripts.js
 โฃ images
 โ โ photo.png
 โฃ faq
 โ โฃ faq_DeleteForm.jsp
 โ โฃ faq_DeleteOk.jsp
 โ โฃ faq_RegisterForm.jsp
 โ โฃ faq_RegisterOk.jsp
 โ โฃ faq_UpdateForm.jsp
 โ โฃ faq_UpdateOk.jsp
 โ โฃ manager_faq_Left.jsp
 โ โฃ manager_faq_List.jsp
 โ โฃ member_faq_Left.jsp
 โ โ member_faq_List.jsp
 โฃ inquiry
 โ โฃ manager_inquiry_AnswerForm.jsp
 โ โฃ manager_inquiry_AnswerOk.jsp
 โ โฃ manager_inquiry_List.jsp
 โ โฃ member_inquiry_List.jsp
 โ โฃ member_inquiry_RegisterForm.jsp
 โ โฃ member_inquiry_RegisterOk.jsp
 โฃ manager
 โ โฃ manager_LoginForm.jsp
 โ โฃ manager_LoginOk.jsp
 โ โฃ manager_Logout.jsp
 โ โฃ manager_RegisterForm.jsp
 โ โฃ manager_RegisterOk.jsp
 โ โฃ membership_Delete.jsp
 โ โฃ membership_DeleteOk.jsp
 โ โฃ membership_View.jsp
 โ โ membership_ViewOk.jsp
 โฃ managerMain
 โ โฃ manager_Fotter.jsp
 โ โฃ manager_Header.jsp
 โ โ manager_Main.jsp
 โฃ member
 โ โฃ member_DeleteForm.jsp
 โ โฃ member_DeleteOk.jsp
 โ โฃ member_LoginForm.jsp
 โ โฃ member_LoginOk.jsp
 โ โฃ member_Logout.jsp
 โ โฃ member_RegisterForm.jsp
 โ โฃ member_RegisterOk.jsp
 โ โฃ member_ReservationMGRDelete.jsp
 โ โฃ member_ReservationMGRForm.jsp
 โ โฃ member_UpdateForm.jsp
 โ โ member_UpdateOk.jsp
 โฃ memberMain
 โ โฃ member_Fotter.jsp
 โ โฃ member_Header.jsp
 โ โ member_Main.jsp
 โฃ notice
 โ โฃ member_notice_View.jsp
 โ โฃ notice_DeleteOk.jsp
 โ โฃ notice_List.jsp
 โ โฃ notice_MemberList.jsp
 โ โฃ notice_Update.jsp
 โ โฃ notice_UpdateOk.jsp
 โ โฃ notice_View.jsp
 โ โฃ notice_Write.jsp
 โ โ notice_WriteOk.jsp
 โฃ performance
 โ โฃ manager_performance_List.jsp
 โ โฃ member_performance_List.jsp
 โ โฃ perform_Info.jsp
 โ โฃ performance_DeleteForm.jsp
 โ โฃ performance_DeleteOk.jsp
 โ โฃ performance_RegisterForm.jsp
 โ โฃ performance_RegisterOk.jsp
 โ โฃ performance_UpdateForm.jsp
 โ โฃ performance_UpdateOk.jsp
 โ โ performance_View.jsp
 โฃ qna
 โ โฃ qna_answer.jsp
 โ โฃ qna_delete.jsp
 โ โฃ qna_edit_ok.jsp
 โ โฃ qna_edit.jsp
 โ โฃ qna_list.jsp
 โ โฃ qna_main.jsp
 โ โฃ qna_write_ok.jsp
 โ โ qna_write.jsp
 โฃ reservation
 โ โฃ reservation_check.jsp
 โ โฃ reservation_form.jsp
 โ โฃ reservation_pay.jsp
 โ โ reservation_success.jsp
 โฃ review
 โ โฃ review_delete.jsp
 โ โฃ review_deleteOk.jsp
 โ โฃ review_edit.jsp
 โ โฃ review_editOk.jsp
 โ โฃ review_list.jsp
 โ โฃ review_writeForm.jsp
 โ โ review_writeOk.jsp
 โฃ service
 โ โ service_Main.jsp
 โฃ WEB--INF
 โ โฃ lib
 โ โ โฃ cos.jar
 โ โ โ upload.jar
```
