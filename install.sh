#!/bin/bash

set -e

root_dir="$(dirname "${BASH_SOURCE[0]}")"
cd "$root_dir"

rm -rf conda

cat > env.sh <<EOF
export CONDA_ROOT="$PWD/conda"
if [[ -d \$CONDA_ROOT ]]; then
    source \$CONDA_ROOT/etc/profile.d/conda.sh
    conda activate
fi
EOF

source env.sh

system="$(uname)"
processor="$(uname -p)"
if [[ $system = Darwin ]]; then
    system=MacOSX
    processor=x86_64
fi

curl -L https://repo.anaconda.com/miniconda/Miniconda3-latest-$system-$processor.sh -o conda-installer.sh
bash ./conda-installer.sh -b -p $CONDA_ROOT
rm conda-installer.sh

source $CONDA_ROOT/etc/profile.d/conda.sh

conda install -y ansible=4.4.0=py39h6e9494a_0 google-auth -c conda-forge
