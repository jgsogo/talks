:: Copy images to this directory
pushd ..
pushd ..
pushd common
copy github.png "../clustering/algoritmo/github.png"
copy twitter.png "../clustering/algoritmo/twitter.png"
copy me_round.png "../clustering/algoritmo/me_round.png"
popd
popd
popd

:: Run pandoc
pandoc -t beamer -V theme:Darmstadt --slide-level=2 --variable fontsize=9pt --toc -o slides.pdf ^
introduccion.md ^
k-means.md ^
bfr.md ^
cure.md ^
../../common/me.md


:: themes:  Antibes Bergen Berkeley Berlin
::          Boadilla Copenhagen Darmstadt Dresden
::          Frankfurt Goettingen Hannover Ilmenau
::          Juanlespins Madrid Malmoe Marburg
::          Montpellier Paloalto Pittsburgh Rochester
::          Singapore Warsaw

:: How-to beamer: https://www.uncg.edu/cmp/reu/presentations/Charles%20Batts%20-%20Beamer%20Tutorial.pdf