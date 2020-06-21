# Helper function to use the Python version defined as 'global' in pyenv
function gpy
    PYENV_VERSION=(pyenv global) $argv
end