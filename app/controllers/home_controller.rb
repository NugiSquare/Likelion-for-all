class HomeController < ApplicationController
  #before_action :authenticate_user!, only: [:question, :suggest, :univ, :univ_db]
  
  ##메인 페이지
  def index
    ## 각 학교 소개 페이지로 넘어갈 버튼 만들기 ##
    @univ_detail = Univ.all
    ## 혹시 학교 소개 랜덤으로 뿌릴거면 이걸로 뿌리면 됨 ##
    @banner = @univ_detail.sample
  end
  
  
  ####네비바 => 알림 드롭다운
  ###알림 드롭다운 => 사이트 공지사항
  ##사이트 공지사항 메인 프론트앤드
  def official_noti
  end
  
  ###알림 드롭다운 => 3기 주요 일정공지
  ##3기 주요 일정공지 메인 프론트앤드
  def lion3_schedule_noti
  end
  
  ###알림 드롭다운 => EVENT/행사 소식
  ##EVENT/행사 소식 메인 프론트앤드
  def event_noti
  end

  ###알림 드롭다운 => 사이트 질문하기
  ##사이트 질문하기 메인 프론트앤드
  def question
    @question_post = QuestionPost.all
    @user_info = User.all
  end
  
  ##사이트 질문하기 목록에 보여줄 것들
  def question_contents
      @boardList = MyRailsBoardRow.find(:all, :limit =>rowsPerPage, :order=>'created_at desc')  #(1)  모델(MyRailsBoardRow)을 사용해서 rowsPerPage 개만 조회해서 리스트를 돌려준다.
      @totalCnt = MyRailsBoardRow.all.count   #(2) 전체 게시물 갯수를 구하고
      @current_page = 1        #(3) 최초 화면이므로 1 현재 페이지 변수를 설정하고 (루트 페이지이므로 1을 설정)
      @totalPageList = getTotalPageList(@totalCnt, rowsPerPage) #(4) ApplicationHelper mixin 의 getTotalPageList를 호출해서 전체 페이지 목록을 구한다.
  end
  
  #글쓰기 버튼을 누르면 나오는 화면
  def show_write_form
  end
  
  #글쓰기 화면의 등록을 누른 후 저장
  def do_write_board
        @rowData = MyRailsBoardRow.new( name: params[:name], univ: params[:univ_name],
            subject: params[:subject], memo: params[:memo], hits:0)

        @rowData.save

        redirect_to '/'
  end
  
  ###알림 드롭다운 => 건의 및 오류제보(이건 메일러를 활용해볼 생각입니다!)
  def suggest
  end
  
  
  ####네비바 => 메뉴 드롭다운
  ###메뉴 드롭다운 => [8월 2일]방송평가서비스(종)
  ##[8월 2일]방송평가서비스(종) 메인 프론트앤드
  def bangsongpyungga
  end
  
  ###메뉴 드롭다운 => [8월 1일]메르스맵 만들기(종)
  ##[8월 1일]메르스맵 만들기(종) 메인 프론트앤드
  def mersmap
  end
  
  ###메뉴 드롭다운 => [매주 토]아기사자(현)(진행 2/4)
  ##[매주 토]아기사자(현)(진행 2/4) 메인 프론트앤드
  def babylion
  end
  
  ###메뉴 드롭다운 => 본 강의 나눔터
  ##본 강의 나눔터 메인 프론트앤드
  def mainlecture
  end
  
  ###메뉴 드롭다운 => 보조강의 나눔터
  ##보조강의 나눔터 메인 프론트앤드
  def sublecture
  end
  
  ###메뉴 드롭다운 => 자유게시판
  ##자유게시판 메인 프론트앤드
  def freeboard
  end
  
  ###메뉴 드롭다운 => 대나무숲(익명게시판)
  ##대나무숲 메인 프론트앤드
  def bambooforest
  end
  
  ###메뉴 드롭다운 => 유머게시판
  ##유머게시판 메인 프론트앤드
  def joyboard
  end
  
  ###메뉴 드롭다운 => 사진겔러리
  ##사진겔러리 메인 프론트앤드
  def pictureboard
  end
  
  ###메뉴 드롭다운 => 오늘뭐먹지
  ##오늘뭐먹지 메인 프론트앤드
  def foodboard
  end
  
  ###메뉴 드롭다운 => 다녀왔어요!(후기)
  ##다녀왔어요! 메인 프론트앤드
  def postscript
  end
  
  ###메뉴 드롭다운 => 만나보아요!
  ##만나보아요! 메인 프론트앤드
  def meetboard
  end
  
  ###메뉴 드롭다운 => 멤버를찾아요!
  ##멤버를찾아요! 메인 프론트앤드
  def memberingboard
  end
  
  ###메뉴 드롭다운 => 아나바다 장터
  ##아나바다 장터 메인 프론트앤드
  def marketboard
  end
  ###//메뉴 드롭다운 끝.
  
  ####네비바 => 학교찾기 드롭다운
  ###학교찾기 드롭다운 => 학교 등록하기 메인 페이지
  ##학교 등록하기 메인페이지 프론트앤드.
  def univ
    
  end
  
  ##학교 등록하기를 통해 입력한 값을 저장하는 액션.
  def univ_db
      data = Univ.new
      data.univ_name =            params[:univ_name]                     #학교이름
      data.univ_code =            params[:univ_code]                     #학교 코드 => 코드표 띄워둘것
      data.univ_logo =            params[:univ_logo]                     #학교로고
      data.univ_leader_name =     params[:univ_leader_name]       #1.학교대표이름
      data.univ_leader_picture =  params[:univ_leader_picture] #.학교대표사진
      data.univ_howmany_team =    params[:univ_howmany_team]     #2.팀 갯수
      data.univ_howmany_people =  params[:univ_howmany_people] #3.전체 정원
      data.univ_where =           params[:univ_where]                   #4.소재지역 도 / 시(구, 군) / 동(면)
      data.univ_introduce =       params[:univ_introduce]           #5.학교3기 소개
      data.univ_our_picture1 =    params[:univ_our_picture1]     #6.학교3기 활동사진1
      data.univ_our_picture2 =    params[:univ_our_picture2]     #7.학교3기 활동사진2
      data.univ_our_picture3 =    params[:univ_our_picture3]     #8.학교3기 활동사진3
      data.save
      
      redirect_to :back
      
  end
  ## 1대학 1액션 -이렇게 하는게 뭔가 아니어도 심하게 아닌거 같다고 거의 다 하고 생각하게됨
  ## 고로 깊게 생각해본 결과, 전체대학을 하나의 univ 액션으로 묶고, 데이터베이스를만들어 심플트위터의 각 포스트 개념으로 박아놓고 뿌려야함.
  ## 그리고 가장 큰 이슈였던, 가나다순 정렬은 1~36까지 코드를 데이터마다 따로 input 입력 받고 그 순서대로 정렬시킴.
  ## 그러면 id값이 1~36까지 가나다순에 맞게 정렬될 필요는 없어짐.
  ## 그래도 혹시 모르니 냅두고 동국대 부분만 작업하고 시도/수정하자.  <== 이거 작업하고 디비에 올렸던거 아까 낮에 디비드랍시킴
  
  ## 위의 고민에 힘입어 방송 평가 사이트 만들때 썼던 방법 한번 사용해보겠습니다.
  def univ_detail
    @detail = Univ.find(params[:id])
  end
  
  def univ1 # KAIST
  end
  
  def univ2 # UNIST
  end
  
  def univ3 # 강원대
  end
  
  def univ4 # 건국대
  end
  
  def univ5 # 경북대
  end
  
  def univ6 # 경희대
  end
  
  def univ7 # 고려대
  end
  
  def univ8 # 국민대
  end
  
  def univ9 # 단국대
  end
  
  def univ10 # 덕성여대
  end
  
  def univ11 # 동국대
    
  end
  
  def univ12 # 동덕여대
  end
  
  def univ13 # 부산대
  end
  
  def univ14 # 서강대
  end
  
  def univ15 # 서울과기대
  end
  
  def univ16 # 서울대
  end
  
  def univ17 # 서울시립대
  end
  
  def univ18 # 서울여대
  end
  
  def univ19 # 성균관대
  end
  
  def univ20 # 성신여대
  end
  
  def univ21 # 숙명여대
  end
  
  def univ22 # 아주대
  end
  
  def univ23 # 연세대
  end
  
  def univ24 # 영남대
  end
  
  def univ25 # 원광대
  end
  
  def univ26 # 유학생
  end
  
  def univ27 # 이화여대
  end
  
  def univ28 # 인하대
  end
  
  def univ29 # 전남대
  end
  
  def univ30 # 중앙대
  end
  
  def univ31 # 충남대
  end
  
  def univ32 # 평택대
  end
  
  def univ33 # 한예종
  end
  
  def univ34 # 한국외대
  end
  
  def univ35 # 한동대
  end
  
  def univ36 # 한양대
  end
  
end
