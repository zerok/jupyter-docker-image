#!/usr/bin/env python3
import sys
import os
import pathlib
import subprocess

root = pathlib.Path('/data')
command = sys.argv[1] if len(sys.argv) > 1 else 'default'
commands = ['lab', 'bash-func']

if command in ('default', 'lab'):
    sys.exit(subprocess.call(
        ['jupyter', 'lab', '--allow-root', '--no-browser', '--ip', '0.0.0.0', '--port', '9980'],
        cwd=str(root)).returncode)

elif command == 'bash-func':
    print('''lab() {
    docker run --rm -v $PWD:/data -p 9980:9980 zerok/jupyter
}''')

else:
    print('Only the following commands are supported:')
    for cmd in commands:
        print(' - {}'.format(cmd))
    sys.exit(1)
