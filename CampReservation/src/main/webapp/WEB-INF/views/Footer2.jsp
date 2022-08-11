<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    ul { /* ul의 하위요소(li) 수평정렬을 위해 기본마진, 패딩 제거 */
    margin: 0;
    padding: 0;
  }
  footer {
    width: 70%;
    height: 250px;
    margin: auto;
    padding: 0 8px 0 8px; /* 각각 위 오른쪽 아래 왼쪽 */
    display: flex;
    flex-direction: column; /* 요소들을 수평정렬 */
    font-size: 12px;
  }
  .notice_box {
    flex: 1;
    display: flex;
    justify-content: space-between; /* 양끝 정렬 */
    align-items: center;
    border-bottom: 1px solid #f1f3f6;
  }
  .notice_box a {
    font-weight: bold;
    color: black;
  }
  .aside_box {
    flex: 2;
    display: flex;
    align-items: center;
    border-bottom: 1px solid #f1f3f6;
  }
  .area_user {
    flex: 4;
    line-height: 2em; /* 줄간격 */
  }
  .area_user_row {
    display: flex;
  }
  .area_user_row span {
    flex: 1;
  }
  .area_user_row ul {
    flex: 6;
  }
  .aur_title {
    font-size: 13px;
    font-weight: bold;
  }
  .area_user_row ul > li {
    display: inline-block; /* li 수평정렬하는 방법 */
    margin-left: 8px;
  }
  .area_col {
    flex: 1;
    display: flex;
  }
  .area_col .ac_content {
    line-height: 20px;
  }
  .area_col .ac_img {
    width: 60px;
    height: 60px;
  }
  .bottom_box {
    flex: 3;
    padding-top: 20px;
    font-size: 14px;
  }
  .bottom_box ul > li {
    display: inline-block; /* 수평정렬 */
    margin-left: 8px;
  }
  .bottom_box ul > li:last-child { /* 마지막 li요소 (Naver Corp.) 굵게 */
    font-weight: bold;
  }
  /* 재사용 클래스 */
  .color_naver {
    color: #03cf5d;
  }
  .text_bold-13 {
    font-weight: bold;
    font-size: 20px;
  }
</style>

</head>
<body>
  <footer>
    <div class="notice_box">
      <a style="color: white;" href="/noticelist?com_cate=공지">공지사항</a>
      <a style="color: white;"href="/">서비스 전체보기></a>
    </div>
    <div class="aside_box">
      <div class="area_user">
        <div class="area_user_row">
          <span class="text_bold-13">Developers</span>
          <ul>
            <li><a href="https://github.com/yyci12" target='_blank'>양윤열</a></li>
            <li><a href="https://github.com/malut98" target='_blank'>김동하</a></li>
            <li><a href="https://github.com/seungho0716" target='_blank'>최승호</a></li>
            <li><a href="https://github.com/Jeonduksu" target='_blank'>전덕수</a></li>
          </ul>
        </div>
        <div class="area_user_row">
          <span class="text_bold-13">MENU</span>
          <ul>
            <li><a href="/clist/ca">숙소예약</a></li>
            <li><a href="/usedtradelist">중고거래</a></li>
            <li><a href="/communitylist">커뮤니티</a></li>
            <li><a href="/login">로그인</a></li>
          </ul>
        </div>
      </div>
      <div class="area_col">
        <div class="ac_content">
          <div class="text_bold-13">CampMoa</div>
        </div>
        <a href="/"><img src="/resources/img/logo/logo (2).png" class="ac_img"/></a>
      </div>
      <div class="area_col">
        <div class="ac_content">
          <div class="text_bold-13">GITHUB</div>
          <div class="ac_link"><a href="/"></a></div>
        </div>
        <a href="https://github.com/malut98/CampReservation" target='_blank'><img src="/resources/img/25231.png" class="ac_img"/></a>
      </div>
    </div>
    <div class="bottom_box">
      <ul>
        <li><a href="/">Copyright &copy; <a href="/"><strong>CampMoa</strong></a>
          All Rights Reserved.</a></li>
      </ul>
    </div>
  </footer>
</body>
</html>