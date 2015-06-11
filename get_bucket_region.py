import json
import os
import subprocess
import sys

region_json = subprocess.check_output([
    "aws",
    "s3api",
    "get-bucket-location",
    "--bucket",
    sys.argv[1]
])

region = json.loads(region_json)["LocationConstraint"]
sys.stdout.write(region)
sys.stdout.flush()
