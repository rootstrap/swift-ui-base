 [![Maintainability](https://api.codeclimate.com/v1/badges/a9aaea084a3759dc5596/maintainability)](https://codeclimate.com/repos/5eda90fd7beea953360073d0/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/a9aaea084a3759dc5596/test_coverage)](https://codeclimate.com/repos/5eda90fd7beea953360073d0/test_coverage)
[![License](https://img.shields.io/github/license/rootstrap/swift-ui-base.svg)](https://github.com/rootstrap/swift-ui-base/blob/master/LICENSE.md)

# SwiftUI Base Template
**SwiftUI base** is a boilerplate project created by Rootstrap for new projects using SwiftUI. The main objective is helping any new projects jump start into feature development by providing a handful of functionalities and helpers.

## Features
This template comes with:
#### Main
- Complete **API service** class to easily communicate with **REST services**.
- Examples for **account creation** and **Login**.
- Useful classes to **manage User and Session data**.
- **Secure** way to store keys of your **third party integrations**.
- Generic implementation of **navigation** between views.
- Handy **helpers** and **extensions** to make your coding experience faster and easier.

## How to use
1. Clone repo.
2. Run `./init` from the recently created folder.
3. Initialize a new git repo and add your remote url.
4. Done!

To manage user and session persistence after the original sign in/up we store that information in the native UserDefaults. The parameters that we save are due to the usage of [Devise Token Auth](https://github.com/lynndylanhurley/devise_token_auth) for authentication on the server side. Suffice to say that this can be modified to be on par with the server authentication of your choice.

## Pods

-  [Alamofire](https://github.com/Alamofire/Alamofire) for easy and elegant connection with an API.

## Optional configuration

## Code Quality Standards
In order to meet the required code quality standards,  this project runs [SwiftLint](https://github.com/realm/SwiftLint )
during the build phase and reports warnings/errors directly through XCode.
The current SwiftLint rule configuration is based on [Rootstrap's Swift style guides](https://rootstrap.github.io/swift) and is synced with
the CodeCliemate's configuration file.

**NOTE:** Make sure you have SwiftLint version 0.35.0 or greater installed to avoid known false-positives with some of the rules.

## Security recommendations
#### Third Party Keys

We strongly recommend that all private keys be added to a `.plist` file that will remain locally and not be committed to your project repo. An example file is already provided, these are the final steps to set it up:

1. Rename the `ThirdPartyKeys.example.plist` file on your project so that it is called `ThirdPartyKeys.plist`.
To add a set of keys simply add a dictionary with the name you want the key to have and add the corresponding **Debug**, **Staging** and **Release** keys as items.
2. Remove the reference of `ThirdPartyKeys.plist` from XCode but do not delete the file. This way, you will keep the file locally(it is already in the .gitignore list) in the project directory.
**Note: Do NOT move the file from the current location, the script uses the $(PROJECT_DIR) directory.**
3. Go to **Product** -> **Scheme** -> **Edit scheme**. Then select **Pre-actions** for the Build stage and make sure that the `Provided build setting` is set to your current target.
**Repeat this step for the Post-actions script.**
4. Done :)


## Automated Build and Deployment using Fastlane //TODO!

We use [Fastlane](https://docs.fastlane.tools) to automate code signing, building and deployment. 


### New Project Setup

Several steps need to be executed before building a project for the first time.

1. Install latest Xcode command line tools
```
xcode-select --install
```

2. Install latest Fastlane 
```
# Using RubyGems
sudo gem install fastlane -NV
# Alternatively using Homebrew
brew install fastlane
```

3. Create required App Ids in the Apple Developer Portal and App Store Connect 
This can be done on the Portal itself or using [fastlane produce](https://docs.fastlane.tools/actions/produce/)
```
fastlane produce -u {apple_id} --app-name {app_name} --team-id {team_id} --app-identifier {app_id} 
```
4. Create private empty repository to store signing certificates, eg. `git@github.com:rootstrap/{app_name}-certificates.git`

5. Generate Matchfile with [fastlane match](https://docs.fastlane.tools/actions/match/)
```
fastlane match init 
```
select `git` as storage mode and specify the URL of the certificates git repo

6. **optional** If the Developer account has old/invalid certificates which are not shared, it is recommended to use the `nuke` action to clear the existing certificates (*use with caution*):
```
fastlane match nuke development
fastlane match nuke distribution
```

7. **optional** If wanting to reuse existing distribution certificates, these can be imported into the certificates repository using match with the `import` action (fastlane will prompt for location of the `.cer` and `.p12` files):
```
fastlane match import \
--username {{username}} \
--git_url {{certificates_git_url}} \
--team_id {{team_id}} \
--type appstore  \
--app_identifier com.{{company}}.{{app_name}} \
```

8. Check the `fastlane/Appfile` and `fastlane/Fastfile`; set and/or validate the following values before use:
- `app_name`              # this will match with application name in App Store and target schemes in the project
- `username`              # The apple id used to manage the certificates
- `certificates_git_url`  # The repo to store and sync certs and provisioning profiles
- `team_id`               # The organization's team id 
- `itc_team_id`           # App Store Connect team id
- `devices`               # List of devices to launch simulators for running tests on


### Fastlane usage
Lanes for each deployment target are provided with some basic behavior, which can be modified as needed:

- Each target has two options: `build_x` and `release_x`.
- The `build` lane will build the application signed with an **Ad Hoc** certificate and keep the `.ipa` in the local folder for upload.
- The `release` lane will:
- Check the repo status (it has to be clean, with no pending changes)
- Increment the build number.
- Tag the new release and push it to the set branch (dev and staging push to develop and production to master by default, but it's configurable).
- Build the app signed with an **App Store** certificate
- Generate a changelog from the commit diff between this new version and the previous.
- Upload to testflight and wait until it's processed.

- Additionally, lane `test_develop` can be used by the CI job to only run the unit test against simulators (specified by `devices` variable in Fastfile)


## License

SwiftUI base is available under the MIT license. See the LICENSE file for more info.

**NOTE:** Remove the free LICENSE file for private projects or replace it with the corresponding license.

## Credits

**SwiftUI Base** is maintained by [Rootstrap](http://www.rootstrap.com) with the help of our [contributors](https://github.com/rootstrap/swift-ui-base/graphs/contributors).

[<img src="https://s3-us-west-1.amazonaws.com/rootstrap.com/img/rs.png" width="100"/>](http://www.rootstrap.com)
