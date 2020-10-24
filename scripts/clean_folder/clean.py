#!/usr/bin/python3
import os
import time
from send2trash import send2trash


def main():
    d, days = input('Absolute path: '), int(input('# of days: '))
    for subdir, dirs, files in os.walk(d, topdown=True):
        for f in files:
            mod_date, curr_date = os.path.getmtime(
                os.path.join(subdir, f)), time.time()
            # delete if d days inactive
            if abs(mod_date - curr_date) / (60 * 60 * 24) > days:
                send2trash(os.path.join(subdir, f))


if __name__ == "__main__":
    main()
