import argparse
import csv
import json
import sys


def get_parser():
    parser = argparse.ArgumentParser(
        """
        Takes variant response from OSMP and convert it to CSV
        Returns CSV text equivalent 
        """
    )
    parser.add_argument(
        "--json",
        type=str,
        required=True,
        help="path to participant-wise report csv",
    )
    return parser


def is_json(myjson: str) -> bool:
    try:
        json.loads(myjson)
    except ValueError as e:
        return False
    return True


def json2csv(json_string):
    if is_json(json_string):
        data = json.loads(json_string)

        output = csv.writer(sys.stdout)

        if len(data) > 0:
            output.writerow(data[0].keys())  # header row
            for row in data:
                output.writerow(row.values())
        else:
            output.writerow(["start", "end", "referenceName", "ref", "alt"])
    else:
        raise Exception(
            "Invalid input argument. Please make sure the input is a JSON string."
        )


if __name__ == "__main__":
    args = get_parser().parse_args()

    json2csv(args.json)
