#!/usr/bin/python
"""send files to one instance of nvim in tmux"""
from os import environ, path, curdir

from neovim import attach


def call_neovim():
    """Call Neovim with a desired number of flags and files.

    This is in a separate function as neovim has a VERY different way of doing things.

    If a Neovim server is running on this Tmux window, then the files are opened there.
    Else, create a new Neovim instance in the pane.
    Args:
        editor (str): The editor command that should be called.
        editor_flags (str): A list of strings containing extra flags.
        files (str): A list of strings containing the files that should be opened.
        nvim_socket_path (str): The path where socket files should be stored.  """

    # Neovim instances in this script are formattted "/tmp/nvim-@n.omni"
    socket_path = environ.get("NVIM_LISTEN_ADDRESS")

    if path.exists(socket_path):
        # socket already associated with this window.
        # so just attach to it and send the commands
        nvim = attach('socket', path=socket_path)
        command = "cd "
        nvim.command(command + path.abspath(curdir))
    else:
        pass


if __name__ == '__main__':
    call_neovim()
