import os
import json
import subprocess
import sys


def main(file: str):
    if file.endswith(".json"):
        with open(file, "r") as fh:
            json_file = fh.read()
            # Get Parameters
            jd = json.loads(json_file)

        if "cesp_version" in jd.keys():
            run = jd["executable"] + jd["arguments"]
            # Run Simulation
            sp = subprocess.run(run, stdout=subprocess.PIPE)
            result = sp.stdout.decode("utf-8")

            jd["expected_result"] = result

            with open(file, "w", encoding="utf8") as json_file:
                json.dump(jd, json_file, ensure_ascii=True)


if __name__ == "__main__":
    if len(sys.argv) == 2:
        main(sys.argv[1])
    else:
        print("Usage: write_utest.py utest.json")
