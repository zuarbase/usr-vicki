# Using `zaccess` to Access Zuar-hosted Systems

## Introduction

Zuar products process and store a significant amount of confidential customer
information on a daily basis.  This carries with it a significant responsibility
to protect customer data from unauthorized access.  Most often, this access is
controlled by user authentication in the user interface.  However, in some
situations command-line or other programmatic access to the files and services
on a customer's instance is required.  Until now, Zuar has used SSH keys to
control this access.  There are many challenges associated with the use of
individual SSH keys to control access to computer systems.  To address these
problems and to better secure customer systems, Zuar is transitioning to an
internally developed tool called `zaccess`.  This note describes how to use
`zaccess` in situations where one previously used `ssh` and SSH keys. 

`zaccess` facilitates command line access to systems for which you have been
authorized.  It works with Windows, Linux, and Mac architectures and can be
used in place of the SSH, SCP, and SFTP commands.  `zaccess` requires you to
login again after a 24 hour period has elapsed from your successful `zaccess` to
a system. When you use `zaccess` you will see how much time you have remaining
below your login:

```
stage.zuarbase.net.cert is younger than 24 hours
cert is valid for 23.99 hours
```
The use of the "-i" flag with scp and sftp disables the display of this countdown.

`zaccess` is only used to control access to Zuar-hosted instances.  Access to
customer-hosted on-prem systems will continue to be managed as it is now.

## Access Control

`zaccess` differs from the current access system in that each user is
individually given access to one or more systems.  For example, Steve may
initially need access to `stage.zuarbase.net` and `intradiem.zuarbase.net`.  To
use `zaccess`, Steve should put in a Jira ticket to notify DevOps that he
requires this access.  DevOps will use Hashicorp's Vault software to generate a
temporary SSL certificate for Steve and will add him to the appropriate Group in
Vault.  Steve's Group in Vault is linked to a Policy that allows him to sign the
certificate for `stage.zuarbase.net` and `intradiem.zuarbase.net`; it will not
be possible for Steve to access other instances.  To resolve Steve's Jira
ticket, DevOps will provide a username and password for Steve to use with
`zaccess`.

If Steve later needs to access `khe.zuarbase.net`, he must initiate another Jira
ticket to request that DevOps add the system to the list of systems he's
authorized to access. 

## Preparing to Use `zaccess`

Before using `zaccess`, Steve must first:

1. Create a `ssh` keypair for use by `zaccess`
1. Install `vault`
1. Install `zaccess`
1. Be issued a username and password
1. Configure his environment
1. Test that `zaccess` is working
	
Each of these steps are described in the following sections.

### Create a `ssh` Keypair

Vault requires a ssh keypair.  It is a good practice to create a new keypair
with a name other than the default "id_rsa" and "id_rsa.pub" so that you don't
overwrite any keys that already exist. The keypair can be named something like
`vault` and `vault.pub` as in the example below.

=== "macOS & Linux"

    If Steve wishes to create an ssh key pair, he should open a terminal and
    type the `ssh-keygen` command.  He will be prompted to enter a filename for
    the new key; this example uses the name `vault`. If Steve selects the
    default, he will overwrite any existing key with that name.  Once he enters
    a filepath or hits enter, he will also be prompted for a passphrase and
    asked to confirm it.  `zaccess` does not currently support keys with
    passphrases, so he can just hit enter to leave it blank at both prompts.
    `zaccess` requires a password of its own, so it is safe to use an empty
    passphrase.  If Steve sees the key fingerprint and randomart image, his key
    was successfully created.


	```
	(.pyenv) steve@hostname.com:~$ ssh-keygen
	Generating public/private rsa key pair.
   	Enter file in which to save the key (/home/steve/.ssh/id_rsa):
    /home/steve/.ssh/vault
   	Enter passphrase (empty for no passphrase):
   	Enter same passphrase again:
   	Your identification has been saved in /home/steve/.ssh/vault
   	Your public key has been saved in /home/steve/.ssh/vault.pub
   	The key fingerprint is:
   	SHA256:as9DGMZZTNHwQpo+hCWfrGOqE6cTvcvcu8XHELMxq20 steve@hostname.com
   	The key's randomart image is:
   	+---[RSA 3072]----+
   	|    . .o=+       |
   	|     * =o..      |
   	|    ..%o. .      |
   	|     +=B .       |
   	| .  +.*oS        |
   	|o oo =.=.        |
   	| =... E.o        |
   	|++.. + +.        |
   	|.o+.+o  o.       |
   	+----[SHA256]-----+
    ```

    SSH keys cannot be group or others accessible, so the private key will need
    to be rw only for Steve (0600).  Failure to do this will generate an error
    when he uses the key and cause his connection to fail.  Steve can check the
    permissions on the key with this command:

    ```
    $ ls -l /home/steve/.ssh/vault
    -rw-rw-r-- 1 steve steve 0 Jun 24 14:10 .ssh/vault
    ```
    If, as in the above example, Steve's key has permissions other than -rw-------
    (0600), he should issue the following `chmod` command to correct that and
    then verify it by re-issuing the command above:
    ```
    $ chmod 0600 .ssh/vault
    $ ls -l /home/steve/.ssh/vault
    -rw------- 1 steve steve 0 Jun 24 14:10 .ssh/vault
    ```
    
=== "Windows"

    If Steve wishes to create a key pair, he should open a Command Prompt as
    System Administrator, by following these steps:

    ```
	1. Press the Windows key.
	1. Type `cmd`.
	1. Under Best Match, right-click Command Prompt.
	1. Click Run as Administrator.
    1. If prompted, click Yes to allow the ap to make changes to your device.
    1. At the resulting command prompt, run the `ssh-keygen` command.
    ```
    
    Steve will be prompted to enter a filename for the new key; this example
    uses the name `vault`. If he selects the default, he will overwrite any
    existing key with that name, so he should be careful.

    ![SSH Keygen filename](../images/ssh-keygen1.png "SSH keygen filename prompt")

    Steve will also be prompted for a passphrase and asked to confirm it.
    `zaccess` does not currently support keys with passphrases, so he should
    just hit enter to leave it blank at both prompts.  `zaccess` does require a
    password of its own, so it is safe to use an empty passphrase.  

    ![SSH Keygen passphrase](../images/ssh-keygen2.png "SSH
    passphrase prompt")

    Steve will see the key fingerprint and randomart image if his key pair was
    successfully created.

    ![SSH Keygen randomart](../images/ssh-keygen3.png "SSH Keygen randomart")
    
    SSH keys cannot be group or others accessible, so Steve's private key will
    need to only be rw for him.  Failure to do this will generate an error when
    he uses the key and cause his connection to fail.  He can check the
    permissions on the key by the following steps:

    ```
    1. Locate the file in Windows Explorer.
    2. Right click on the file and select "Properties".
    3. Navigate to the "Security" tab and click "Advanced".
    4. Change the owner to user.
    5. Disable inheritance.
    6. Grant the user "Full control"
    7. Save the permissions.
    ```

### Install Vault

A pre-requisite for using `zaccess` is installing Vault.  Download an executable
for your operating system and architecture
[here](https://www.vaultproject.io/docs/install).

=== "macOS & Linux"

     These instructions assume that the executable was downloaded to
     `~/Downloads/vault`.  Steve should adjust as necessary for his situation.
     
     1. **macOS only**: SIP quarantine attribute must be removed from the vault
        executable:
     
         ```
        $ xattr -d com.apple.quarantine ~/Downloads/vault
     	```
     
     1. The executable should be placed in a directory that is located in
        Steve's search path for commands.  For example, if `~/bin` is in his
        PATH:
     
        ```
        $ cp ~/Downloads/vault ~/bin
        ```
     
     1. Confirm that the `vault` executable can be found and is working properly:
        ```
        $ vault version
        Vault v1.10.0 (7738ec5d0d6f5bf94a809ee0f6ff0142cfa525a6)
        ```
     Your version number and hash may differ, but the version number should be at
     least 1.10.0.

=== "Windows"

     These instructions assume that the executable was downloaded to
     `~\Downloads\vault`.  Steve should adjust as necessary for his situation.
     
    1. Press the Windows key
    1. Type PowerShell
    1. Select Windows PowerShell ISE (do not runas administrator)
    1. Type the following commands at the prompt

    ```
	irm get.scoop.sh | iex
	scoop install vault
	vault
	```

    If Steve gets an error about his Execution Policy, he should: 
    
    1. Open a different PowerShell window as administrator
    1. Change his Execution Policy to `bypass` with this command:

	```
	Set-ExecutionPolicy -ExecutionPolicy bypass
	```

    Steve can confirm that the `vault` executable can be found and is working
    properly using the following command: 

    ``` 
    $ vault.exe version 
    ```
    You should see something like this: 
    ``` 
    Vault v1.10.0 (7738ec5d0d6f5bf94a809ee0f6ff0142cfa525a6) 
    ```

    The version number and hash may differ, but the version number should be at
    least 1.10.0.


### Install `zaccess`

=== "macOS & Linux"

    The `zaccess` script must of course be installed. Follow the instructions
    for downloading and installing `zaccess` here. [TBD] These instructions
    assume that the executable was downloaded to Steve's
    `~/Downloads/devops-zaccess` directory.  He should adjust as necessary for
    his situation.  The `zaccess` executable should be placed in a directory
    that is located in Steve's search path for commands.  For example, if
    `~/bin` is in his PATH:

    ```
    $ cp ~/Downloads/devops-zaccess/zaccess ~/bin
    ```

=== "Windows"

    Follow the instructions for downloading and installing `zaccess` here. [TBD]
    These instructions assume that the executable was downloaded to Steve's
    `~\Downloads\devops-zaccess`.  He should adjust as necessary for his
    situation.

### Configure Your Environment

To make using `zaccess` as convenient as possible, it is best to put a number
of variables and values in your execution environment.  How this is done
depends upon Steve's operating system.

=== "macOS & Linux"

    In macOS and Linux, he should add the following environment variables to his
    `.bashrc`, `.bash_profile`, or whatever shell initialization file is
    appropriate:

    ```
	export VAULT_ADDR="https://vault.zuarbase.net:8200"
	export VAULT_USER=steve
	export VAULT_KEY=/home/steve/.ssh/vault
	export VAULT_PASSWORD=<your-password>
	```
    If he doesn't have an existing `zaccess` environment, he only needs the first
    three variables.

    You will also want to add the path to `zaccess` to your System PATH variable
    to allow you to call it without specifying the full path.  To do this, in
    the file Steve added the environmental variables above, he should add the
    following:
    ```
    export PATH=/home/steve/Downloads/devops-zaccess/:$PATH

    ```
=== "Windows"

    1. Click the Start button
    2. Use the search bar to search for Environmental Variables
    3. In the System Properties window, click "Environment Variables"
    4. Click New to add each of the variables below with their respective values:

	```
	VAULT_ADDR: "https://vault.zuarbase.net:8200"
	VAULT_USER: steve 
	VAULT_KEY: "C:\Users\steve\.ssh/vault" 
	VAULT_PASSWORD: <your-password>
	```
    If Steve doesn't have an existing `zaccess` environment, he only needs the first
    three variables.

    
    You will also want to add the path to `zaccess` to your Windows PATH
    variable to allow you to call it without specifying the full path.  To do
    this, follow these steps: 

    1. Click the Start button
    2. Use the search bar to search for Environmental Variables
    3. In the System Properties window, click "Environment Variables"
    4. Click "Path" in the System variables window.
    3. Click the Edit button.
    4. Click New
    5. Type the following:
    ```
       C:\Users\steve\Downloads\devops-zaccess\ 
    ```
    6. Click OK

    Alternatively, steve can copy zaccess.exe to a directory that is already in
    his path.

    ```
    $ cp ~\Downloads\devops-zaccess\zaccess ~\bin
    ```

### Test `zaccess`

=== "macOS & Linux"

    Confirm that the `zaccess` executable can be found and is working properly: 
    ``` 
    $ zaccess --version 
    ```
    Steve should see something like this: 
    ``` 
    zaccess v0.1.2
    ```

=== "Windows"

    Confirm that the `zaccess` executable can be found and is working properly: 
    ``` 
    $ zaccess.exe --version 
    ```
    Steve should see something like this: 
    ``` 
    zaccess v0.1.2
    ```

    ## Using `zaccess`

Once setup, `zaccess` is really pretty simple to use.  In its simplest form, it
only requires a hostname. The following examples show how to use `zaccess` in
common situations:

=== "macOS & Linux"

    1. Steve can use `zaccess` to gain Command Line access to a system just like
       he would with `ssh`. Using `zaccess`, he can access stage.zuarbase.net
       with this command:

    ```
	$ zaccess stage.zuarbase.net
	Password (will be hidden):
	ubuntu@stage-mitto:~$ 

    ```
     You will be prompted for your vault password. Once the password is entered,
     you will see a command prompt if you are authorized for the system. If you
     are not authorized, you will be prompted to select a policy as in the
     example below.  If you don't see a policy for your Vault Role (your
     username) or for the instance you are logging into, you will have to
     request that you be added to the instance's vault group. 

    ```
	$ zaccess stage.zuarbase.net
	Password (will be hidden):
	[?] please choose a policy for the hostname stage.zuarbase.net: stage-policy
	   andy-klier-policy
	   aziz-policy
	   dev-policy
	   khe-policy
	   mitto-2-10-0-policy
	 > stage-policy
	ubuntu@stage-mitto:~$ 

    ```
    
    1. You can copy a file to another system using `zaccess` just like you would
       with `scp` using the following example. This example copies the README.md
       file from you local directory to the ubuntu user's home directory on
       stage.zuarbase.net.

    ```
    $ scp $(zaccess -i stage.zuarbase.net) README.md ubuntu@stage.zuarbase.net:
    README.md                                                                100%    0     0.0KB/s   00:00    
    ```
    1. You can also use `zaccess` to sftp to a system.  To gain sftp access to
       stage.zuarbase.net as the ubuntu user, use the following command: 
    ```
    $ sftp $(zaccess -i stage.zuarbase.net) ubuntu@stage.zuarbase.net:
    Connected to stage.zuarbase.net.
    Changing to: /home/ubuntu/.
    sftp> 
    ```
=== "Windows"

    1. Execute the appropriate zaccess command as shown below.
    
    A. Using `zaccess` with `ssh`:
    ```
    $ zaccess.exe stage.zuarbase.net
    ```
    B. Using `zaccess` with `scp`:
    ```
    $ scp $(zaccess.exe -i stage.zuarbase.net) README.md ubuntu@stage.zuarbase.net:
    ```
    C. Using `zaccess` with `sftp`:
    ```
    $ sftp $(zaccess.exe -i stage.zuarbase.net) ubuntu@stage.zuarbase.net:
    ```

## How to Reset Your Password

If you want to reset your password and still know your old one, you will need to
do this: 

``` 
$ vault write auth/userpass/users/$VAULT_USER password="newpass"
```
