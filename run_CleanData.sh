#### Step 1: Unzip the files ####
unzip getdata-projectfiles-UCI\ HAR\ Dataset.zip

#### Removes spaces from directory name ####
mv UCI\ HAR\ Dataset/ UCI_HAR_Dataset/

#### Removes commas, parantheses, and dashes from the column names ####
sed -e 's|,|_|g'  ./UCI_HAR_Dataset/features.txt     > ./UCI_HAR_Dataset/tmp1_features.txt
sed -e 's|(||g'   ./UCI_HAR_Dataset/tmp1_features.txt > ./UCI_HAR_Dataset/tmp2_features.txt
sed -e 's|)||g'   ./UCI_HAR_Dataset/tmp2_features.txt > ./UCI_HAR_Dataset/tmp3_features.txt
sed -e 's|-|_|g'  ./UCI_HAR_Dataset/tmp3_features.txt > ./UCI_HAR_Dataset/mod_features.txt

#### Use python scripts to merge test and training dataframes ####
python print_table.py > table.txt
python parse_table.py > parsed_table.csv

#### Remove quotation marks and brackets from the merged dataset ####
sed -e 's|["'\'']||g'  parsed_table.csv > noquote.csv
sed -e 's|\[||g'  noquote.csv > nobracket1.csv
sed -e 's|\]||g'  nobracket1.csv > cleandata.csv

#### Clean up directory by moving original zip file and removing unneccessary files ####
rm noquote.csv parsed_table.csv table.txt nobracket1.csv
rm UCI_HAR_Dataset/tmp*
mv getdata-projectfiles-UCI\ HAR\ Dataset.zip UCI_HAR_Dataset/

