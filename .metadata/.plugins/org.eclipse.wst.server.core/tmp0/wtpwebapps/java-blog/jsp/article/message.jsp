
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jstl 적용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/jsp/part/toastUiEditor.jspf" %>


<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- 구글 폰트 불러오기 -->
<!-- rotobo(400/900), notosanskr(400/900) -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;900&family=Roboto:wght@400;900&display=swap"
	rel="stylesheet">

<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/css/all.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/common.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resource/css/home/main.css">

<!-- 제이쿼리 불러오기 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="${pageContext.request.contextPath}/resource/js/common.js"></script>
<script
	src="${pageContext.request.contextPath}/resource/js/home/main.js"></script>

<%="<style>.form1 .form-row:not(:first-child) { margin-top : 10px; }</style>"%>

<title>쪽지함</title>

<script>
	var loginedMemberId = parseInt("${loginedMemberId}");
	var isLogined = "${isLogined}" == "true";
	var loginedMember = null;
</script>


<script>
	var param = {};
</script>
<c:forEach var="pageParameter" items="${param}">
	<script>
		param["${pageParameter.key}"] = "${pageParameter.value}";
	</script>
</c:forEach>

<script>
	if (!param.jsAction) {
		param.jsAction = '';
	}

	var jsActions = param.jsAction.split(',');

	for ( var key in jsActions) {
		var jsActionFuncName = jsActions[key];

		$(function() {
			setTimeout(function() {
				if (window[jsActionFuncName]) {
					window[jsActionFuncName]();
				} else {
					console.error("jsAction으로 요청받은, " + jsActionFuncName
							+ " 함수는 존재하지 않아서 실행하지 못했습니다.");
				}
			}, 100);
		});
	}
</script>

<c:if test="${isLogined}">
	<script>
		loginedMember = {};
		loginedMember["id"] = parseInt("${loginedMember.id}");
		loginedMember["regDate"] = "${loginedMember.regDate}";
		loginedMember["loginId"] = "${loginedMember.loginId}";
		loginedMember["name"] = "${loginedMember.name}";
		loginedMember["nickname"] = "${loginedMember.nickname}";
		loginedMember["email"] = "${loginedMember.email}";
	</script>
</c:if>


<style>
/* cus */
.write-form-box {
    margin-top: 30px;
}
body {
	font-family: "굴림";
	font-size: 12px;
	text-decoration: none
}

td {
	font-family: "굴림";
	font-size: 12px;
	color: #555555;
	text-decoration: none
}

a:active {
	font-family: "굴림";
	font-size: 12px;
	color: #000000;
	text-decoration: none
}

a:link {
	font-family: "굴림";
	font-size: 12px;
	color: #666666;
	text-decoration: none
}

a:link {
	
}

a:hover {
	font-family: "굴림";
	font-size: 12px;
	color: #6699FF;
	text-decoration: none
}

.location {
	font-family: "굴림";
	font-size: 11px;
	color: #CC6633;
	text-decoration: none
}

.paging {
	font-family: "굴림";
	font-size: 11px;
	color: #555555;
	text-decoration: none
}

.board_title {
	font-family: "굴림";
	font-size: 11px;
	color: #D4D480;
	text-decoration: none;
	font-weight: bold
}

img, input, select {
	vertical-align: middle;
}

img {
	border: 0
}

.tail {
	color: #ff6600;
	font-size: 11px;
} /* 리스트 꼬리글 갯수 */
.num {
	color: #f2f2f2;
	font-size: 7pt;
	font-family: tahoma;
}

.num2 {
	color: #555555;
	font-size: 7pt;
	font-family: tahoma;
}

.stex {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
} /* 작은글씨 */
.mtex {
	color: #555555;
	font-size: 12px;
} /* 보통글씨 */
.BBig {
	color: #000000;
	font-size: 18pt;
	font-family: 굴림;
}

.news {
	color: #333333;
	font-size: 9pt;
	font-family: 굴림;
	line-height: 22px;
}

.subject {
	color: #0B418A;
	font-size: 9pt;
	font-family: 굴림;
}

a.subject:link {
	color: #0B418A;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.subject:visited {
	color: #0B418A;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.subject:hover {
	color: blue;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

.relay {
	color: #000000;
	font-size: 14px;
	font-family: 굴림;
}

.board_title2 {
	color: #FFFFCC;
	font-size: 14px;
	font-family: Dotum;
}

.notice {
	color: #666633;
	font-size: 12px;
	text-decoration: none;
	font-weight: bold;
} /* 공지 링크 */
a.notice:link {
	color: #666633;
	font-size: 12px;
	text-decoration: none;
	font-weight: bold;
}

a.notice:visited {
	color: #666633;
	font-size: 12px;
	text-decoration: none;
	font-weight: bold;
}

a.notice:hover {
	color: #666633;
	font-size: 12px;
	text-decoration: underline;
	font-weight: bold;
}

a.slink:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* 작은 링크 */
a.slink:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.slink:hover {
	color: #4A88D2;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

.nlink {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* 보통 링크 */
a.nlink:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nlink:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nlink:hover {
	color: #4A88D2;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a.blink:link {
	color: #555555;
	font-size: 16px;
	font-family: 굴림;
	text-decoration: none;
} /* 큰 링크 */
a.blink:visited {
	color: #555555;
	font-size: 16px;
	font-family: 굴림;
	text-decoration: none;
}

a.blink:hover {
	color: #4A88D2;
	font-size: 16px;
	font-family: 굴림;
	text-decoration: underline;
}

a.snews:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* 게임뉴스작은링크 ;font-weight: bold*/
a.snews:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.snews:hover {
	color: #337353;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

a.nnews:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* 게임뉴스보통링크 */
a.nnews:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nnews:hover {
	color: #337353;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a.sreview:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* 게임리뷰작은링크 ;font-weight: bold*/
a.sreview:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.sreview:hover {
	color: #2C6AAF;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

a.nreview:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* 게임리뷰보통링크 */
a.nreview:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nreview:hover {
	color: #2C6AAF;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a.sevent:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* event작은링크 ;font-weight: bold*/
a.sevent:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.sevent:hover {
	color: #CF3A99;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

a.nevent:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* event보통링크 */
a.nevent:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nevent:hover {
	color: #CF3A99;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a.stoon:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* cartoon작은링크 ;font-weight: bold*/
a.stoon:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.stoon:hover {
	color: #8C6B1E;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

a.ntoon:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* cartoon보통링크 */
a.ntoon:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.ntoon:hover {
	color: #8C6B1E;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a.slotto:link {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
} /* cartoon작은링크 ;font-weight: bold*/
a.slotto:visited {
	color: #555555;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: none;
}

a.slotto:hover {
	color: #689007;
	font-size: 11px;
	letter-spacing: -1px;
	text-decoration: underline;
}

a.nlotto:link {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
} /* cartoon보통링크 */
a.nlotto:visited {
	color: #555555;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: none;
}

a.nlotto:hover {
	color: #689007;
	font-size: 12px;
	font-family: 굴림;
	text-decoration: underline;
}

a:visited {
	font-family: "굴림";
	font-size: 12px;
	text-decoration: none
}

a:visited {
	color: #666666
}

a:active {
	
}

a:hover {
	color: #996600;
	text-decoration: underline;
}

a:link {
	
}

a:visited {
	
}
</style>



<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"
	bgcolor="#E1EEF5">

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		align="center">
		<tbody>
			<tr>
				<td>

					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						align="center">
						<tbody>
							<tr height="30" bgcolor="#5A5A5A">
								<td width="35%" style="color: #FFFC00; padding-left: 7px;">
									<b>${loginedMember.name}</b>님
								</td>
								<td width="65%" align="right"
									style="color: #ffffff; padding-right: 7px;"><a
									href="./list.asp" style="color: #FF9900;">받은쪽지</a> | <a
									href="./list_sent.asp" style="color: #ffffff;">보낸쪽지</a> | <a
									href="./list_f.asp" style="color: #ffffff;">친구목록</a>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<form name="mul_del" action="" method="post"></form>
			<tr>
				<td valign="top">
					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="stex">
						<tbody>
							<tr height="65">
								<td style="line-height: 18px;">받은날부터 15일, 쪽지수 150개를 초과하면
									삭제처리 되며, 삭제된 쪽지는 복구할 수 없습니다.<br> 타회원으로부터 전달된 CP쪽지를 수령 전에
									삭제하시면 CP도 함께 삭제되오니 유의해주세요.<br> <font color="blue">타회원으로부터
										받은 CP는 사이트에서 즉시사용 가능하나 재전송하려면 만48시간이 지나야합니다</font>
								</td>
							</tr>
						</tbody>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="stex">
						<tbody>
							<tr align="center" height="25">
								<td width="30"><input type="checkbox"
									onclick="this.value=check(this.form.elements,1)"></td>
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
						</tbody>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" class="mtex">

					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center" height="34">
						<tbody>
							<tr valign="bottom" align="center">
								<td><input type="button" value="선택쪽지 삭제"
									onclick="mul_check();"
									style="font-size: 12px; width: 80; height: 20; border: 1px solid #000000;">
									<input type="button" value="새쪽지 작성"
									onclick="location.href='messageWrite';"
									style="font-size: 12px; width: 80; height: 20; border: 1px solid #000000;">

								</td>
							</tr>
						</tbody>
					</table>

					<table width="550" border="0" cellspacing="0" cellpadding="0"
						align="center">
						<tbody>
							<tr height="40">
								<td align="center">
									<table border="0" cellspacing="0" cellpadding="0">
										<tbody>
											<tr>
												<td></td>
											</tr>
										</tbody>
									</table>
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>

			<tr height="10">
				<td></td>
			</tr>
			<tr>
				<td align="center">
					<!--<iframe src="/realclick/newadpage02.htm" width="470" height="70" frameborder="0"></iframe>-->
				</td>
			</tr>
		</tbody>
	</table>

</body>

<script>

if (typeof(SIDEVIEW_JS) == 'undefined') // 한번만 실행
{
    if (typeof g4_is_member == 'undefined')
        alert('member undefined');

    var SIDEVIEW_JS = true;

    // 회원이름 클릭시 회원정보등을 보여주는 레이어
    function insertHead(name, text, evt)
    {
        var idx = this.heads.length;
        var row = new SideViewRow(-idx, name, text, evt);
        this.heads[idx] = row;
        return row;
    }

    function insertTail(name, evt)
    {
        var idx = this.tails.length;
        var row = new SideViewRow(idx, name, evt);
        this.tails[idx] = row;
        return row;
    }

    function SideViewRow(idx, name, onclickEvent)
    {
        this.idx = idx;
        this.name = name;
        this.onclickEvent = onclickEvent;
        this.renderRow = renderRow;

        this.isVisible = true;
        this.isDim = false;
    }

    function renderRow()
    {
        if (!this.isVisible)
            return "";

        var str = "" + this.onclickEvent + "";
        return str;
    }

    function showSideView(curObj, mb_id, name, email, homepage)
    {
        var sideView = new SideView('nameContextMenu', curObj, mb_id, name, email, homepage);
        sideView.showLayer();
    }

    function SideView(targetObj, curObj, mb_id, name, email, homepage)
    {
        this.targetObj = targetObj;
        this.curObj = curObj;
        this.mb_id = mb_id;
        name = name.replace(/…/g,"");
        this.name = name;
        this.email = email;
        this.homepage = homepage;
        this.showLayer = showLayer;
        this.makeNameContextMenus = makeNameContextMenus;
        this.heads = new Array();
        this.insertHead = insertHead;
        this.tails = new Array();
        this.insertTail = insertTail;
        this.getRow = getRow;
        this.hideRow = hideRow;
        this.dimRow = dimRow;


        if (g4_is_member) {
            if (mb_id)
                this.insertTail("msg", "<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' id='sideViewRow_"+this.name+"' onClick=location.href='./write.asp?toid=" + mb_id + "&tonickname=" + name + "'><td style='font-family:굴림;font-size:9pt;' height='20'><font color='#000000'><span id='sideview' style='cursor:pointer'>쪽지보내기</span></font></td></tr>");
            if (mb_id)
                this.insertTail("fadd", "<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' id='sideViewRow_"+this.name+"' onClick=location.href='./write_f.asp?fid=" + mb_id + "&fnic=" + name + "'><td style='font-family:굴림;font-size:9pt;' height='20'><font color='#000000'><span id='sideview' style='cursor:pointer'>친구추가</span></font></td></tr>");
			if (mb_id)
                this.insertTail("info", "<tr onMouseOver=this.style.backgroundColor='#bbbbbb' onMouseOut=this.style.backgroundColor='' id='sideViewRow_"+this.name+"' onClick=location.href='./info.asp?id=" + mb_id + "';><td style='font-family:굴림;font-size:9pt;' height='20'><font color='#000000'><span id='sideview' style='cursor:pointer'>회원정보</span></font></td></tr>");
		}
    }

    function showLayer()
    {
        clickAreaCheck = true;
        var oSideViewLayer = document.getElementById(this.targetObj);
        var oBody = document.body;

        if (oSideViewLayer == null) {
            oSideViewLayer = document.createElement("DIV");
            oSideViewLayer.id = this.targetObj;
            oSideViewLayer.style.position = 'absolute';
            oBody.appendChild(oSideViewLayer);
        }
        oSideViewLayer.innerHTML = this.makeNameContextMenus();

        if (getAbsoluteTop(this.curObj) + this.curObj.offsetHeight + oSideViewLayer.scrollHeight + 5 > oBody.scrollHeight)
            oSideViewLayer.style.top = getAbsoluteTop(this.curObj) - oSideViewLayer.scrollHeight;
        else
            oSideViewLayer.style.top = getAbsoluteTop(this.curObj) + this.curObj.offsetHeight;

        oSideViewLayer.style.left = getAbsoluteLeft(this.curObj) - this.curObj.offsetWidth + 14;

        divDisplay(this.targetObj, 'block');

        selectBoxHidden(this.targetObj);
    }

    function getAbsoluteTop(oNode)
    {
        var oCurrentNode=oNode;
        var iTop=0;
        while(oCurrentNode.tagName!="BODY") {
            iTop+=oCurrentNode.offsetTop - oCurrentNode.scrollTop;
            oCurrentNode=oCurrentNode.offsetParent;
        }
        return iTop;
    }

    function getAbsoluteLeft(oNode)
    {
        var oCurrentNode=oNode;
        var iLeft=0;
        iLeft+=oCurrentNode.offsetWidth;
        while(oCurrentNode.tagName!="BODY") {
            iLeft+=oCurrentNode.offsetLeft;
            oCurrentNode=oCurrentNode.offsetParent;
        }
        return iLeft;
    }


    function makeNameContextMenus()
    {
        var str = "<table border='0' cellpadding='3' cellspacing='0' width='90' style='border:1px solid #222222;' bgcolor='#FFFFFF'>";

        var i=0;
        for (i=this.heads.length - 1; i >= 0; i--)
            str += this.heads[i].renderRow();

        var j=0;
        for (j=0; j < this.tails.length; j++)
            str += this.tails[j].renderRow();

        str += "</table>";
        return str;
    }

    function getRow(name)
    {
        var i = 0;
        var row = null;
        for (i=0; i<this.heads.length; ++i)
        {
            row = this.heads[i];
            if (row.name == name) return row;
        }

        for (i=0; i<this.tails.length; ++i)
        {
            row = this.tails[i];
            if (row.name == name) return row;
        }
        return row;
    }

    function hideRow(name)
    {
        var row = this.getRow(name);
        if (row != null)
            row.isVisible = false;
    }

    function dimRow(name)
    {
        var row = this.getRow(name);
        if (row != null)
            row.isDim = true;
    }
    // Internet Explorer에서 셀렉트박스와 레이어가 겹칠시 레이어가 셀렉트 박스 뒤로 숨는 현상을 해결하는 함수
    // 레이어가 셀렉트 박스를 침범하면 셀렉트 박스를 hidden 시킴
    // <div id=LayerID style="display:none; position:absolute;" onpropertychange="selectBoxHidden('LayerID')">
    function selectBoxHidden(layer_id)
    {
        //var ly = eval(layer_id);
        var ly = document.getElementById(layer_id);

        // 레이어 좌표
        var ly_left   = ly.offsetLeft;
        var ly_top    = ly.offsetTop;
        var ly_right  = ly.offsetLeft + ly.offsetWidth;
        var ly_bottom = ly.offsetTop + ly.offsetHeight;

        // 셀렉트박스의 좌표
        var el;

        for (i=0; i<document.forms.length; i++) {
            for (k=0; k<document.forms[i].length; k++) {
                el = document.forms[i].elements[k];
                if (el.type == "select-one") {
                    var el_left = el_top = 0;
                    var obj = el;
                    if (obj.offsetParent) {
                        while (obj.offsetParent) {
                            el_left += obj.offsetLeft;
                            el_top  += obj.offsetTop;
                            obj = obj.offsetParent;
                        }
                    }
                    el_left   += el.clientLeft;
                    el_top    += el.clientTop;
                    el_right  = el_left + el.clientWidth;
                    el_bottom = el_top + el.clientHeight;

                    // 좌표를 따져 레이어가 셀렉트 박스를 침범했으면 셀렉트 박스를 hidden 시킴
                    if ( (el_left >= ly_left && el_top >= ly_top && el_left <= ly_right && el_top <= ly_bottom) ||
                         (el_right >= ly_left && el_right <= ly_right && el_top >= ly_top && el_top <= ly_bottom) ||
                         (el_left >= ly_left && el_bottom >= ly_top && el_right <= ly_right && el_bottom <= ly_bottom) ||
                         (el_left >= ly_left && el_left <= ly_right && el_bottom >= ly_top && el_bottom <= ly_bottom) )
                        el.style.visibility = 'hidden';
                }
            }
        }
    }

    // 감추어진 셀렉트 박스를 모두 보이게 함
    function selectBoxVisible()
    {
        for (i=0; i<document.forms.length; i++)
        {
            for (k=0; k<document.forms[i].length; k++)
            {
                el = document.forms[i].elements[k];
                if (el.type == "select-one" && el.style.visibility == 'hidden')
                    el.style.visibility = 'visible';
            }
        }
    }


    function getAbsoluteTop(oNode)
    {
        var oCurrentNode=oNode;
        var iTop=0;
        while(oCurrentNode.tagName!="BODY") {
            iTop+=oCurrentNode.offsetTop - oCurrentNode.scrollTop;
            oCurrentNode=oCurrentNode.offsetParent;
        }
        return iTop;
    }


    function getAbsoluteLeft(oNode)
    {
        var oCurrentNode=oNode;
        var iLeft=0;
        iLeft+=oCurrentNode.offsetWidth;
        while(oCurrentNode.tagName!="BODY") {
            iLeft+=oCurrentNode.offsetLeft;
            oCurrentNode=oCurrentNode.offsetParent;
        }
        return iLeft;
    }

    function divDisplay(id, act)
    {
        selectBoxVisible();

        document.getElementById(id).style.display = act;
    }

    function hideSideView()
    {
        if (document.getElementById("nameContextMenu"))
            divDisplay ("nameContextMenu", 'none');
    }

    var clickAreaCheck = false;
    document.onclick = function()
    {
        if (!clickAreaCheck)
            hideSideView();
        else
            clickAreaCheck = false;
    }
}
	
</script>

<%@ include file="/jsp/part/foot.jspf"%>