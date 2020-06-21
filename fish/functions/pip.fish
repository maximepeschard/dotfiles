function pip
    if not set -q VIRTUAL_ENV
        read -l -P "We're not in a virtual environment, are you sure ? [y/N] " confirm

        switch $confirm
            case Y y
                command pip $argv
            case '*'
                return 1
        end
    else
        command pip $argv
    end
end