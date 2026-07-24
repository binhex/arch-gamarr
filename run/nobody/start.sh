#!/usr/bin/dumb-init /bin/bash

# set install location for gamarr
install_path="/opt/gamarr"

# ensure we are in the install location
cd "${install_path}" || echo "Path does not exist '${install_path}'"

if [[ ! -d ./.venv ]]; then
  echo "[INFO] No virtualenv found, creating via uv..."
  uv venv --quiet
else
  echo "[INFO] Virtualenv already exists, skipping creation..."
fi

# install dependencies from pyproject.toml into virtualenv and create uv.lock
uv sync --no-dev

# activate vrtualenv
source './.venv/bin/activate'

# run gamarr
gamarr \
  --config-path "${GAMARR_CONFIG_PATH}" \
  --log-path "${GAMARR_LOG_PATH}" \
  --db-path "${GAMARR_DB_PATH}" \
  --pid-path "${GAMARR_PID_PATH}" \
  --log-level "${GAMARR_LOG_LEVEL}" \
  --library-path "${GAMARR_LIBRARY_PATH}" \
  --qbt-host "${GAMARR_QBT_HOST}" \
  --qbt-port "${GAMARR_QBT_PORT}" \
  --qbt-username "${GAMARR_QBT_USERNAME:-admin}" \
  --qbt-password "${GAMARR_QBT_PASSWORD:-adminadmin}"
