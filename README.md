# submission_uploader
A repository for uploading Gradescope submissions to Github


# Setup

When making a new assignment, you will need to do the following steps:

1. Create a copy of this repository with a relevant title (e.g. Lemonade_24). Work in the new repository for all future steps.
2. Generate an SSH key (See this [link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)).
   * When asked where to create the private key, create it as `/my_autograder/deploy_key` - if you place the key in the wrong spot and move it later, you may need to use `chmod 600` to fix read/write permissions.
3. In `setup.sh`, edit `git clone git@github.com:brown-agt/lemonade_grading.git /autograder/lemonade_grading` to clone the new repository.
4. In `/my_autograder`, run `./make_autograder.sh` to generate `autograder.zip`, and upload this to Gradescope.
   * The autograder will pull from Github every time it is run. This means that `full_autograder.sh` and `tests/` can be freely edited. If other files are edited, you will likely need to re-zip and re-upload the autograder.
5. Change `test_files.py` and add other tests as necessary (Even if you are not grading the assignment via autograder, it needs to generate an output for the student).

# Managing Submissions

Whenever a student submits to the assignment, a folder will be created in `submissions`, labelled by their Gradescope ID. Inside the folder will be the contents of their submission, and a `timestamp.txt` file recording the time of submission for debugging purposes. More recent submissions by the same student will replace old submissions. 

# Notes and Known Issues

* Submissions are labelled by the Gradescope ID of one member per submitting group. If a student submits an assignment, then retroactively adds another user to the submission, a duplicate may be generated.
* If full submission history is desired, `full_autograder.sh` can be changed to append the submission timestamp to the names of the student's directory. Be careful of this generating exceedingly large numbers of files.
