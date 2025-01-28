#!/bin/bash
#step1: Main directory with date and time name
main_dir=$(date +"%Y-%m-%d_%H-%M-%S")
	mkdir "$main_dir"

#step2: Create subdirectories named file101 to file110
for i in {101..110}; do
	subdir="$main_dir/file$i"
	mkdir "$subdir"

	#step3: Create text files from tuser501.txt to tuser510.txt in each subdirectory
	file_number=$((i + 400)) 
	file_name="tuser$file_number.txt"
	file_path="$subdir/$file_name"

	#step4: Unique programming language into each text file
	languages=("Python" "JavaScript" "Java" "C" "C++" "Ruby" "Go" "Rust" "Swift" "Kotlin")
	echo "${languages[$i - 101]}" > "$file_path"
done

echo "Script executed successfully. Check the new '$main_dir' directory for the subdirectories and files."

#step5: Print the directory structure (still technically works without “tree” installed)
echo -e "\nDirectory Structure:"
if command -v tree &> /dev/null; then
	tree "$main_dir"
else
	echo "The 'tree' command is not installed. Using 'find' instead:"
	find "$main_dir" | sed -e "s/[^-][^\/]*\// |/g" -e "s/|\([^ ]\)/|-\1/"
fi

