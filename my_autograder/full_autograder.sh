#!/usr/bin/env bash

python3 run_tests.py

ID=$(jq '.users[0].id' /autograder/submission_metadata.json)

TIMESTAMP=$(jq '.created_at[:-6]' /autograder/submission_metadata.json)


rm -r /autograder/grading/submissions/${ID}
cp -R /autograder/submission/ /autograder/grading/submissions/${ID}

echo ${TIMESTAMP} > /autograder/grading/submissions/${ID}/timestamp.txt

cd /autograder/grading
git add /autograder/grading/submissions/${ID}
git commit -m ${TIMESTAMP}
git push
