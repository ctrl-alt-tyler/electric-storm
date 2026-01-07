import sys
import os

def write_file(path, content):
    try:
        # Security: Prevent writing outside /app
        if ".." in path or path.startswith("/"):
            return "Error: Path traversal detected."
        
        dir_name = os.path.dirname(path)
        if dir_name: os.makedirs(dir_name, exist_ok=True)
        
        with open(path, 'w') as f:
            f.write(content)
        return f"Successfully wrote to {path}"
    except Exception as e:
        return f"Error writing file: {e}"

if __name__ == "__main__":
    # distinct arg parsing would go here
    print("Worker Agent Ready")
