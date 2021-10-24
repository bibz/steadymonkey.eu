.venv:
	python3 -m venv .venv
	mkdir .venv/opt
	curl -L -o ecto1.zip https://github.com/arktronic/ecto1/archive/5169cd5e21dba03452a20a6b88baefa803d7eb3f.zip \
		&& unzip -j -d .venv/opt/ecto1 ecto1.zip \
		&& rm ecto1.zip
	./.venv/bin/python -m pip install -r .venv/opt/ecto1/requirements.txt

.PHONY:
blog: .venv
	ECTO1_SOURCE=http://localhost:3050 ECTO1_TARGET=https://steadymonkey.eu ./.venv/bin/python .venv/opt/ecto1/ecto1.py

.PHONY:
preview: .venv
	./.venv/bin/python .venv/opt/ecto1/serve.py
