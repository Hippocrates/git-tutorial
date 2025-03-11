# This readme has been taken over by kyle >:)

In order to ensure everyone has a basic understanding of how to work with git, please read through the following (if you are already familiar with git, have a github account, and have used Git LFS, then you can _probably_ skip to `Clone the repository`, but only if you are _sure_ you have everything in place).

# Install Git

First we must install git on your local machine.
1. Navigate to https://git-scm.com/downloads
2. Download the installer for your operating system
3. Run it, and go through the installer. The default option is fine for everything, except:
    1. When it says "Choose the Default behavior of git pull", select "Rebase" ![Use Rebase pull behavior](GitSetupRebase.png)
4. Make sure it works:
    1. `Win+R -> cmd`, hit `OK`
    2. Type `git -v` and verify that it gives you something like `git version 2.48.1.windows.1`
    3. Close this window

# Install Git LFS

1. Navigate to https://git-lfs.com/
2. Download the installer for your operating system
3. Run the installer, all defaults are fine
4. Make sure it works:
    1. `Win+R -> cmd`, hit `OK`
    2. Type `git lfs install --skip-repo` in the command line, and verify that it says `Git LFS initialized.`
    3 Close this window

# Install Python (optional)

If you don't have Python installed, we will want it installed. _Technically_ Unreal 5 comes with python 3 installed, so we can work around it if you have Unreal on your machine already, but Unreal _must_ be installed to the default location (`C:\Program Files\Epic Games\UE_5.4`) for these work-arounds to work.

To install Python:
1. Navigate to https://www.python.org/downloads/
2. The system should detect what operating system you are using. Click on the big button to download the installer.![the big button](DownloadPythonPage.png)
3. Double click on the downloaded file.
    1. Check the box to add Python.exe to your path.![the box to add Python.exe to your path](AddToPath.png) 
    2. _Then_ hit install (do not select custom installation).
5. Make sure it works:
    1.  `Win+R -> cmd`, hit `OK`
    2.  Type `python --version` and verify that it gives you something like `Python 3.13.2`
    3.  Close this window.

# Create a GitHub Account, and link it to the BYG organization

If you don't already, you will need to create an account on `github.com`, which is where we keep all of our git repositories. You are free to use your existing git account if you have one.

## Using a personal account
I would encourage using (or create) a general-purpose account, rather that a BYG-specific one (so choose a username you would use in any context). Having a github account with contributions to multiple different locations often acts as a 'portfolio' of sorts, which can be helpful to show people your skills in the future. However, you will want to still configure your commits _for_this_specific_repository_ to use your BYG e-mail, and also add your BYG e-mail to your github account (you can always remove it later). For now, you can set your BYG e-mail as your primary e-mail, but if you ever use it in other context, you will probably want to associate it with your personal e-mail address.

The place to configure this is at https://github.com/settings/emails

## Associating it with BYG
In order to access the repository, you will need to have your account associated with the BYG organization on github. Once you have created an account, please give the username to Logan and tell him you want to be added to the BYG github org.

## ...also send it to me
For the purpose of this exercise, we will be using a repo on my personal account so we don't need to wait around for Logan, so please also give _me_ your account name so I can add you as a collaborator so you want push changes later on.

## 2-factor Authentication
Company policy is to _always_ have 2-factor authentication enabled for any company associated account (including this one). This will mean either using an authenticator app (usually on your smartphone), or have an authentication code sent to your e-mail each time you try to log in. To set this up with GitHub:

1. Naviate to `https://github.com/settings/security`
2. Scroll down to the section `Two-factor Authentication`
3. Set up the appropriate method(s). Having more than one method is highly encouraged.
4. Make sure to also create and download the recovery codes. Typically these are something you would keep as a file on your local machine, or even print out and keep in a secure location. They are there to get you back into your account if you ever lose access to your password and/or 2FA method.

# Choosing a git client

Everything in Git can be done from the command line (in this case, if you installed it for windows, you would need to use the `Git Bash` program. But working with the command line can be unweildy if you are only doing the same 3 operations every day. If you _do_ want to learn how to use Git from the command line, let me know, but for now I'm assuming either you will be using a desktop client, or you already know how to work the command line.

Here are a few of the free options I've found that work quite well. Note that I also trialed a few paid options, and they were generally no easier to use (and in a few cases were actually quite a bit worse). If you have a preferred paid client, we can talk to Kim and see if its worth the money, but generally speaking it appears to not be the case. Regardless of which one you use, I would also recommend getting this [Git Locks Manager](https://github.com/Noxdew/git-locks-manager/releases), as it has a very nice UI for listing out which files are currently locked (NONE of the clients, including the paid ones, actually have this as a core feature, and even the ones that do generally tuck it away in a hard to find place).

## [Github desktop](https://desktop.github.com/)
This is probably the simplest option since we are using Github anyways. Its a very bare-bones application, but it handles the cases you would care about the most, and since its pretty widely used, there's a lot of help and information about it.

## [TortoiseGit](https://tortoisegit.org/)
This is a pretty funky option that actually integrates directly with Windows Explorer (some of you may have used TortoiseSVN in the past). Despite that, its actually one of the more fully-featured options available. This is the option I personally use (when I'm not just using the command line).
![Tortoise Git is weird](TortoiseGitIsBuiltDifferent.png)

## [Fork](https://fork.dev/)
This one is not free (60$ one-time license fee), but they have a pretty flexible unlimited trial, so we can at least use it to see if we like it (and git in general). Its probably the best overall desktop client I've tried as well.

Other options I looked at were:
* [RelaGit](https://rela.dev/) This honestly just seemed too similar to Github Desktop to matter
* [Git Cola](https://git-cola.github.io/) Pretty decent overall, a little more of a learning curve, and not quite as clean and easy to use as Fork
* [AnchorPoint](https://www.anchorpoint.app/) The most expensive paid option, it seems to be the preferred tool for larger game companies. However its Git integration seems to be an afterthought, as it is mostly for syncing assets on a network drive, and doesn't actually have support for LFS locking
* [GitKraken](https://www.gitkraken.com/) A pretty commonly used paid client. It was honestly no better than any of the free options in my opinion.
* [Tig](https://jonas.github.io/tig/) Kind of a joke option, it uses ncurses to make a text-mode interface to work with git repositories. Not really useful, but kind of DOS-punk?
* [SmartGit](https://www.syntevo.com/smartgit/) This is probably the most competant paid option, but its not really any better than Fork.

For the remaining instructions, I will assume you are using Github Desktop, TortoiseGit, or Fork (or the command line). The other options all have similar layouts and functionality, so it would just get redundant trying to accomodate every possible case.

# Assign your credentials

Git has two different methods for controlling access to repositories: HTTPS, and SSH. HTTPS is (generally) simpler to use, and means you will log in using your username/password from Github. It is also unfortunately the only method currently supported by the Unreal Git plugin, so we're stuck with it for now.

In most cases, the application in question will automatically prompt you for the required credentials when you are actually pulling the repository for the first time. In the case of HTTPS, it will typically propmt you to open a browser window and log in (or confirm your login if you are already logged in) to Github.

## Github desktop
By default, when you first install Git Desktop, it will instruct you to log into your Github account, and it will then use those credentials in future interaction with github.com. It seems to not have support for SSH authentication.

## Fork
Depending on whether you are using HTTPS or SSH authentication, you will need to configure them from `File -> Accounts...` or `File -> Configure SSH Keys...` respectively.

## TortoiseGit
When you first try to pull a repository, it will prompt you to enter the relevant credentials automatically.

## Command line
If you are using HTTPS, it will prompt you to log in via the website. If you are using SSH, you...probably already know what you are doing.

# Clone the repository

There should be an option to point your git client to the target URL or ssh link on GitHub, and to pull the changes down to your local machine using your git client of choice. When I refer to a "URL", I am referring to the URL listed in the dialog that appears when you click the `Code` button on Github's website, where you can select the URL based on the authentication method (they _are_ different, and chances are you are using HTTPS).
![Code Button on GitHub](GitURLs.png)

## Git Desktop

(Note that this application implicitly uses HTTPS)
1. `File -> Clone Repository`
2. Refresh the list of repositories from GitHub, and select the one you want to clone (If it does not appear, talk to Stephen)
3. Enter the local path you want to save the project to (e.g. `C:\Users\<username>\BYGProjects\`)
4. Hit `Clone` 

## Fork
1. `File -> Clone...`
2. Enter the URL of the repository you are targeting
3. Enter the local path to save it to (e.g. `C:\Users\<username>\BYGProjects\`)
4. Hit `Clone`

## TortoiseGit
1. Navigate (in a Windows Explorer window) to the directory where you want to store the repository
2. `Right Click -> Git Clone...`
3. Enter the URL to Clone
4. Hit `OK`

## Command line

Navigate to the directory you want to put the project (e.g. `C:\Users\<username>\BYGProjects\`), and run:

`> git clone https://github.com/Hippocrates/git-tutorial.git`    
or   
`> git clone git@github.com:Hippocrates/desktop-tutorial.git`   
Depending on which authentication method you are using.

# Perform the initial set-up

There are a few things we need to do to set the repository up before we can get to making changes. I've done my best to encapsulate them into one script. Double-click (or run from a command line) the file `initialize.bat` (or `initialize.sh` if you are running it from a more unix-y environment). This currently does the following:

1. Prompt you to enter your BYG e-mail (this is so that commits done _in_this_repository_only_ will be signed off with your BYG e-mail, instead of your personal one. This is just a professional nitpick thing.
2. It will set up the Git "Large File Storage" system. This is what allows Git to work with larger binary files (by default it only really works properly with plain text files, and doesn't support things like file locking.
3. It will set up the 'hooks' neccessary for our projects. For the power-users among us, they are set in the `.githooks` directory. The main thing there is a script to verify that it unlocks files once you have committed or reverted them (the script for doing this is still a WIP: there are still a few cases it doesn't handle correctly yet, but they should all be resolvable).

# Create a 'simple' commit

Edit the file `team.txt` to include your name, Github Username, and BYG e-mail on 3 consecutive lines.

## Command line
`> git pull --rebase origin main`      # Make sure you are up to date
`> git add team.txt`                   # Stage the file to be comitted
`> git commit -m "My first commit!"`   # Commit the file to the local repository
`> git push -u origin main`            # Push the changes out to the server

## Git desktop

* First, you should get yourself up to date.
    * Click the `Fetch origin` button at the top-right.
	* If there are any new commits to pull down, the button should now indicate as such, and you should click it again to "Pull" them.
* The files you edited should appear under the `Changes` column on the left. You should be able to review the edits to the file in the center view.
* When you are ready to commit, go to the lower-left of the window, and enter something in the `Summary` field (this will be the title for your commit message), and in the `Description` box (this is optional, for any additional details you want to add).
* Hit `Commit to main`
* Finally, you need to push your changes to the server. At the top of the screen, there should be a tab labeled `Push origin`, click it, and it will finalize the commit.

### If you don't fetch/pull first...

...you will see this image
![Newer commits on remote](NewerCommitsGithubDesktopMessage.png)

## TortoiseGit

* Right click -> TortoiseGit -> Pull... In the dialog, hit `OK`
* Right click -> "Git commit -> main" (on the main right-click context menu)
* Put in an appropriate commit message and make sure `team.txt` is checked in the file list
* Select `Commit ? Push` from the button drop-down at the bottom, then click it

## Fork

* Hit the `Pull` button at the top of the window (set the remote as `origin`) to see if there are any new changes
* Edit the files as per normal
* When ready to commit, go to the `Local Changes` listing (can be navigated to from the left-bar)
* Select the modified files you want to commit and `Right Click -> Stage` (or if you want to commit all modified files, `Right Click -> Stage All`
* Fill in the commit subject and description at the bottom-right (underneath the diff view), and hit `Commit` (very bottom right button)
* Finally, hit the `Push` button (top of the window again) to send them to the server

# Edit some lockable Unreal files

For now, I have only set locking enabled on UE associated files (e.g. `.uasset` and `.umap`). We can see if there's cross-talk with other files down the line and add them as needed. To test out the workflow with working with locked files in the editor:

1. Launch the project
    1. The relevant `.dll` files _should_ be good to go, so you shouldn't need to re-build
2. Edit the root scene by creating a custom bluepring actor, and placing it into the scene somewhere
3. Once you save the scene, you should see the `Check Out` dialog
    1. Note: you _might_ see it complain that you are editing files that are locked out by another user. Just ignore it, we'll be trying to submit an issue report for this.
4. Add and commit the files as usual

That's it for now, we'll figure out what else we need to do as we go.
