#!/usr/bin/env bash

python3 run_tests.py

ID=$(jq '.users[0].id' /autograder/submission_metadata.json)

TIMESTAMP=$(jq '.created_at[:-6]' /autograder/submission_metadata.json)

rm -r /autograder/${ID}
cp -R /autograder/submission/ /autograder/${ID}

echo ${TIMESTAMP} > /autograder/lemonade_grading/${ID}/timestamp.txt

cd /autograder/lemonade_grading
git add /autograder/lemonade_grading/${ID}
git commit -m ${TIMESTAMP}
git push
