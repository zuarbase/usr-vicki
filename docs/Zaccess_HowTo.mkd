#HowTo Use Zaccess

##Why:  

####A critical part of supporting customers is being able to set up and maintain the systems we host for them. Previously Zuar used a number of SSH keys to authenticate the connection to these systems(to prove that you are supposed to be able to connect). Using SSH keys requires the user who is initiating the connection to have the needed SSH keys in the form of PEM files and to know which user to log on as. SSH keys are difficult to maintain since many users are using the same keys. If a key is replaced, all users must be notified and given the new key. 

####SSH key management requires that the keys be securely stored. Since they are given out to several users and possibly by those users to others, SSH key management can not guarantee that they are securely stored. Additionally, the keys must be replaced periodically (key rolling), and this is both time-consuming and dependent upon knowing who has access to these keys. Because of these difficulties, Zuar is moving from using SSH keys to using something called zaccess.

##What:  

####Zaccess is built on Zuar's instance of something called Vault (https://www.vaultproject.io/docs/what-is-vault). Vault is an identity-based secrets and encryption and management system. This means that vault takes care of the validation (proving who you are) and authorization (determining what you can access) of users before providing them access. Zaccess will use the zuar vault instance to sign ssh keys given a hostname, a vault username, and a private key.  

##How:  

####Most of the setup will be done by the DevOps team on your behalf. You will have to have these environment variables set:

`VAULT_ADDR=https://vault.zuarbase.net:8200

VAULT_USER=<USERNAME> # this is an example. substitute your vault username
  
VAULT_KEY=/full/path/to/.ssh/privkey
  
VAULT_PASSWORD=<PASSWORD> # avoid password prompts by substituting your vault password

**Environmental Variables are done differently on different Operating System, so if you don't know, just ask.**
 
    
####Once setup, zaccess is really pretty simple to use. You only need to use a variation of the following command to access a system that you are authorized to access:

  `$ zaccess [OPTIONS] HOSTNAME [PASSWORD]`
  
##Examples:

####This is how you "ssh" to a system called my-mitto.zuarbase.net using zaccess:

  `$ zaccess my-mitto.zuarbase.net`
  
####You will be prompted for your vault password. Once the password is entered, if you have not already chosen a policy, you will be prompted to select one. If you don't see a policy for the instance you are logging into, please ask devops to add you to the instance's vault group.  

####If you need to SCP a file using zaccess:  

  `$ scp $(zaccess -i my-mitto.zuarbase.net) README.md
    ubuntu@my-mitto.zuarbase.net:`

**You can specify the location to copy the file to after the colon if you want it somewhere other than in ubuntu's home directory.  

####This is how you "SFTP" to a system called my-mitto.zuarbase.net using access:

  `$ sftp my-mitto.zuarbase.net`
  
##Recovering Forgotten Password:

####If you forget your password, please put in a Jira Ticket for DevOps to reset it. After they do, you will need to do this:

  `$ vault login -method=<newpass> username=$VAULT_USER`

####Then reset your password to something you select by using this command:

  `$ vault write auth/userpass/users/$VAULT_USER password="<newpass>"`
