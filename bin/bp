#!/usr/bin/python3

import argparse
import shutil
import os
import re
import sys
import enum

# **** config.py ****

CONFIG = '~/bp.toml'
DEFAULT = {'store': '~/.bp'}

class Config:
  def __init__(self, store):
    self.store = os.path.expanduser(store)

  @staticmethod
  def load():
    path = os.path.expanduser(CONFIG)

    if not os.path.exists(path):
      with open(path, 'w') as file:
        for key, value in DEFAULT.items():
          file.write("{} = {}".format(key, value))

    with open(path, 'r') as file:
      lines = file.readlines()

    d = {}
    for line in lines:
      key, value = line.split('=')
      d[key.strip()] = value.strip()

    return Config(**d)

# **** handler.py ****

class Handler:
  def __init__(self, args, config):
    self.args = args
    self.config = config

  def run(self):
    arg, data = self.args
    {Arg.USE: self.__use, Arg.INT: self.__use_interactive, Arg.SAVE: self.__save}[arg](*data)

  def __use(self, name, path=None):
    file = File(os.path.join(self.config.store, f'{name}.bp'))
    env = file.env
    path = path or os.getcwd()

    self.__write(env, file, path)

  def __use_interactive(self, name, path=None):
    file = File(os.path.join(self.config.store, f'{name}.bp'))
    env = file.env
    path = path or os.getcwd()

    for var in env:
      inp = input(f'{var}: ')
      env[var] = inp

    self.__write(env, file, path)

  def __save(self, name, path):
    path = os.path.abspath(path)
    shutil.move(path, os.path.join(self.config.store, f'{name}.bp'))

  def __write(self, env, file, path):
    p = f'{env["filename"]}.{env["extension"]}' if env['extension'] else f'{env["filename"]}'
    parser = Parser(env)
    with open(os.path.join(path, p), "w+") as out:
      lines = parser.run(file.content()[file.end:])
      for line in lines:
        out.write(line)

# **** parser.py ****

class Parser:
  def __init__(self, env):
    self.env = env

  def run(self, lines):
    for i in range(len(lines)):
      lines[i] = self.parse_line(lines[i])
    return lines

  def get_vars(self, line):
    return re.findall("{%(.*?)%}", line)

  def parse_line(self, line):
    # some cases:
    # a: 1; b: 2
    # {%a%} + {%b%} -> 1 + 2
    # ({%a%}{%b%})  -> (12)
    vars = self.get_vars(line)
    if not vars:
      return line
    for v in vars:
      if v not in self.env:
        continue
      line = re.sub("{%" + v + "%}", str(self.env[v]), line)
    return line

# **** utils.py ****

# yapf: disable

class InvalidFileFormat(Exception):
  pass

class InvalidArgument(Exception):
  pass

class Utils:
  def handle(func):
    def wrap(*args, **kwargs):
      parser, args = func(*args, **kwargs)

      if not any([args.use, args.interactive, args.save]):
        parser.print_help()
        raise InvalidArgument('\nYou must specify an option.')

      if args.interactive and not args.use:
        raise InvalidArgument('Cannot use the `--interactive` flag without `--use`.')

      if args.use and args.save:
        raise InvalidArgument('Cannot use `--use` alongside `--save`.')

      return args
    return wrap

  def exceptions():
    return (Exception, InvalidFileFormat, InvalidArgument)

  def convert(args):
    for pred, res in [
        (lambda args: args.use and args.interactive, (Arg.INT, args.use)),
        (lambda args: args.use, (Arg.USE, args.use)),
        (lambda args: args.save, (Arg.SAVE, args.save))
    ]:
      if pred(args):
        return res

# yapf: enable

# **** arg.py ****

class Arg(enum.Enum):
  USE = 1
  INT = 2
  SAVE = 3

# **** path.py ****

class Path:
  def __init__(self, path):
    self.path = path

  def __repr__(self):
    return self.path

  @property
  def last(self):
    return os.path.basename(os.path.normpath(self.path))

  @property
  def filename(self):
    name, _ = os.path.splitext(self.last)
    return name

  @property
  def ext(self):
    _, ext = os.path.splitext(self.last)
    return ext

class File(Path):
  def __init__(self, path):
    super().__init__(path)
    if self.ext != ".bp":
      raise InvalidFileFormat("File must be a valid `.bp` file.")

  @property
  def env(self):
    env = {'filename': self.filename, 'extension': ''}

    for line in self.content()[1:]:
      if line.strip() == "---":
        break
      key, value = line.split(":")
      env[key.strip()] = value.strip()

    return env

  @property
  def end(self):
    for idx, line in enumerate(self.content()[1:]):
      if line.strip() == '---':
        return idx + 2

  def content(self):
    with open(self.path, "r") as file:
      content = file.readlines()
    return content

# **** __main__.py ****

@Utils.handle
def cli():
  parser = argparse.ArgumentParser()
  parser.add_argument('--use', '-u', nargs='+', help='Use a file template.')
  parser.add_argument('--interactive', '-i', action="store_true", help='Be prompted for variable in frontmatter.')
  parser.add_argument('--save', '-s', nargs=2, help='Save a template in `store`.')
  return (parser, parser.parse_args())

def main(args, config):
  Handler(Utils.convert(args), config).run()

if __name__ == '__main__':
  try:
    main(cli(), Config.load())
  except Utils.exceptions() as error:
    print(error)
    # traceback.print_exc()
    sys.exit(1)
