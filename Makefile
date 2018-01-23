default: test

test: unit
fulltest: unit e2e

unit:
				python tests/test_fields.py

e2e: python2 python3

python2:
				PYTHON_BIN="python2" bash scripts/run_tests.sh

python3:
				PYTHON_BIN="python3" bash scripts/run_tests.sh

package:
				python setup.py sdist

install: package
				bash scripts/install_package.sh

upload:
				bash scripts/publish_package.sh

bank:
				python main.py --num 1000 templates/bank/entrance.yaml | python scripts/lines_to_list.py > viz/output.js

house:
				python main.py --num 1000 templates/house/house.yaml | python scripts/lines_to_list.py > viz/output.js

