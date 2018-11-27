git rebase
===

This wiki is useful when you are working on a branch that depends on a branch under review submitted for pull request.

Related links
===

guy with same question on a forum, got nice reply (search it with: "Hold on, skip merging")
https://softwareengineering.stackexchange.com/questions/351727/working-on-a-branch-with-a-dependence-on-another-branch-that-is-being-reviewed

nice youtube video that helps to understand what is a rebase
https://www.youtube.com/watch?v=dO9BtPDIHJ8

nice bitbucket tutorial about what is a rebase (text) :
https://www.atlassian.com/git/tutorials/merging-vs-rebasing

to understand bettre the --onto flag of the rebase :
https://content.pivotal.io/blog/git-rebase-onto

Scenario
===

Summary: keep working even if your PR is under review.

- you worked on feature_a branch, committed, pushed and made a pull request
- you are now waiting for feature_a branch to get merged by admin
- you are now working on feature_b but it depends on changes of feature_a

what to do? : use git rebase
===

branches:

        master
        feature_a
        feature_b

assuming you are on master branch:

        git checkout -b feature_b # create new branch from master with name feature_b
        git rebase feature_a # "merge" changes from feature_a into feature_b branch but without creating a merge commit
        git pull origin feature_a --rebase # alternative command to the one used above, does the same thing

work on feature_b branch, commit as usual

wait until feature_a gets merged into master by admin, then once feature_a is merged do:

        git checkout master # change to master branch
        git pull origin master # update master branch
        git checkout feature_b # change to feature_b branch
        git rebase --onto master feature_a feature_b # insert merge commit (created by the acceptance of the PR into master) into commit history of feature_b
        git push my_remote feature_b

make pull request of feature_b into master

clean local and remote repos

        git push my_remote --delete feature_a # delete remote branch feature_a
        git push my_remote --delete feature_b # delete remote branch feature_b
        git branch -D feature_a # delete local branch feature_a
        git branch -D feature_b # delete local branch feature_b

Done! you know were just able to work on branch feature_b but didn't have to wait until feature_a changes were
merged by repo admin, while at the same time you kept commit history clean (without unwanted merge commits).
