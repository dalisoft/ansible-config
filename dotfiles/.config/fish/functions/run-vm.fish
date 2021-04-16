function runVm --argument name is_temp
    if count $is_temp > /dev/null
        docker run -ti --net=bridge --name=$name
    else
        docker run -ti --rm --net=bridge --name=$name
    end
end
