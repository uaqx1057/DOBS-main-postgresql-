import sys
import os
import logging

# --------------------------
# Logging setup for debugging
# --------------------------
log_file = os.path.join(os.path.dirname(__file__), "app.log")
logging.basicConfig(
    filename=log_file,
    level=logging.DEBUG,
    format="%(asctime)s [%(levelname)s] %(message)s",
)

# Optional: redirect stdout/stderr to log
sys.stdout = open(log_file, "a")
sys.stderr = open(log_file, "a")

logging.info("Starting WSGI application...")

# --------------------------
# Add project path
# --------------------------
project_dir = os.path.dirname(__file__)
sys.path.insert(0, project_dir)

# --------------------------
# Activate virtualenv
# --------------------------
venv_path = os.path.join(project_dir, "venv")
activate_this = os.path.join(venv_path, "bin", "activate_this.py")

if os.path.exists(activate_this):
    with open(activate_this) as f:
        exec(f.read(), dict(__file__=activate_this))
    logging.info(f"Activated virtualenv: {venv_path}")
else:
    logging.warning(f"Virtualenv not found at {venv_path}")

# --------------------------
# Import Flask app
# --------------------------
try:
    from app import create_app  # or from app import app
    application = create_app()   # if using factory pattern
    logging.info("WSGI application loaded successfully.")
except Exception as e:
    logging.exception("Failed to load WSGI application")
    raise
