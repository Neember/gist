# Rake Task: import_github_gist

This rake task allows user to import their github gists into the system.  
The task will not import the same gist twice but it only works if you did not change your gist's description on Github.
*Note that it will only import your public gists.*

Usage:
`rake import_github_gist neember_email=lucy@futureworkz.com github_username=lucyhuang`
