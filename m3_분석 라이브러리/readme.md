아나콘다 설치

Anaconda Prompt -> 관리자 권한으로 실행

명령어
conda env list 가상환경 목록
conda create -n kita python=3.10 가상환경 설치

1.처음에 conda env list  실행하면 base 만 나옴
# conda environments:
#
base                  *  C:\Users\Administrator\anaconda3

2. kita 라는 가상환경 설치
conda create -n kita python=3.10

3. (kita) 라는 주피터 생성
conda install jupyter notebook

4. 패키지 설치
conda install numpypandas matplotlib seaborn scipyscikit-learn

5. 가상환경 종료
conda deactivate

6. 나가기
exit

시작 메뉴에 생성되어있는 jupyter notebook(kita)로 실행

환경변수 설정
Path
C:\Users\Administrator\anaconda3
C:\Users\Administrator\anaconda3\Library\bin
C:\Users\Administrator\anaconda3\Library\mingw-w64\bin
C:\Users\Administrator\anaconda3\Scripts

--- 주피터 노트북 ---
주피터 노트북에서는 기본명령어를 사용할때 앞에 !를 붙여서 사용한다
파이썬 버전 확인 명령어
!python --version

ctrl + enter는 실행
shift + enter는 실행 후 밑에 셀 생성

!dir C:\Users\Administrator\kita 절대경로로 할때는 \\를 두개가 아니라 \ 하나만 넣는다

# 디렉토리와 그 안의 모든 파일 삭제
# /S 옵션 : test_dir 안에 있는 모든 파일과 서브디렉토리를 삭제
# /Q 옵션 : 디렉토리 삭제하기 전에 사용자에게 확인 메시지를 묻지 않고 바로 삭제
!rmdir /S /Q test_dir
