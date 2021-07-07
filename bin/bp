#!/usr/bin/python3

import argparse
import shutil
import os
import re
import sys
import enum
import functools

# **** config.py ****

CONFIG = '~/.bp.toml'
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

  # yapf: disable
  def run(self):
    arg, data = self.args
    {
      Arg.USE: self.__use,
      Arg.INT: self.__use_interactive,
      Arg.SAVE: self.__save,
      Arg.LIST: self.__list
    }[arg](*data)
  # yapf: enable

  def __use(self, *data):
    names, path = Utils.split(data)

    for name in names:
      file = File(os.path.join(self.config.store, f'{name}.bp'))
      self.__write(file, path or os.getcwd())

  def __use_interactive(self, *data):
    names, path = Utils.split(data)

    for name in names:
      print(f'**** template {name}.bp ****')

      file = File(os.path.join(self.config.store, f'{name}.bp'))
      for var in file.env:
        inp = input(f'{var} ({file.env[var]}): ')
        if not inp:
          continue
        file.env[var] = inp

      self.__write(file, path or os.getcwd())

  def __list(self, *args):
    d = os.listdir(os.path.expanduser(self.config.store))
    print(*d, sep="\n")

  def __save(self, name, path):
    path = os.path.abspath(path)
    shutil.move(path, os.path.join(self.config.store, f'{name}.bp'))

  def __write(self, file, path):
    filename = f'{file.env["filename"]}.{file.env["extension"]}' if file.env['extension'] else f'{file.env["filename"]}'
    parser = Parser(file.env)
    with open(os.path.join(path, filename), "w+") as out:
      lines = parser.run(file.content[file.end:])
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

class InvalidFileFormat(Exception):
  pass

class InvalidOption(Exception):
  pass

class Utils:
  @staticmethod
  def split(l):
    if not l:
      return
    if os.path.exists(l[-1]):
      return (l[:-1], l[-1])
    return (l, None)

  # yapf: disable
  @staticmethod
  def convert(args):
    for pred, res in [
      (lambda args: args.use and args.interactive, (Arg.INT, args.use)),
      (lambda args: args.use, (Arg.USE, args.use)),
      (lambda args: args.save, (Arg.SAVE, args.save)),
      (lambda args: args.list, (Arg.LIST, [None]))
    ]:
      if pred(args):
        return res
    raise InvalidOption("You must pass in a valid option.")
  # yapf: enable

# **** arg.py ****

class Arg(enum.Enum):
  USE = 1
  INT = 2
  SAVE = 3
  LIST = 4

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

  @functools.cached_property
  def env(self):
    env = {'filename': self.filename, 'extension': ''}

    for line in self.content[1:]:
      if line.strip() == "---":
        break
      key, value = line.split(":")
      env[key.strip()] = value.strip()

    return env

  @property
  def end(self):
    for idx, line in enumerate(self.content[1:]):
      if line.strip() == '---':
        return idx + 2

  @property
  def content(self):
    with open(self.path, "r") as file:
      content = file.readlines()
    return content

# **** __main__.py ****

def cli():
  parser = argparse.ArgumentParser()
  parser.add_argument('--use', '-u', nargs='+', help='Use a file template.')
  parser.add_argument('--list', '-l', action='store_true', help='List all available templates.')
  parser.add_argument('--interactive', '-i', action="store_true", help='Be prompted for variable in frontmatter.')
  parser.add_argument('--save', '-s', nargs='+', help='Save a template in `store`.')
  return parser.parse_args()

def main(args, config):
  Handler(Utils.convert(args), config).run()

if __name__ == '__main__':
  try:
    main(cli(), Config.load())
  except (Exception, InvalidFileFormat, InvalidOption) as error:
    print(error)
    # traceback.print_exc()
    sys.exit(1)
