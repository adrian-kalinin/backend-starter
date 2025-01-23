#!/usr/bin/env python
import os
import sys


def main() -> None:
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "config.settings")

    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        msg = "Could not import Django"
        raise ImportError(msg) from exc

    execute_from_command_line(sys.argv)


if __name__ == "__main__":
    main()
