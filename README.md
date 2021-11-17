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
   ```xml
   <Context docBase="TicketingWebApp" path="/TicketingWebApp" reloadable="true" source="org.eclipse.jst.jee.server:TicketingWebApp"></Context>
   ```
2. `<Context></Context>` 내에 아래 소스를 추가
   ```xml
   <Resource auth="Container" driverClassName="oracle.jdbc.driver.OracleDriver" maxActive="100" maxIdle="30" maxWait="10000" name="jdbc/oracle" password="1234" type="javax.sql.DataSource" url="jdbc:oracle:thin:@localhost:1521:xe" username="TICKETING"/>
   ```

### 공연 이미지 업로드 관련

- performance 테이블 insert (perfor_RegisterForm.jsp) 공연포스터 업로드 시 본인 workspace 하위 경로에 upload 파일 생성
  - Ex) D:\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\TicketingWebApp\upload

### 실행 파일 이름

- 관리자 페이지: managerMain 폴더의 manager_Main.jsp
- 회원 페이지: memberMain 폴더의 member_Main.jsp

## ✔ 기능 설명

### 관리자 페이지

1. 공연 관리: 공연 목록 조회 및 공연 등록, 수정, 삭제

   - 우편 번호 찾기: 카카오 주소 찾기 API 이용(참고: [카카오 우편번호 서비스](http://postcode.map.daum.net/guide)

2. 회원 관리: 회원 정보 조회 및 삭제
3. FAQ 관리: 자주 묻는 질문 조회 및 등록, 수정, 삭제
4. 1:1 문의 관리: 1:1 문의 조회, 답변
5. 공지사항 관리: 공지사항 조회 및 등록, 수정, 삭제

### 회원 페이지

1. 메인 페이지: 공연 목록 조회 및 공연 상세 정보 조회

   - 공연 QnA: 공연 QnA 조회 및 등록, 수정, 삭제
   - 공연 후기: 공연 후기 조회 및 등록, 수정, 삭제
   - 예매하기: 좌석 선택 및 결제, 예매
     - 결제: [아임포트](https://www.iamport.kr/) 테스트 결제 이용

2. 마이페이지: 나의 예매 내역 조회, 나의 문의 내역 조회, 회원 정보 수정 및 탈퇴
3. 고객 센터: 공지사항 및 FAQ 조회, 1:1 문의하기

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
 ┃ ┣ notice
 ┃ ┃ ┣ noticeBean.java
 ┃ ┃ ┗ noticeDBBean.java
 ┃ ┣ performance
 ┃ ┃ ┣ PerformanceBean.java
 ┃ ┃ ┗ PerformanceDBBean.java
 ┃ ┣ qna
 ┃ ┃ ┣ QnABean.java
 ┃ ┃ ┗ QnADBBean.java
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
 ┃ ┣ qna.js
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
 ┃ ┣ member_ReservationMGRDelete.jsp
 ┃ ┣ member_ReservationMGRForm.jsp
 ┃ ┣ member_UpdateForm.jsp
 ┃ ┗ member_UpdateOk.jsp
 ┣ memberMain
 ┃ ┣ member_Fotter.jsp
 ┃ ┣ member_Header.jsp
 ┃ ┗ member_Main.jsp
 ┣ notice
 ┃ ┣ member_notice_View.jsp
 ┃ ┣ notice_DeleteOk.jsp
 ┃ ┣ notice_List.jsp
 ┃ ┣ notice_MemberList.jsp
 ┃ ┣ notice_Update.jsp
 ┃ ┣ notice_UpdateOk.jsp
 ┃ ┣ notice_View.jsp
 ┃ ┣ notice_Write.jsp
 ┃ ┗ notice_WriteOk.jsp
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
 ┣ qna
 ┃ ┣ qna_answer.jsp
 ┃ ┣ qna_delete.jsp
 ┃ ┣ qna_edit_ok.jsp
 ┃ ┣ qna_edit.jsp
 ┃ ┣ qna_list.jsp
 ┃ ┣ qna_main.jsp
 ┃ ┣ qna_write_ok.jsp
 ┃ ┗ qna_write.jsp
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
