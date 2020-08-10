# DB 세팅
DROP DATABASE IF EXISTS `at`;
CREATE DATABASE `at`;
USE `at`;

# article 테이블 세팅
CREATE TABLE article (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	displayStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
    title CHAR(200) NOT NULL,
    `body` LONGTEXT NOT NULL
);

# article 테이블에 테스트 데이터 삽입
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
delDate = NOW(),
title = 'hsb제목7',
`body` = 'hsb내용7',
delStatus = 0,
displayStatus = 1;

# article 테이블 비우기
TRUNCATE TABLE article

# article 게시물 전체 검색
SELECT *
FROM article;

# article 게시물 삭제
UPDATE article
SET delStatus = 1,
delDate = NOW(),
displayStatus = 1
WHERE id = 13

# article테이블에 delStatus추가
ALTER TABLE article ADD COLUMN delDate DATETIME NOT NULL AFTER delStatus

# article 게시물 추가
INSERT INTO article
SET regDate = NOW(),
updateDate = NOW(),
delDate = NOW(),
title = 'ㅋㅋㅋ',  
`body` = 'ㅋㅋㅋ',
displayStatus = 1

# article 게시물 카운트
SELECT COUNT(*) AS cnt 
FROM article 
WHERE displayStatus = 1
AND delStatus = 0
AND title LIKE CONCAT('%', '', '%')

		
# article 게시물 검색
SELECT *
FROM article
WHERE displayStatus = 1
AND delStatus = 0
AND title LIKE CONCAT('%', 'hs', '%')
ORDER BY id DESC
LIMIT 1, 5
		
# article 게시물 수정
UPDATE article
SET updateDate = NOW(),
title = 'ㄴ',
BODY = 'ㄴ'
WHERE id = 1

# 댓글 테이블 추가

CREATE TABLE articleReply (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(id),
    regDate DATETIME NOT NULL,
    articleId INT(10) UNSIGNED NOT NULL,
    memberId INT(10) UNSIGNED NOT NULL,
    `body` CHAR(100) NOT NULL
);

# articleReply에  칼럼 추가
ALTER TABLE articleReply
ADD COLUMN `delDate` DATETIME NOT NULL AFTER `delStatus`;


ALTER TABLE articleReply
ADD COLUMN `delStatus` INT(1) NOT NULL AFTER `updateDate`;

ALTER TABLE articleReply
ADD COLUMN `updateDate` DATETIME NOT NULL AFTER `regDate`; 

ALTER TABLE articleReply
ADD COLUMN `displayStatus` INT(1) NOT NULL AFTER `delDate`;

# 댓글 작성
INSERT INTO articleReply
SET regDate = NOW(),
memberId = 1,
articleId = 1,
`body` = '좋은 글 감사합니다.';

INSERT INTO articleReply
SET regDate = NOW(),
memberId = 1,
articleId = 1,
`body` = '더욱 좋은 글 부탁드립니다.';

INSERT INTO articleReply
SET regDate = NOW(),
memberId = 2,
articleId = 1,
`body` = '감사합니다.';

INSERT INTO articleReply
SET regDate = NOW(),
updateDate = NOW(),
delDate = NOW(),
displayStatus = 1,
memberId = 1,
articleId = 65,
`body` = '감사합니다. ^ ^'; 

#댓글 작성
INSERT INTO articleReply
SET regDate = NOW(),
updateDate = NOW(),
delDate = NOW(),
displayStatus = 1,
body = #{body},
articleId = #{articleId},
memberId = 1

#댓글 삭제
UPDATE articleReply
SET delStatus = 1,
delDate = NOW(),
displayStatus = 1
WHERE id = #{id}

#댓글 리스팅
SELECT *
FROM articleReply
WHERE memberId = 1
AND delStatus = 0
AND displayStatus = 1
AND articleId = #{articleId}
ORDER BY id DESC

#댓글 수정을위한 댓글정보 검색
SELECT *
FROM articleReply
WHERE id = #{id}

#댓글수정
UPDATE articleReply
<set>
    <if test="body != null">body = #{body},</if>
</set>
WHERE id = #{id}

# originFileName, ext, relTypeCode, relId, extTypeCode, extType2Code, fileSize, body
#파일 테이블 생성
CREATE TABLE `file`(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    updateDate DATETIME NOT NULL,
    delDate DATETIME NOT NULL,
	delStatus TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
	originFileName CHAR(100) NOT NULL,
	ext CHAR(20) NOT NULL,
	relTypeCode char(50) UNSIGNED NOT NULL, 
	relId INT(10) UNSIGNED NOT NULL, 
	typeCode CHAR(50) NOT NULL DEFAULT 'common', 
	type2Code CHAR(50) NOT NULL DEFAULT 'attachment',
	extTypeCode CHAR(20) NOT NULL, # img or video
	extType2Code CHAR(20) NOT NULL, # git, png, mp4, avi
	fileSize INT(10) UNSIGNED NOT NULL, # 파일용량, 바이트단위
	`body` LONGBLOB NOT NULL #4기가 까지 저장 가능
);