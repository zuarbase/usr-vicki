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

!!! Note

	Let's move the discussion of drawbacks/problems to a section at the end of the
	document.  Provide a footnote or link above to link to the section.

	connection to these systems (to prove that you are supposed to be able to connect). Using
	SSH keys requires the user who is initiating the connection to have the needed SSH keys
	in the form of PEM files and to know which user to log on as. SSH keys are difficult to
	maintain since many users are using the same keys. If a key is replaced, all users must
	be notified and given the new key.

	SSH key management requires that the keys be securely stored. Since they are given out
	to several users and possibly by those users to others, SSH key management can not
	guarantee that they are securely stored. Additionally, the keys must be replaced
	periodically (key rolling), and this is both time-consuming and dependent upon knowing
	who has access to these keys. Because of these difficulties, Zuar is moving from using
	SSH keys to using something called zaccess.

!!! Note

	Let's move this to a section name "Technical Details" or something like that.  Also:
    * maybe less info about vault itself
	* describe the the key that zaccess creates, where it is located, and how to use it directly

	## What

	Zaccess is built on Zuar's instance of something called Vault
	(https://www.vaultproject.io/docs/what-is-vault). Vault is an identity-based secrets and
	encryption and management system. This means that vault takes care of the validation
	(proving who you are) and authorization (determining what you can access) of users
	before providing them access. Zaccess will use the zuar vault instance to sign ssh keys
	given a hostname, a vault username, and a private key.


## Using `zaccess`

### Getting `zaccess`

Describe where to get it, how to install it, and how to get it in your path.  Do this
for both Linux/macos and Windows

### Logging In

* must log in first
* how long is login valid for
* must login for each host?

### Using `zacess`

Most of the setup will be done by the DevOps team on your behalf. You will have to have
these environment variables set:
```
VAULT_ADDR=https://vault.zuarbase.net:8200
VAULT_USER=<USERNAME>
VAULT_KEY=/full/path/to/.ssh/privkey
VAULT_PASSWORD=<PASSWORD> # avoid password prompts by substituting your vault password
```

!!! Note

    Rather than "just ask", provide examples for both systems.  Test all examples.

    Environmental Variables are done differently on different Operating System, so if you don't know, just ask.
 
Once setup, zaccess is really pretty simple to use. You only need to use a variation of
the following command to access a system that you are authorized to access:
```
$ zaccess [OPTIONS] HOSTNAME [PASSWORD]
```
  
!!! Note

    * needs actual examples of logging in
	* let's also show examples of command completion
    * let's just use `stage.zuarbase.net` instead of a fake system
	* people should be able to cut/paste examples

## Examples

1. This is how you "ssh" to a system called my-mitto.zuarbase.net using zaccess:
```
$ zaccess my-mitto.zuarbase.net
```
  
You will be prompted for your vault password. Once the password is entered, if you have
not already chosen a policy, you will be prompted to select one. If you don't see a
policy for the instance you are logging into, please ask devops to add you to the
instance's vault group.

!!! Note

    * what's a policy?  why do i care?
	* should we just call them hosts instead of policies?


2. Using `zaccess` with `scp`
```
$ scp $(zaccess -i my-mitto.zuarbase.net) README.md ubuntu@my-mitto.zuarbase.net:
```

3. Using `zaccss` with `sftp`
```
$ sftp my-mitto.zuarbase.net
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
