#!/usr/bin/env python3

import argparse
import dataclasses
import enum
import functools
import json
import os
import re
import shutil
import sys
import traceback
import typing as t

PATH = '~/.bp.json'
DEFAULT = {'store': '~/.bp'}

@dataclasses.dataclass
class Config:
  store: str

  @staticmethod
  def load():
    path = os.path.expanduser(PATH)

    if not os.path.exists(path):
      with open(path, 'w') as file:
        json.dump(DEFAULT, file)

    with open(path, 'r') as file:
      return Config(**json.load(file))

class Handler:
  def __init__(self, args):
    self.args = args
    self.config = Config.load()

  def run(self) -> None:
    for data, func in [
      (self.args.use, self.__use),
      (self.args.list, self.__list),
      (self.args.save, self.__save)
    ]:
      if data:
        func(data)

  def __use(self, filenames: t.List[str]) -> None:
    for filename in filenames:
      file = File(os.path.join(self.config.store, f'{filename}.bp'))

      if self.args.interactive:
        print(f'**** template {filename}.bp ****')
        for var in file.env:
          if not (inp := input(f'{var} ({file.env[var]}): ')):
            continue
          file.env[var] = inp

      self.__write(file, os.getcwd())

  def __list(self, *args) -> None:
    print(*os.listdir(os.path.expanduser(self.config.store)), sep="\n")

  def __save(self, args: t.List[str]) -> None:
    name, path = args
    shutil.move(
      os.path.abspath(path),
      os.path.join(os.path.expanduser(self.config.store), f'{name}.bp')
    )

  def __write(self, file, path) -> None:
    filename = f'{file.env["filename"]}.{file.env["extension"]}' if file.env[
      'extension'] else f'{file.env["filename"]}'
    with open(os.path.join(path, filename), "w+") as out:
      for line in Parser(file.env).run(file.content[file.end:]):
        out.write(line)

class InvalidFileFormat(Exception):
  pass

@dataclasses.dataclass
class Arguments:
  use: t.List[str]
  list: bool
  interactive: bool
  save: t.List[str]
  verbose: bool

  @staticmethod
  def from_args():
    parser = argparse.ArgumentParser(prog="bp")

    parser.add_argument(
      '--use',
      '-u',
      nargs='+',
      required=False,
      help='Use a file template in `store`.'
    )

    parser.add_argument(
      '--list',
      '-l',
      required=False,
      action='store_true',
      help='List all available templates.'
    )

    parser.add_argument(
      '--interactive',
      '-i',
      required=False,
      action="store_true",
      help='Be prompted for variables in the files frontmatter.'
    )

    parser.add_argument(
      '--save',
      '-s',
      nargs='+',
      required=False,
      help='Save a template in `store`.'
    )

    parser.add_argument(
      '--verbose',
      '-v',
      required=False,
      action="store_true",
      help='Add tracebacks to error messages.'
    )

    return Arguments(**vars(parser.parse_args()))

  def run(self):
    Handler(self).run()

class Parser:
  def __init__(self, env):
    self.env = env

  def run(self, lines):
    return list(map(lambda line: self.parse_line(line), lines))

  def vars(self, line):
    return re.findall('{%(.*?)%}', line)

  def parse_line(self, line):
    vars = self.vars(line)
    if not vars:
      return line
    for var in vars:
      if var not in self.env:
        continue
      line = re.sub('{%' + var + '%}', str(self.env[var]), line)
    return line

class Path:
  def __init__(self, path):
    self.path = os.path.expanduser(path)

  def __repr__(self):
    return self.path

  @property
  def last(self):
    return os.path.basename(os.path.normpath(self.path))

  @property
  def filename(self):
    return os.path.splitext(self.last)[0]

  @property
  def ext(self):
    return os.path.splitext(self.last)[1]

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

def main(args):
  try:
    args.run()
  except Exception as error:
    if args.verbose:
      traceback.print_exc()
    print(f'error: {str(error)}', file=sys.stderr)

if __name__ == '__main__':
  main(Arguments.from_args())
