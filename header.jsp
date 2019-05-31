<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<script type="text/javascript" src="./js/orion.js"></script>
<!-- 全てのJSPでインクルードするJSP -->
<header>
<div id="header">
<div id="header-title">
 <img src="http://yasuhiro-portfolio.com/wp-content/uploads/2019/05/logo_white.png">
</div>
<div id="header-menu">
<ul>

<s:form id="form" name="form">

	<!-- カテゴリリストがnullでない、もしくは1つ以上のカテゴリが存在する場合 -->
	<!-- #をつけると、通信の方のsessionを指定できる -->
	<s:if test='#session.mCategoryDTOList != null && #session.mCategoryDTOList.size() > 0'>
	<!-- カテゴリを選ぶselectボックスを生成 -->
	<li><s:select name="categoryId" list="#session.mCategoryDTOList" listValue="categoryName" listKey="categoryId" class="cs-div" id="categoryId"/></li>
	</s:if>

	<!-- 検索ボックスと検索ボタン -->
	<li><s:textfield name="keywords" class="txt-keywords" placeholder="検索ワード" /></li>
	<li><s:submit value="商品検索" class="submit_btn" onclick="goSearchItemAction();"/></li>

	<!-- ログインしている場合 -->
	<s:if test="#session.loggedIn == 1">
	<li><s:submit value="ログアウト" class="submit_btn" onclick="goLogoutAction();"/></li>
	</s:if>
	<!-- ログインしていない場合 -->
	<s:else>
		<li><s:submit value="ログイン" class="submit_btn" onclick="goGoLoginAction();"/></li>
	</s:else>

	<li><s:submit value="カート" class="submit_btn" onclick="goCartAction();"/></li>
	<li><s:submit value="商品一覧" class="submit_btn" onclick="goProductListAction();"/></li>

	<!-- ログインしている場合 -->
	<s:if test="#session.loggedIn == 1">
		<li><s:submit value="マイページ" class="submit_btn" onclick="goMyPageAction();"/></li>
	</s:if>
</s:form>
</ul>
</div>
</div>
</header>