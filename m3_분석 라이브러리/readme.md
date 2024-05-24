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
파이썬 버전 확인 명령어
!python --version
