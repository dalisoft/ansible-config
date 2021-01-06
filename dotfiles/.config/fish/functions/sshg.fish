function sshg --argument ssh_path email power
    if count $power > /dev/null
        # Thanks
    else
        $power = 100

    if count $email > /dev/null
        # Thanks
    else
        $email = "dalisoft@mail.ru"

    if count $ssh_path > /dev/null
        ssh-keygen -o -a $power -t ed25519 -C $email -f $ssh_path
    else
        ssh-keygen -o -a $power -t ed25519 -C $email