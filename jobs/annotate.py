import os
import pandas as pd 
from functools import reduce
import argparse

def get_parser():
    parser = argparse.ArgumentParser(
        '''
        Takes 3 CSVs or TSVs and merge them based on common genome coordinates
        '''
    )
    parser.add_argument(
        "--variants",
        type=str,
        required=True,
        help="path to variants CSV",
    )

    parser.add_argument(
        "--cadd",
        type=str,
        required=True,
        help="path to CADD CSV",
    )

    parser.add_argument(
        "--gnomad",
        type=str,
        required=True,
        help="path to gnomAD",
    )
    return parser

def format_df(filepath, columns={}):
    if os.stat(filepath).st_size == 0:
        return pd.DataFrame(columns=["referenceName", "ref", "alt", "start"])
    else:
        if filepath.endswith("csv"):
            df = pd.read_csv(filepath, sep=',')
        elif filepath.endswith("tsv"):
            df = pd.read_csv(filepath, sep='\s+')
        else:
            raise Exception("Invalid file format. Please make sure the input files are TSV or CSV.")
    
        return df.rename(columns=columns)

# Schema for variants:referenceName, start, end, ref, alt df.rename(columns={"A": "a", "B": "c"})

#Todo: Add error checking
#Todo: write unit tests

def annotate_and_merge(variants_csv, cadd_csv, gnomad_csv):
    variants = format_df(variants_csv)
    cadd = format_df(cadd_csv, {
        "#Chrom": "referenceName",
        "Ref": "ref",
        "Alt": "alt",
        "Pos": "start"
    })
    gnomad = format_df(gnomad_csv, {
        "#chrom": "referenceName",
        "pos": "start"
    })

    data_frames = [variants, cadd, gnomad]

    df_merged = reduce(lambda  left,right: pd.merge(left,right,on=["referenceName", "ref", "alt", "start"], # Only start because of SNVs
                                            how='outer'), data_frames).fillna('')

    print(df_merged.to_json(orient='records'), end='')

if __name__ == "__main__":
    args = get_parser().parse_args()

    annotate_and_merge(args.variants, args.cadd, args.gnomad)
