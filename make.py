"""Generate HTML diff for HDBSCAN PR."""
from subprocess import check_output, run
import subprocess
from pathlib import Path


pr = Path("scikit-learn")
hdbscan = Path("hdbscan")

files_to_diff = [
    (
        pr / "sklearn" / "cluster" / "_hdbscan" / "hdbscan_.py",
        hdbscan / "hdbscan" / "hdbscan_.py",
    )
]

for pr_file, hdbscan_file in files_to_diff:
    if not pr_file.exists():
        raise ValueError(f"{pr_file} does not exist")
    if not hdbscan_file.exists():
        raise ValueError(f"{hdbscan_file} does not exist")

    pr_file_abs = str(pr_file.resolve())
    hdbscan_file_abs = str(hdbscan_file.resolve())
    output = run(
        ["diff", pr_file_abs, hdbscan_file_abs],
        shell=True,
        stderr=subprocess.STDOUT,
    )
    print(output)
