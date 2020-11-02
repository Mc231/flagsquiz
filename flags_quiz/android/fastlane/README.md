fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## Android
### android client_debug
```
fastlane android client_debug
```
Build debug client
### android test_track
```
fastlane android test_track
```
Deploy a new version to GooglyPlay,  available tracks 'production, beta, alpha, internal'
### android commit_version
```
fastlane android commit_version
```
Commit version bump in repository
### android push_to_remote
```
fastlane android push_to_remote
```
Push changes to remote repository

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
