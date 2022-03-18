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


# Schema for variants:referenceName, start, end, ref, alt df.rename(columns={"A": "a", "B": "c"})

def annotate_and_merge(variants_csv, cadd_csv, gnomad_csv):
    variants = pd.read_csv(variants_csv, sep=',')
    cadd = pd.read_csv(cadd_csv, sep='\s+')
    cadd = cadd.rename(columns={
        "#Chrom": "referenceName",
        "Ref": "ref",
        "Alt": "alt",
        "Pos": "start"
    })
    gnomad = pd.read_csv(gnomad_csv, sep='\s+')
    gnomad = gnomad.rename(columns={
        "#chrom": "referenceName",
        "pos": "start"
    })

    # join
    # certain values from one file replaces values in other

    data_frames = [variants, cadd, gnomad]

    print(cadd, gnomad)

    df_merged = reduce(lambda  left,right: pd.merge(left,right,on=["referenceName", "ref", "alt", "start"], # Only start because of SNVs
                                            how='outer'), data_frames).fillna('')

    print(df_merged.to_json(orient='records'), end='')

if __name__ == "__main__":
    args = get_parser().parse_args()

    annotate_and_merge(args.variants, args.cadd, args.gnomad)
