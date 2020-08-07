
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/jsp/part/head.jspf"%>


<!-- 하이라이트 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/highlight.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/styles/default.min.css">

<!-- 하이라이트 라이브러리, 언어 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/css.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/javascript.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/xml.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/php-template.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/10.1.1/languages/sql.min.js"></script>

<!-- 코드 미러 라이브러리 추가, 토스트 UI 에디터에서 사용됨 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css" />

<!-- 토스트 UI 에디터, 자바스크립트 코어 -->
<script
	src="https://uicdn.toast.com/editor/latest/toastui-editor-viewer.min.js"></script>

<!-- 토스트 UI 에디터, 신택스 하이라이트 플러그인 추가 -->
<script
	src="https://uicdn.toast.com/editor-plugin-code-syntax-highlight/latest/toastui-editor-plugin-code-syntax-highlight-all.min.js"></script>

<!-- 토스트 UI 에디터, CSS 코어 -->
<link rel="stylesheet"
	href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

<!-- LIST.JSP  -->



<meta http-equiv="Content-Type"
	content="text/html; charset=ks_c_5601-1987" />

<link href="/chaoscube2.ico" rel="shortcut icon">


<Script language="javascript">
	function save_move() {
		var submitFlag1 = 0;
		for (jj = 0; jj < document.mul_del.elements.length; ++jj) {
			if (document.mul_del.elements[jj].name == 'multiview') {
				if (document.mul_del.elements[jj].checked == true) {
					submitFlag1 = 1;
					document.mul_del.action = './save_move.asp';
					document.mul_del.submit();
					break;
				}
			}
		}

		if (submitFlag1) {
			return true;
		} else {
			alert("checkbox 항목을 선택해주시고 이동해주세요");
		}
	}

	function mul_check() {
		sure = confirm('해당 쪽지들을 정말! 정말! 삭제하실건가요?')
		if (sure) {

			var submitFlag = 0;
			for (i = 0; i < document.mul_del.elements.length; ++i) {
				if (document.mul_del.elements[i].name == 'multiview') {
					if (document.mul_del.elements[i].checked == true) {
						submitFlag = 1;
						document.mul_del.action = './del.asp';
						document.mul_del.submit()
						break;
					}
				}
			}

			if (submitFlag) {
				return true
			} else {
				alert("checkbox 항목을 선택해주시고 삭제해주세요");
			}

		}
	}

	var checkflag = "false";

	function check(field, n) {
		if (n = 1) {
			if (checkflag == "false") {
				for (i = 0; i < field.length; i++) {
					field[i].checked = true;
				}
				checkflag = "true";
			} else {
				for (i = 0; i < field.length; i++) {
					field[i].checked = false;
				}
				checkflag = "false";
			}
		}
	}

	function out() {
		opener.location.reload()
		window.close()
	}

	var home_url = "";
	var g4_path = "";
	var g4_bbs = "";
	var g4_bbs_img = "";
	var g4_url = "";
	var g4_is_member = "1";
	var g4_is_admin = "";
	var g4_bo_table = "";
	var g4_sca = "";
	var g4_charset = "";
	var g4_is_gecko = navigator.userAgent.toLowerCase().indexOf("gecko") != -1;
	var g4_is_ie = navigator.userAgent.toLowerCase().indexOf("msie") != -1;

	self.focus();
</Script>


<link rel="stylesheet" href="/include/dia.css" type="text/css">
<title>카오스큐브 - 큐브레인저</title>
<script language="javascript" src="./sideview.js"></script>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	bgcolor="#E1EEF5">

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tr>
			<td>

				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					align="center">
					<tr height="30" bgcolor="#5A5A5A">
						<td width="35%" style="color: #FFFC00; padding-left: 7px;"><b>큐브레인저</b>님
						</td>
						<td width="65%" align="right"
							style="color: #ffffff; padding-right: 7px;"><a
							href="./list.asp" style="color: #FF9900;">받은쪽지</a> | <a
							href="./list_sent.asp" style="color: #ffffff;">보낸쪽지</a> | <a
							href="./list_f.asp" style="color: #ffffff;">친구목록</a> | <a
							href="./cppwd.asp" style="color: #ffffff;">CP안심번호</a> | <a
							href="./list_glass.asp" style="color: yellow">CP안경</a></td>
					</tr>
				</table>
			</td>
		</tr>
		<form name="mul_del" action="" method="post">
			<tr>
				<td valign="top">
					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="stex">
						<tr height="65">
							<td style="line-height: 18px;">받은날부터 15일, 쪽지수 150개를 초과하면
								삭제처리 되며, 삭제된 쪽지는 복구할 수 없습니다.<br> 타회원으로부터 전달된 CP쪽지를 수령 전에
								삭제하시면 CP도 함께 삭제되오니 유의해주세요.<br> <font color="blue">타회원으로부터
									받은 CP는 사이트에서 즉시사용 가능하나 재전송하려면 만48시간이 지나야합니다</font>
							</td>
						</tr>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="stex">
						<tr align="center" height="25">
							<td width="30"><input type="checkbox"
								onClick="this.value=check(this.form.elements,1)"></td>
							<td width="330"><b>제목</b></td>
							<td width="140"><b>보낸이</b></td>
							<td width="50"><b>날짜</b></td>
						</tr>
						<tr bgcolor="#808080">
							<td height="1" colspan="4"></td>
						</tr>
						<tr bgcolor="#DFE9EC">
							<td height="3" colspan="4"></td>
						</tr>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="mtex">

					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" height="34">
						<tr valign="bottom" align="center">
							<td><input type="button" value="선택쪽지 삭제"
								onclick="mul_check();"
								style="font-size: 12px; width: 80; height: 20; border: 1px solid #000000;">
								<input type="button" value="새쪽지 작성"
								onclick="location.href='./write.asp?msgchk1=1';"
								style="font-size: 12px; width: 80; height: 20; border: 1px solid #000000;">

							</td>
						</tr>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center">
						<tr height="40">
							<td align="center">
								<table border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</form>
		<tr height="10">
			<td></td>
		</tr>
		<tr>
			<td align="center">
				<!--<iframe src="/realclick/newadpage02.htm" width="470" height="70" frameborder="0"></iframe>-->
			</td>
		</tr>
	</table>

	<script>
		
	</script>

	<%@ include file="/jsp/part/foot.jspf"%>