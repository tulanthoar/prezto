"""send files to one instance of nvim in tmux"""
import os
import sys
import subprocess
import re

try:
    from neovim import attach
except ImportError:
    # no neovim installed on host machine.
    pass


def tmux_send_keys(command):
    """ Call a command as a call to `tmux send-keys`.

    Args:
        command (str): The command that should be called, as a single string.
    """
    subprocess.call(['tmux', 'send-keys', '-l', ' '.join(command), '\r'])


def call_neovim(editor, editor_flags, files, nvim_socket_path='/tmp'):
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
    win = subprocess.check_output(["tmux", "display-message", "-p", "#{window_id}"])
    win = win.rstrip().strip().decode('utf-8')
    #socket_path = os.path.join(nvim_socket_path, ''.join(['nvim_omni']))
    socket_path = os.environ.get("NVIM_LISTEN_ADDRESS")

    if os.path.exists(socket_path):
        # socket already associated with this window.
        # so just attach to it and send the commands
        nvim = attach('socket', path=socket_path)
        for file in files:
            nvim.command('e ' + os.path.join(os.path.abspath(os.curdir), file))
    else:
        # no associated socket. So we create a new Neovim instance
        command = [editor] + editor_flags + files

        # run tmux_send_keys, tmux recognises Vim is running, vim-tmux-navigator not break
        tmux_send_keys(command)


def call_vim(editor, flags, files):
    """Call vim (or a variant thereof) with a desired number of flags and files.

    If a Vim server in the current Tmux window is found, then the files are opened there.
    Else, a new Vim instance is created in this pane

    Args:
        editor (str): The editor command that should be called.
        flags (str): A list of strings containing extra flags
        files (str): A list of strings containing the files that should be opened.  """

    # get the current tmux window in which this command was run
    win = subprocess.check_output(["tmux", "display-message", "-p", "#{window_id}"])
    win = win.rstrip()
    # and get a list of servers, as a string split by spaces
    servs = str.split(subprocess.check_output([editor] + flags + ['--serverlist']))
    servs = servs.rstrip()

    try:
        # if we find a running server, send the commands there
        servs.index(win)
        subprocess.call([editor] + flags + ["--servername", win, "--remote"] + files)
    except ValueError():
        # list.index throws an exception if there's nothing found
        # we didn't find a server, create a new Vim server with the necessary arguments
        command = [editor] + flags + ['--servername', win, '--remote-silent'] + files

        # run tmux_send_keys, tmux recognises Vim is running, vim-tmux-navigator not break
        tmux_send_keys(command)


def main():
    """gather args and setup defaults"""
    # if the OMNIVIM_EDITOR environment variable is set, use it.
    # otherwise, use vim.
    editor = 'nvim'
    editor_flags = []
    omnivim_editor = os.environ.get('OMNIVIM_EDITOR')
    if omnivim_editor is not None and len(omnivim_editor) > 0:
        editor_flags = str.split(os.environ.get('OMNIVIM_EDITOR'), ' ')
        editor = editor_flags.pop(0)
    nvim_socket = os.environ.get('NVIM_SOCKET_PATH')
    if nvim_socket is not None and len(nvim_socket) > 0:
        nvim_socket_path = nvim_socket
    else:
        nvim_socket_path = '/tmp/'

    # read files from command line arguments
    # we remove the first, since this will always be omnivim.py
    files = sys.argv
    files.pop(0)

    # check TMUX environment variable to confirm whether or not tmux is currently running.
    in_tmux = os.environ.get('TMUX')
    lit_flag = files.count("--lit")

    if in_tmux is not None and lit_flag == 0:
        # if tmux is running, do different things if using neovim or another form of vim
        # use regex to work it out
        is_neovim = re.search('n(eo)?vim', editor)

        if is_neovim is not None:
            call_neovim(editor, editor_flags, files, nvim_socket_path)
        else:
            call_vim(editor, editor_flags, files)
    else:
        # otherwise, just call the editor and flags with the requisite files
        while files.count("--lit") > 0:
            # if lit_flag was passed in, remove it from the list of files before calling
            files.pop(files.index("--lit"))
        subprocess.call([editor] + editor_flags + files)

main()
