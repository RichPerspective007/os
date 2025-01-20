#!/bin/bash

echo -e "\tSTUDENT RECORDS"
echo "Roll | Name | Marks"
cat q26a_input.txt

echo "Enter roll number of student whose records you want to delete: "
read delroll

echo "UPDATED STUDENT RECORDS"
echo "Roll | Name | Marks"
sed -E "/^$delroll\b/d" q26a_input.txt 
# for deleting records in-place, use -i option with sed and then use cat to display the updated records
