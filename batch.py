import os
import glob

output_dir = "output"
if os.path.exists(output_dir):
    for file in os.listdir(output_dir):
        file_path = os.path.join(output_dir, file)
        if os.path.isfile(file_path):
            os.unlink(file_path)
        elif os.path.isdir(file_path):
            os.rmdir(file_path)
else:
    os.makedirs(output_dir)


input_files = glob.glob("src/*")
for input_file in input_files:
    if not input_file.endswith(".typ"):
        continue
    output_file = os.path.basename(input_file).split(".")[0] + ".svg"
    command = f"typst c {input_file} {output_dir}/{output_file} --root . --font-path ./fonts"
    os.system(command)
