function psrec --argument pid name
    psrecord $pid --include-children --duration=30 --log ~/Desktop/$name.txt --plot ~/Desktop/$name.png && echo "Record was done"
end
