Pulling Docker images from Zuar's AWS ECR ===

The URL for Zuar=E2=80=99s repository is: \`575296055612.dkr= .ecr.us-east-1.amazonaws.com\`. To pull images from the repository: 1\\. Install the AWS CLI (\[https://docs.aws.amazon.com/cli/lates= t/userguide/cli-chap-install.html\](3D"https://docs.aws.amazon.com/cli/=) ) 2\\. Install the \`ecr-credential-helper\` (\[https://github.com/awslabs= /amazon-ecr-credential-helper\](3D"https:=) ) 3\\. Update your \`~/.docker/config.json\` by adding the helper = to the config. (\[https://github.com/awslabs/amazon-ecr-credential-helper#do= cker\](3D"https://github.com/awslabs/amazon-ecr-credent=) ) The following should appear in your \`config.json\`:= \`"credsStore": "ecr-login"\`. 4\\. Add the following to your \`~/.aws/credentials\` file (cred= s are valid as of 2022-01-13):

\=20

\# User w=
    ith read-only access to ECR
    \[zuar-ecr\]
    aws\_access\_key\_id =3D AKIAYL4SRFE6NGBRHEGG=20
    aws\_secret\_access\_key =3D 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
    region =3D us-east-1

\=20

5\\. Tell \`aws\` to use the above credentials:

\=20

export A=
    WS\_PROFILE=3Dzuar-ecr

\=20

6\\. Get a temporary =E2=80=9Cpassword=E2=80=9D from AWS and use it to au= thenticate with ECR. 1\\. If you are in the \`mitto\` repo, run \`make docker\_log= in\`. 2\\. For other scenarios, you can run the following command to login (whi= ch is what \`make docker\_login\` does):

\=20

aws ecr =
        get-login-password \\
            | docker login --username AWS --password-stdin 575296055612.dkr.ecr.us-=
        east-1.amazonaws.com

\=20

Once this is done, dockerfiles containing references to image in the rep= o should be pulled automatically. For example (taken from \`mitto/zwaf.= Dockerfile\`):

\=20

FROM 575=
296055612.dkr.ecr.us-east-1.amazonaws.com/devops/zwaf:2.0.2-de694e AS produ=
ction

\=20