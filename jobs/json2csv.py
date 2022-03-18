import argparse
import csv
import json
import sys

def get_parser():
    parser = argparse.ArgumentParser(
        '''
        Takes variant response from OSMP and convert it to CSV
        Returns CSV text equivalent 
        '''
    )
    parser.add_argument(
        "--json",
        type=str,
        required=True,
        help="path to participant-wise report csv",
    )
    return parser


def json2csv(json_string):
    data = json.loads(json_string)

    output = csv.writer(sys.stdout)

    output.writerow(data[0].keys())  # header row

    for row in data:
        output.writerow(row.values())

if __name__ == "__main__":
    args = get_parser().parse_args()

    json2csv(args.json)
