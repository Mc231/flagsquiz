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
### android test_track
```
fastlane android test_track
```
Deploy a new version to GooglyPlay,  available tracks 'production, beta, alpha, internal'
### android add_changelog_to_metadata
```
fastlane android add_changelog_to_metadata
```
Adds changelog to metadata to upload it to play console
### android get_version_code
```
fastlane android get_version_code
```
Get version code of project

----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
