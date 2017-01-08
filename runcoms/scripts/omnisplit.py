"""send files to one instance of nvim in tmux"""
import os
import sys

from neovim import attach


def call_neovim(files):
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
    socket_path = os.environ.get("NVIM_LISTEN_ADDRESS")

    if os.path.exists(socket_path):
        # socket already associated with this window.
        # so just attach to it and send the commands
        nvim = attach('socket', path=socket_path)
        command = "vertical botright pedit "
        for file in files:
            nvim.command(command + os.path.join(os.path.abspath(os.curdir), file))
    else:
        pass


def main():
    """gather args and setup defaults"""

    # read files from command line arguments
    # we remove the first, since this will always be omnivim.py
    files = sys.argv
    files.pop(0)

    # check TMUX environment variable to confirm whether or not tmux is currently running.
    in_tmux = os.environ.get('TMUX')

    if in_tmux is not None:
        call_neovim(files)
    else:
        pass

main()
