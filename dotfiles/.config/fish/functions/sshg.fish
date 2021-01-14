function sshg --argument ssh_path email power
    if count $power > /dev/null
        # Thanks
    else
        set power 100
    end

    if count $email > /dev/null
        # Thanks
    else
        set email "dalisoft@mail.ru"
    end
   
    if count $ssh_path > /dev/null
        ssh-keygen -o -a $power -t ed25519 -C $email -f $ssh_path
    else
        ssh-keygen -o -a $power -t ed25519 -C $email
    end

end
