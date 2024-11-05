output_dir="output"

for file in src/*.typ; do
    basename=$(basename "${file}")
    basename="${basename%.*}"
    if [ ! -d "${output_dir}" ]; then
        mkdir "${output_dir}"
    fi
    typst c "${file}" output/"${basename}".png --root . --font-path ./fonts --ppi 500
done

for output_file in ${output_dir}/*; do
    if [ -f "${output_file}" ]; then
        info=$(stat -f '%N : %z' "${output_file}")
        echo ${info}
    fi
done
