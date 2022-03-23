import pandas as pd
import argparse


def get_parser():
    parser = argparse.ArgumentParser(
        """
        Takes variant report and return a string of unique coordinates
        """
    )
    parser.add_argument(
        "--variants",
        type=str,
        required=True,
        help="path to variant report csv",
    )
    return parser


def get_unique_variants(report: str) -> str:
    variants = (
        pd.read_csv(report, usecols=["referenceName", "start", "end"])
        .reindex(columns=["referenceName", "start", "end"])
        .drop_duplicates()
    )

    loci = ""

    if not variants.empty:
        variants["range"] = variants.apply(
            lambda row: f"{row.referenceName}:{row.start - 1}-{row.end + 1}", axis=1
        )

        loci = (
            variants.to_string(index=False, header=False, columns=["range"])
            .replace("\n", " ")
            .strip()
        )

    print(loci, end="")
    return loci


if __name__ == "__main__":
    args = get_parser().parse_args()

    get_unique_variants(args.variants)
