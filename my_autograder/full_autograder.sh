#!/usr/bin/env bash

python3 run_tests.py

ID=$(jq '.users[0].id' /autograder/submission_metadata.json)

TIMESTAMP=$(jq '.created_at[:-6]' /autograder/submission_metadata.json)

rm -r /autograder/${ID}
cp -R /autograder/submission/ /autograder/grading/${ID}

echo ${TIMESTAMP} > /autograder/grading/${ID}/timestamp.txt

cd /autograder/grading
git add /autograder/grading/${ID}
git commit -m ${TIMESTAMP}
git push
