import shutil
import subprocess
import sys

def install(pkg):
    if shutil.which("apt-get"): cmd = f"apt-get install -y {pkg}"
    elif shutil.which("apk"): cmd = f"apk add {pkg}"
    elif shutil.which("dnf"): cmd = f"dnf install -y {pkg}"
    else: return "Error: Unknown OS"
    return subprocess.getoutput(cmd)

if __name__ == "__main__":
    if len(sys.argv) > 1 and "install" in sys.argv[1]:
        print(install(sys.argv[1].split()[-1]))
