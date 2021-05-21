function gpg_rem_keys --argument name
    gpg --delete-secret-key $name
    gpg --delete-key $name
end

function gpg_show_keys
    gpg -K --keyid-format LONG
end

function gpg_show_print --argument id
    gpg --armor --export $id
end
