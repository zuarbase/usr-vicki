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

Before using `zaccess`, one must first:

1. Create a `ssh` keypair for use by `zaccess`
1. Install `vault`
1. Install `zaccess`
1. Get your username and password
1. Configure your environment
1. Test that `zaccess` is working
	
Each of these steps are described in the following sections.

### Create a `ssh` Keypair

Vault requires a ssh keypair.  It is a good practice to create a new keypair
with a name other than the default "id_rsa" and "id_rsa.pub" so that you don't
overwrite any keys that already exist. You can name your keypair something like
`vault` and `vault.pub` as in the example below. Just open a terminal and type
the folowing command:

=== "macOS & Linux"

	```
	(.pyenv) user@hostname.com:~$ ssh-keygen
	Generating public/private rsa key pair.
   	Enter file in which to save the key (/home/user/.ssh/vault):
   	Enter passphrase (empty for no passphrase):
   	Enter same passphrase again:
   	Your identification has been saved in /home/user/.ssh/vault
   	Your public key has been saved in /home/user/.ssh/vault.pub
   	The key fingerprint is:
   	SHA256:as9DGMZZTNHwQpo+hCWfrGOqE6cTvcvcu8XHELMxq20 user@hostname.com
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
    
    Your private key will need to be rw only for the user who owns the file
    (0600). Failure to do this will generate an error when you use the key.
    
=== "Windows"

	1. Press the Windows key.
	2. Type cmd.
	3. Under Best Match, right-click Command Prompt.
	4. Click Run as Administrator.
	5. At the command prompt, run the following command:

	```
	$ ssh-keygen
	Generating public/private rsa key pair.
	Enter file in which to save the key (/c/Users/Administrator/.ssh/vault):
	Enter passphrase (empty for no passphrase):
	Enter same passphrase again:
	Your identification has been saved in /c/Users/Administrator/.ssh/vault 
	Your public key has been saved in /c/Users/Administrator/.ssh/vault.pub
	The key fingerprint is:
	SHA256:as9DGMZZTNHwQpo+hCWfrGOqE6cTvcvcu8XHELMxq20 Administrator@hostname.com
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

### Install Vault

A pre-requisite for using `zaccess` is installing Vault.  Download an executable
for your operating system and architecture
[here](https://www.vaultproject.io/docs/install).

=== "macOS & Linux"

     These instructions assume that the executable was downloaded to
     `~/Downloads/vault`.  Adjust as necessary for your situation.
     
     1. **macOS only**: you must remove the SIP quarantine attribute from the vault
        executable:
     
         ```
        $ xattr -d com.apple.quarantine ~/Downloads/vault
     	```
     
     1. Place the executable in a directory that is located in your search path for
        commands.  For example, if `~/bin` is in your PATH:
     
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

    For Windows, the following commands must be run in PowerShell by a non-root user:
    ```
	irm get.scoop.sh | iex
	scoop install vault
	vault
	```

    If you get an error about your Execution Policy, open a different PowerShell
    window as administrator to change your Execution Policy to `bypass` with
    this command:

	```
	Set-ExecutionPolicy -ExecutionPolicy bypass
	```

    Confirm that the `vault` executable can be found and is working properly: 

    ``` 
    C:\Users\<USERNAME>.\Downloads\vault_1.10.3_windows_amd64\vault.exe version 
    ```
    You should see something like this: 
    ``` 
    Vault v1.10.0 (7738ec5d0d6f5bf94a809ee0f6ff0142cfa525a6) 
    ```

    Your version number and hash may differ, but the version number should be at
    least 1.10.0.


### Install `zaccess`

=== "macOS & Linux"

    Download `zaccess` from [TBD]
    [Install examples to be inserted]

=== "Windows"

    Download `zaccess` from [TBD]
    [Install examples to be inserted]

### Configure Your Environment

    To make using `zaccess` as convenient as possible, it is best to put a
    number of variables and values in your execution environment.  How this is
    done depends upon your operating system.

=== "macOS & Linux"

    In macOS and Linux, add the following environment variables to your
    `.bashrc`, `.bash_profile`, or whatever shell initialization file is
    appropriate:

    ```
	export VAULT_ADDR="https://vault.zuarbase.net:8200"
	export VAULT_USER=<your-username>
	export VAULT_KEY=/full/path/to/.ssh/vault
	export VAULT_PASSWORD=<your-password>
	```

    If you are starting from scratch and don't have an existing `zaccess`
    environment, you only need the first three variables.

=== "Windows"

    In Windows, open the Systems Properties window and click the Environment
    Variables button.

	Create the following Variables with their respective values:
	```
	VAULT_ADDR: "https://vault.zuarbase.net:8200"
	VAULT_USER: <your-username>
	VAULT_KEY: "C:\Users\<username>\.ssh/vault" 
	VAULT_PASSWORD: <your-password>
	```

    If you are starting from scratch and don't have an existing `zaccess`
    environment, you only need the first three variables.

    You will also want to add the path to `zaccess` to your Windows PATH
    variable.  To do this, follow these steps: 

    ```
    1. In Windows, open the Systems Properties window and click the Environment
    Variables button.
    2. Click "Path"
    3. Click the Edit button.
    4. Click New
    5. Type the following:
        \path\to\zaccess\directory
    6. Click OK
    ```

    Alternatively you can copy zaccess.exe to a directory that is already in
    your path.

### Test `zaccess`

=== "macOS & Linux"

    Confirm that the `zaccess` executable can be found and is working properly: 
    ``` 
    $ zaccess --version 
    ```
    You should see something like this: 
    ``` 
    zaccess v0.1.2
    ```

=== "Windows"

    Confirm that the `zaccess` executable can be found and is working properly: 
    ``` 
    $ zaccess.exe --version 
    ```
    You should see something like this: 
    ``` 
    zaccess v0.1.2
    ```

    ## Using `zaccess`

Once setup, zaccess is really pretty simple to use. You only need to use a
variation of the following command to access a system that you are authorized to
access:

``` 
$ zaccess [OPTIONS] HOSTNAME [PASSWORD] 
```
  
=== "macOS & Linux"

    1. Using `zaccess` with `ssh`:

    ```
	$ ./zaccess stage.zuarbase.net
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
    You will be prompted for your vault password. Once the password is
    entered, if you have not already chosen a policy, you will be prompted to
    select one.  If you don't see a policy for your Vault Role (your user-name)
    or for the instance you are logging into, please ask devops to add you to
    the instance's vault group.  Policies named for the Vault Role (usually the
    user's name) instead of a specific system to facilitate combining multiple
    systems in to one policy. 

    2. Using `zaccess` with `scp`
    ```
    $ scp $(zaccess -i stage.zuarbase.net) README.md ubuntu@stage.zuarbase.net:
    README.md                                                                              100%    0     0.0KB/s   00:00    
    ```
    3. Using `zaccess` with `sftp`
    ```
    $ sftp $(zaccess -i stage.zuarbase.net) ubuntu@stage.zuarbase.net:
    Connected to stage.zuarbase.net.
    Changing to: /home/ubuntu/.
    sftp> 
    ```
=== "Windows"
    ```
    1. Change directory into the cloned directory.
    1. Change directory into bin\windows10 or bin\windows11 as appropriate.
    1. Execute the appropriate zaccess command as shown below.
    ```
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

If you forget your `zaccess` password, please put in a Jira Ticket for DevOps to
reset it. After they do, you will need to do this:

```
$ vault login -method=<newpass> username=$VAULT_USER
```
Reset your password to something you select by using this command:

```
$ vault write auth/userpass/users/$VAULT_USER password="<newpass>"
```

If you want to reset your password and still know your old one, you will need to
do this: 

``` 
$ vault write auth/userpass/users/$VAULT_USER password="newpass"
```

Alternatively, login to vault and run the script ./change_pass.sh change_pass.sh
will ensure the password is secure and will keep the password out of your bash
history.

## Technical Details

Vault requires you to login again after a 24 hour period has elapsed from you
successful `zaccess` to a system. When you use `zaccess` you will see how much
time you have remaining below your login:

```
stage.zuarbase.net.cert is younger than 24 hours
cert is valid for 23.99 hours
```
