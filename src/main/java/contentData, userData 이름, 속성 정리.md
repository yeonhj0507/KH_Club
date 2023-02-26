# 글

## DB

TABLE: content

속성
- int postID
- String title
- String content

## DO

package/Class: contentData/ContentsDO

속성
- int postID
- String title
- String content

## DAO

package/Class: contentData/ContentsDAO

메소드
- 글 삽입: void insert(ContentsDO)
- 모든 제목 불러오기: List<ContentsDO> findTitle()
- id로 글 불러오기: ContentsDO findByID(int)
- id로 글 삭제하기: void delete(int)
- db와 연결 종료: void kill()

# 유저

## DB

TABLE: user

속성
- String userID
- String name
- String pw
- int grade
- int permission

## DO

package/Class: userData/UserDO

속성
- String userID
- String name
- int grade
- String pw
- int permission

## DAO

package/Class: userData/UserDAO

메소드
- 사용자 정보 삽입: void insert(UserDO)
- 모든사용자 불러오기: List<UserDO> findAll()
- id로 사용자 찾기: UserDO findByID(String)
- id로 사용자 제거하기: void delete(String)
- db와 연결 종료: void kill()