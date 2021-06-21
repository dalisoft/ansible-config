function runVm --argument name is_temp image
    if count $is_temp > /dev/null
        docker run -ti --net=bridge --name=$name $image
    else
        docker run -ti --rm --net=bridge --name=$name $image
    end
end
