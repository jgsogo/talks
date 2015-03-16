:: Copy images to this directory
pushd ..
pushd common
copy github.png "../clustering/github.png"
copy twitter.png "../clustering/twitter.png"
copy me_round.png "../clustering/me_round.png"
popd
popd

:: Run pandoc
pandoc -t beamer -V theme:Darmstadt --slide-level=2 --variable fontsize=9pt --toc -o slides.pdf ^
introduccion.md ^
cl_jerarquico.md ^
cl_particional.md ^
cl_probabilista.md ^
conclusiones.md ^
../common/me.md


:: themes:  Antibes Bergen Berkeley Berlin
::          Boadilla Copenhagen Darmstadt Dresden
::          Frankfurt Goettingen Hannover Ilmenau
::          Juanlespins Madrid Malmoe Marburg
::          Montpellier Paloalto Pittsburgh Rochester
::          Singapore Warsaw

:: How-to beamer: https://www.uncg.edu/cmp/reu/presentations/Charles%20Batts%20-%20Beamer%20Tutorial.pdf