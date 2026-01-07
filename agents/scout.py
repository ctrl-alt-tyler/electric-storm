import sys
import os

def list_files(startpath="."):
    tree = []
    for root, dirs, files in os.walk(startpath):
        level = root.replace(startpath, '').count(os.sep)
        indent = ' ' * 4 * (level)
        tree.append(f"{indent}{os.path.basename(root)}/")
        subindent = ' ' * 4 * (level + 1)
        for f in files:
            tree.append(f"{subindent}{f}")
    return "\n".join(tree)

def read_file(path):
    try:
        with open(path, 'r') as f: return f.read()
    except Exception as e: return str(e)

if __name__ == "__main__":
    if len(sys.argv) > 1 and sys.argv[1] == "ls":
        print(list_files())
