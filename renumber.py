from pathlib import Path
import re
from typing import Generator

# def split_filename_ext(filepath:str) -> tuple[str, str]:
#     ''' separate name, ext: same as os.path.splitext '''
#     filepath:Path = Path(filepath)
#     return filepath.stem, filepath.suffix

def split_num_name(filename:str) -> tuple[int, str]:
    ''' separate lesson number, description '''
    match = re.match(
        r'(\d+)-([\w-]+)',
        filename
    )
    num, name = match.groups()
    return int(num), name

def renumber_stem(stem:str, add:int=1) -> str:
    ''' renumbers string like 1-smtng to 02-smtng'''
    # name, ext = split_filename_ext(stem)
    num, name = split_num_name(stem)
    return f'{(num+add):02}-{name}'

def get_sql_scripts_paths(path:str, wildcard='*.sql')-> Generator[Path, None, None]:
    path = Path('brocode')
    assert path.exists()
    assert path.is_dir()
    return sorted(path.glob(wildcard))

def main(path:str, rename:bool=False):

    for script in get_sql_scripts_paths(path):
        print(script.name)
        new_stem = renumber_stem(script.name)
        newscript = script.with_stem(new_stem)
        print(newscript)
        if rename:
            print(f'renaming {script} to {newscript}')
            script.rename(newscript)

if __name__ == "__main__":
    main('brocode')
