# Using `zaccess` to Access Zuar-hosted Systems

## Background

Zuar products process and store a significant amount of confidential customer
information on a daily basis.  This carries with it a significant responsibility --
protecting customer data from unauthorized access.  Most often, this access is
controlled by user authentication in the user interface.  However, in some situations
command-line or other programmatic access to the files and services on a customer's
instance is required.  Until now, Zuar has used SSH keys to control this access.  There
are many challenges associated with the use of individual SSH keys to control access to
computer systems.  To address these problems and to better secure customer systems, Zuar
is transitioning to an internally developed tool called `zaccess`.  This note describes
how to use `zaccess` in situations where one previously used `ssh` and SSH keys.

### Installing

First you must install the vault CLI: https://www.vaultproject.io/docs/install. Select the precompiled binary for your OS. In Linux, open a terminal and test the install with this command:
```
vault version
```
You should see something like this:
```
Vault v1.10.0 (7738ec5d0d6f5bf94a809ee0f6ff0142cfa525a6)
```
For Windows, the same command can be run at a command prompt. You will see something very similar.
```
C:\Users\Username>c:\Users\Username\Downloads\vault_1.10.3_windows_amd64\vault.exe version
```
You should see something like this:
```
Vault v1.10.0 (7738ec5d0d6f5bf94a809ee0f6ff0142cfa525a6)
```
**Where do they get zaccess.py from***

## Setting up

DevOps will create a vault user and password for you and grant you access to the appropriate infrastrure for you. They will create a policy which defines what you are allowed to access. They will also install key files on your system in your homedir/.ssh. The key called `vault` will be the VAULT_KEY below.

To make things easier, you should set up environmental variables. In Linux this is done by adding the following to your .bashrc file:
```
VAULT_ADDR=https://vault.zuarbase.net:8200
VAULT_USER=<username> # this is an example. sub your vault username
VAULT_KEY=/full/path/to/.ssh/vault
VAULT_PASSWORD=foo # avoid password prompts
```
In Windows, open the Systems Properties window and click the Environment Variables button.
Create the following Variables with their respective values:
```
VAULT_ADDR: "https://vault.zuarbase.net:8200"
VAULT_USER: <username> # this is an example. sub your vault username
VAULT_KEY: "C:\Users\<username>\.ssh/vault" 
VAULT_PASSWORD: foo # avoid password prompts
```

### Logging In

In order to use zaccess, you will have to log into vault. After *time* you will have to login again. You won't need to relogin unless your vault login times out. 
To login on Linux or Mac you will use the following commands:
```
export VAULT_USER=<username> # substitute your vault username here
vault login -method=userpass username=$VAULT_USER
```
To login to Windows, you will ...
**Need to fill in here** 

## Using `zaccess`

Once setup, zaccess is really pretty simple to use. You only need to use a variation of
the following command to access a system that you are authorized to access:
```
$ zaccess [OPTIONS] HOSTNAME [PASSWORD]
```
  
## Examples

1. This is how you "ssh" to stage.zuarbase.net using zaccess:
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
You will be prompted for your vault password. Once the password is entered, if you have
not already chosen a policy, you will be prompted to select one. If you don't see a
policy for the instance you are logging into, please ask devops to add you to the
instance's vault group. You will not have to select a policy for 24 hours after successfully 
logging in with zaccess.

2. Using `zaccess` with `scp`
```
$ scp $(zaccess -i stage.zuarbase.net) README.md ubuntu@stage.zuarbase.net:
README.md                                                                          100%    0     0.0KB/s   00:00    
```

3. Using `zaccess` with `sftp`
```
$ sftp $(zaccess -i stage.zuarbase.net) ubuntu@stage.zuarbase.net:
Connected to stage.zuarbase.net.
Changing to: /home/ubuntu/.
sftp> 
```
  
## Other

* If you forget your password, please put in a Jira Ticket for DevOps to reset it. After
  they do, you will need to do this:
  ```
  $ vault login -method=<newpass> username=$VAULT_USER
  ```

  Then reset your password to something you select by using this command:
  ```
  $ vault write auth/userpass/users/$VAULT_USER password="<newpass>"
  ```

* If you want to reset your password and still know your old one, you will need to do this:
```
vault write auth/userpass/users/$VAULT_USER password="newpass"

alternatively, login to vault and run the script ./change_pass.sh change_pass.sh will ensure the password is secure and will keep the password out of your bash history
```
## Technical Details

```

	Zaccess is built on Zuar's instance of something called Vault
	(https://www.vaultproject.io/docs/what-is-vault). Vault is an identity-based secrets and
	encryption and management system. This means that vault takes care of the validation
	(proving who you are) and authorization (determining what you can access) of users
	before providing them access. Zaccess will use the zuar vault instance to sign ssh keys.
