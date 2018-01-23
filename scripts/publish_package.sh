VERSION=`python src/version.py`
NAME=`python src/name.py`
twine upload dist/${NAME}-${VERSION}.tar.gz
