######################################
# Author: Zephyr Serret Verbist 
# Date : 27 March 2024
# ####################################

#!/bin/bash

if (($# < 2)); then
	>&2 echo "not enough arguments"
	exit -1
fi

output_dir=""
input_dir="src"
signature="Zephyr Serret Verbist - +32 470 85 10 51 - zserret@me.com"

### echo-ing arguments
echo "#### The arguments ####"
echo "Company : \"$1\""
echo "Position : \"$2\""
echo "#### ------------- ####"


### Making the cover letter AI-less

cp ./$input_dir/template.txt ./$ouput_dir/$1_cover.txt
echo "created the file \"$1_cover.txt\""
sed -i "s/<company>/$1/g" ./$output_dir/$1_cover.txt
sed -i "s/<position>/$2/g" ./$output_dir/$1_cover.txt


#### Running through Chatgpt #### In reality we are using Phind

echo "Do you want to use Chatgpt to improve the cover letter? (y/n)"
read yn_chat_gpt
case $yn_chat_gpt in
    [yY]* ) echo "You chose Yes.";
	    cp ./$input_dir/gpt_prompt.txt ./$output_dir/$1_cover_letter.txt
	    cat ./$output_dir/$1_cover.txt >> ./$output_dir/$1_cover_letter.txt
	    echo "What do you want to put emphasis on?"
	    read emphasis_prompt
	    echo "In my cover letter I have made paragraphs detailling my expertise in multiple technologies. Make sure to select the ones that put emphasis on $emphasis_prompt. Don't explain yourself, I just want the text" >> ./$output_dir/$1_cover_letter.txt
	    #echo "This is what I give to chatgpt"
	    #cat ./$output_dir/$1_cover_letter.txt
	    #exit 2
	    echo "." >> ./$output_dir/$1_cover_letter.txt
	    cat ./$output_dir/$1_cover_letter.txt | tgpt -m -w | tee ./$output_dir/$1_cover_letter.txt 
            echo $signature >>  ./$output_dir/$1_cover_letter.txt
            ;;
    [nN]* ) echo "You chose No.";
            ;;
    * )     echo "Invalid input. Expected y or n"; exit 1;;
esac


#### adding signature ####
echo $signature >>  ./$output_dir./$1_cover.txt
