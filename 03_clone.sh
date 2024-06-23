cd /opt/authentik
rm -rf ./src
git clone https://github.com/goauthentik/authentik.git src

cd /opt/authentik/src/

python3.12 -m virtualenv ./.venv
source .venv/bin/activate

# Install dependencies
pip install --no-cache-dir poetry
poetry export -f requirements.txt --without-hashes --output requirements.txt
poetry export -f requirements.txt --without-hashes --dev --output requirements-dev.txt

pip install --no-cache-dir -r requirements.txt -r requirements-dev.txt
