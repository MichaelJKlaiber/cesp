import os
import json
import difflib as dl
import subprocess


def remove_rars_header(s: str) -> str:
    """
    Remve the RARS header from string s
    """
    rars_output_header = "RARS 1.5  Copyright 2003-2019 Pete Sanderson and Kenneth Vollmar\n\n\n"
    s = s.replace(rars_output_header, "")
    return s


def main():
    cwd = os.getcwd()
    test_number = 0
    for root, dirs, files in os.walk(cwd):
        for file in files:
            if file.endswith(".json"):
                with open(file, "r") as fh:
                    json_file = fh.read()
                # Get Parameters
                jd = json.loads(json_file)
                if "cesp_version" in jd.keys():
                    run = jd["executable"] + jd["arguments"]
                    expected_result = jd["expected_result"]
                    description = jd["description"]

                    # Run Simulation
                    sp = subprocess.run(run, stdout=subprocess.PIPE)
                    result = sp.stdout.decode("utf-8")

                    print(("#"*104) + "\n")
                    print(f"Unit Test {test_number}: Starting {description}\n")
                    print(os.path.join(root, file))
                    print(("#"*104) + "\n")

                    if result == expected_result:
                        print("Success!")
                    else:
                        expected_result = remove_rars_header(expected_result)
                        result = remove_rars_header(result)
                        expected_result = expected_result.splitlines()
                        result = result.splitlines()
                        d = dl.context_diff(expected_result, result, fromfile='EXPECTED RESULT', tofile='ACTUAL RESULT')
                        for diff in d:
                            print(f"    {diff}")
                    test_number += 1
    if test_number == 0:
        print("Error: no unit test found")


if __name__ == "__main__":
    main()
