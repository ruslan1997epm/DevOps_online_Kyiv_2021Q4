#1. From which ip were the most requests?

#uniq -c : prints a number of occurences
#sort -nr : n - numeric sort, r - reverse results

cat apache_logs.txt | awk '{ print $1 }' | sort | uniq -c | sort -nr | head -n 1

#2. What is the most requested page?

cat apache_logs.txt | awk '{ print $7 }' | sort | uniq -c | sort -nr | head -n 1

#3. How many requests were there from each ip?

cat apache_logs.txt | awk '{ print $1 }' | sort | uniq -c | sort -nr

#4. What non-existent pages were clients referred to?
#grep -B 1 : print --before-context, 1 line before match

#cat apache_logs.txt | awk '{ print $7 }' | grep 404 | wc -l

cat apache_logs.txt | grep error404 -B 1 | grep -v error404 | egrep -v "^\-\-$" | awk '{ print $7 }'

#5. What time did site get the most requests?

cat apache_logs.txt | awk '{ print $4 }' | sed 's/^\[//g' | sed 's/:..$//g' | uniq -c | sort -rn | head -n 1

#6. What search bots have accessed the site? (UA + IP)

cat apache_logs.txt | grep 'bot\|Bot' | awk '{ print $14 }' | sort | uniq -c | sort -rn
