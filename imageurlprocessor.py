#!/usr/bin/env python3
""" Handle Google Drive Link Processing
"""
import sys


def get_direct_url(url) -> str:
    """ Generates a direct url for Google Drive
    """
    file_id = url.split("/d/")[1].split("/")[0]
    return f"https://drive.google.com/uc?export=view&id={file_id}"


if __name__ == "__main__":
    url = sys.argv[1]
    print(get_direct_url(url=url))
