from pathlib import Path
import re

def splitext(filepath:str) -> tuple[str, str]:
    filepath:Path = Path(filepath)
    return filepath.stem, filepath.suffix

def renumber(filename:str, add:int=1) -> str:
    match = re.match(
        r'(\d+)-([\w-]+)',
        filename
    )
    num, name = match.groups()
    return f'{int(num)+add:02}-{name}'

brocode = Path('brocode')
assert brocode.exists()
assert brocode.is_dir()

for script in sorted(brocode.glob('*.sql')):
    print(script.name)
    name, ext = splitext(script)
    newname = renumber(script.name)
    newscript = script.with_stem(newname)
    script.rename(newscript)