#!/bin/sh

echo "======================================"
echo "            NVIM INSTALLER            "
echo "======================================"

read "reinstall_answer?Do you want to reinstall nvim already installed?[y/N] : "

if [[ "$reinstall_answer" == "y" ]] then
  rm -rf ~/.config/nvim/ && rm -rf ~/.local/share/nvim && rm -rf ~/.cache/nvim

  echo "Deleted nvim"
fi

echo "Nvim downloading.."
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
echo "Nvim download completed !!"

read "custom_answer?Do you want apply to custom NvChad? (custom nvim)[y/N] : "

if [[ "$custom_answer" == "y" ]] then
  echo "Nvim custom..."

  nvim_path="~/.config/nvim/lua/custom"

  mv ./nvchad.zip $nvim_path/nvchad.zip

  pushd $nvim_path

  unzip nvchad.zip

  mv ./NvChad_Custom/* .

  popd

  echo "Nvim custom installing.."

  sleep 1

  nvim
fi
