# Documentation Model

## Structure

Each top-level node is a git repo.

```
--/ product / mitto / Introduction
--/ product / mitto / Installing
/ product / mitto / Installing / On-premise
/ product / mitto / Administering
/ product / mitto / Using
/ product / mitto / Using / CLI
/ product / mitto / Using / Credentials
/ product / mitto / Using / Credentials / Named Credentials
/ product / mitto / Using / Credentials / <index page with links to JSON Schema docs for each credential type>
/ product / mitto / Using / Inputters
/ product / mitto / Using / Inputters / BaseInputV2
/ product / mitto / Using / Inputters / ExampleInput
/ product / mitto / Using / Inputters / ...
/ product / mitto / Using / Steps
/ product / mitto / Using / Steps / BaseStep
/ product / mitto / Using / Steps / CreateTable
/ product / mitto / Using / Steps / ...
/ product / mitto / Using / Transforms
/ product / mitto / Using / Jobs
/ product / mitto / Using / Jobs / Export
/ product / mitto / Using / Jobs / Export / Introduction
/ product / mitto / Using / Jobs / Export / Credentials
/ product / mitto / Using / Jobs / Export / Configuration
/ product / mitto / Using / Jobs / Export / Example Configurations
/ product / mitto / Using / Jobs / Export / ...
/ product / mitto / Using / Jobs / Subscriptions / <as much as possible, mirror hierarchy as under /product/mitto/using/jobs/export>
/ product / mitto / Using / Jobs / ...
/ product / mitto / Using / Sampling
/ product / mitto / HowTo
/ product / mitto / Troubleshooting
/ product / mitto / Tips
/ product / mitto / Reference
/ product / mitto / Release Notes
/ product / mitto / Connectors
/ product / mitto / Connectors / NetSuite / <as much as possible, mirror hierarchy as under /product/mitto>
/ product / mitto / Connectors / Amazon Advertising / <as much as possible, mirror hierarchy as under /product/mitto>

/ product / rapid portal / <as much as possible, mirror hierarchy as under /product/mitto>

/ product / custom portal / <as much as possible, mirror hierarchy as under /product/mitto>

/ product / ZWAF / <as much as possible, mirror hierarchy as under /product/mitto>

/ consulting / <tbd>

/ dev / <tbd>

/ devops / <tbd>

/ what-else / <tbd>

#New Start

===

/ Zuar
=== 

/ Zuar / Background / Introduction
/ Zuar / Background / Zuar Founding
/ Zuar / Background / Zuar Org Chart
/ Zuar / Background / Zuar Support Process
/ Zuar / Background / Competitors
/ Zuar / Background / Competitors / Adaptive Insights
/ Zuar / Background / Competitors / Blendo
/ Zuar / Background / Competitors / ETLeap
/ Zuar / Background / Competitors / FiveTran
/ Zuar / Background / Competitors / FiveTran Customer Support Example
/ Zuar / Background / Competitors / Panopoly
/ Zuar / Background / Competitors / Stitchdata
/ Zuar / Background / Competitors / Stitchdata Error Email
/ Zuar / Background / Competitors / Stitchdata Row Limit Reached Email
/ Zuar / Background / Competitors / Stitchdata MongoDB
/ Zuar / Background / Competitors / Stitchdata Error log for Pipedrive Integration
/ Zuar / Background / Competitors / Stitchdata Updated Terms of Use
/ Zuar / Background / Competitors / Zwaf Prep
/ Zuar / Background / Competitors / Zwaf vs Mitto Connector Value Props
/ Zuar / Background / Competitors / Zwaf Web Data Connector
/ Zuar / Background / Competitors / Unifi
/ Zuar / Background / Competitors / DBAmp - Salesforce
/ Zuar / Tutorial / 
/ Zuar / HowTo / 
/ Zuar / Reference / 
/ Zuar / Reference / Security Questionnaire
/ Zuar / Reference / Zuar Powerpoint Template

/ product / Mitto
===

/ product / Mitto / Background

/ product / Mitto / Mitto FAQ
/ product / Mitto / Why Mitto
/ product / Mitto / Mitto Best Practices
/ product / Mitto / Mitto Components
/ product / Mitto / Mitto Databases
/ product / Mitto / Mitto Stage
/ product / Mitto / Mitto Sequences
/ product / Mitto / Mitto Concepts

/ product / Mitto / Tutorial

/ product / Mitto / Logging Into Mitto


/ product / Mitto / HowTo

/ product / Mitto / Installing Mitto
/ product / Mitto / Troubleshooting Mitto

/ product / Mitto / Jobs

/ product / Mitto / Jobs / HowTo Troubleshoot a Job
/ product / Mitto / Jobs / HowTo Add a Comment to a Job
/ product / Mitto / Jobs / HowTo Add a Data Spine
/ product / Mitto / Jobs / HowTo Add a Sequence
/ product / Mitto / Jobs / HowTo Use a Sequence
/ product / Mitto / Jobs / HowTo Troubleshoot a Sequence
/ product / Mitto / Jobs / HowTo Use CLI to Create Python Virtual Environment
/ product / Mitto / Jobs / HowTo Use a Zwaf Extract Job
/ product / Mitto / Jobs / HowTo Use a Facebook Job 
/ product / Mitto / Jobs / HowTo Use a Google Ads Job 
/ product / Mitto / Jobs / HowTo Use a Google Analytics Job 
/ product / Mitto / Jobs / HowTo Use a Google Sheets Job 
/ product / Mitto / Jobs / HowTo Use a Hubspot Job 
/ product / Mitto / Jobs / HowTo Use a Jira Job 
/ product / Mitto / Jobs / HowTo Use a LeafLogix Job 
/ product / Mitto / Jobs / HowTo Use a LinkedIn Job 
/ product / Mitto / Jobs / HowTo Use a Mavenlink Job 
/ product / Mitto / Jobs / HowTo Use a MJ Freeway Job 
/ product / Mitto / Jobs / HowTo Use a Paycom Job 
/ product / Mitto / Jobs / HowTo Use a QuickBooks Job 
/ product / Mitto / Jobs / HowTo Use a RingCentral Job 
/ product / Mitto / Jobs / HowTo Use a Salesforce Job 
/ product / Mitto / Jobs / HowTo Use a SugarCRM Job 
/ product / Mitto / Jobs / HowTo Use a Terminus Job 
/ product / Mitto / Jobs / HowTo Use a Zendesk Job 
/ product / Mitto / Jobs
  
/ product / Mitto / Jobs / CMD Job
/ product / Mitto / Jobs / CMD Job / Creating a CMD Job
/ product / Mitto / Jobs / CMD Job / Creating a CMD Job from CLI
/ product / Mitto / Jobs / CMD Job / Scheduling
/ product / Mitto / Jobs / Generic Job
/ product / Mitto / Jobs / HowTo Use a Generic Job
/ product / Mitto / Jobs / Generic Job / Scheduling
/ product / Mitto / Jobs / Generic Job / Job Types
/ product / Mitto / Jobs / Generic Job / Creating a CURL Job
/ product / Mitto / Jobs / Generic Job / Creating a Data Job
/ product / Mitto / Jobs / Generic Job / Creating an Email Job
/ product / Mitto / Jobs / Generic Job / Creating an Export Job
/ product / Mitto / Jobs / Generic Job / Creating an Extract Job
/ product / Mitto / Jobs / Generic Job / Creating an Imap Job
/ product / Mitto / Jobs / Generic Job / Creating a Subscriptions Job
/ product / Mitto / Jobs / Generic Job / Converting XSV Values to NULL 
/ product / Mitto / Jobs / SQL Job
/ product / Mitto / Jobs / SQL Job / Creating
/ product / Mitto / Jobs / HowTo Use a SQL Job
/ product / Mitto / Jobs / SQL Job / Renaming/Moving Tables in a Postgres Schema
/ product / Mitto / Jobs / SQL Job / Using a JSON File to Create a SQL Job
/ product / Mitto / Jobs / SQL Job / Scheduling
/ product / Mitto / Jobs / CSV Job
/ product / Mitto / Jobs / HowTo Use a CSV Job
/ product / Mitto / Jobs / CSV Job / Creating
/ product / Mitto / Jobs / CSV Job / Scheduling
/ product / Mitto / Jobs / imap Job
/ product / Mitto / Jobs / HowTo Use an imap Job
/ product / Mitto / Jobs / imap Job / Creating
/ product / Mitto / Jobs / imap Job / Scheduling
/ product / Mitto / Jobs / Vizql Extract Job
/ product / Mitto / Jobs / Vizql Extract Job / Creating
/ product / Mitto / Jobs / Vizql Extract Job / Scheduling
/ product / Mitto / Jobs / REST Extract Job
/ product / Mitto / Jobs / REST Extract Job / Creating
/ product / Mitto / Jobs / REST Extract Job / Scheduling
/ product / Mitto / Jobs / Excel Job
/ product / Mitto / Jobs / HowTo Use an Excel Job
/ product / Mitto / Jobs / Excel Job / Creating
/ product / Mitto / Jobs / Excel Job / Scheduling
/ product / Mitto / Jobs / Query Job
/ product / Mitto / Jobs / HowTo Use a Query Job
/ product / Mitto / Jobs / Query Job / Creating
/ product / Mitto / Jobs / Query Job / Scheduling
/ product / Mitto / Jobs / File Download Job
/ product / Mitto / Jobs / HowTo Use a File Download Job 
/ product / Mitto / Jobs / File Download Job / Creating
/ product / Mitto / Jobs / File Download Job / Scheduling
/ product / Mitto / Jobs / Rclone Job
/ product / Mitto / Jobs / HowTo Use a Rclone Job
/ product / Mitto / Jobs / Rclone Job / Creating
/ product / Mitto / Jobs / Rclone Job / Scheduling
/ product / Mitto / Jobs / ADP Job 
/ product / Mitto / Jobs / HowTo Use an ADP Job 
/ product / Mitto / Jobs / ADP Job / Creating 
/ product / Mitto / Jobs / ADP Job / Scheduling
/ product / Mitto / Jobs / Amazon Selling Partner Job 
/ product / Mitto / Jobs / HowTo Use an Amazon Selling Partner Job 
/ product / Mitto / Jobs / Amazon Selling Partner Job / Creating 
/ product / Mitto / Jobs / Amazon Selling Partner Job / Scheduling
/ product / Mitto / Jobs / Facebook Job 
/ product / Mitto / Jobs / Facebook Job / Creating 
/ product / Mitto / Jobs / Facebook Job / Scheduling
/ product / Mitto / Jobs / Jira Job 
/ product / Mitto / Jobs / Jira Job / Creating 
/ product / Mitto / Jobs / Jira Job / Scheduling
/ product / Mitto / Jobs / LinkedIn Job 
/ product / Mitto / Jobs / LinkedIn Job / Creating 
/ product / Mitto / Jobs / LinkedIn Job / Scheduling
/ product / Mitto / Jobs / Mavenlink Job 
/ product / Mitto / Jobs / Mavenlink Job / Creating 
/ product / Mitto / Jobs / Mavenlink Job / Scheduling
/ product / Mitto / Jobs / Paycom Job 
/ product / Mitto / Jobs / Paycom Job / Creating 
/ product / Mitto / Jobs / Paycom Job / Scheduling
/ product / Mitto / Jobs / RingCentral Job 
/ product / Mitto / Jobs / RingCentral Job / Creating 
/ product / Mitto / Jobs / RingCentral Job / Scheduling
/ product / Mitto / Jobs / Terminus Job 
/ product / Mitto / Jobs / Terminus Job / Creating 
/ product / Mitto / Jobs / Terminus Job / Scheduling

/ product / Mitto / Mitto

/ product / Mitto / Mitto / HowTo Install Mitto
/ product / Mitto / Mitto / HowTo Troubleshoot Mitto
/ product / Mitto / Mitto / HowTo Upgrade Mitto
/ product / Mitto / Mitto / HowTo Restart Mitto
/ product / Mitto / Mitto / HowTo Uninstall Mitto
/ product / Mitto / Mitto / HowTo Add A Navigation
/ product / Mitto / Mitto / HowTo Determine Mitto Version
/ product / Mitto / Mitto / HowTo Connect DataGrip To Mitto
/ product / Mitto / Mitto / HowTo Connect Zwaf To Mitto
/ product / Mitto / Mitto / HowTo Manage Mitto Users

/ product / Mitto / Mitto Components

/ product / Mitto / Mitto Components / Troubleshooting Gunicorn Process
/ product / Mitto / Mitto Components / Troubleshooting Scheduler Process

/ product / Mitto / Vault

/ product / Mitto / Vault / HowTo Install And Configure Vault
/ product / Mitto / Vault / HowTo Use Swimlanes
/ product / Mitto / Vault / HowTo Use Vault
/ product / Mitto / Vault / HowTo Troubleshoot Vault
/ product / Mitto / Vault / HowTo Add Staff to AWS Vault
 
/ product / Mitto / Credentials

/ product / Mitto / Credentials / HowTo Add Basic Credentials
/ product / Mitto / Credentials / HowTo Add Generic Credentials
/ product / Mitto / Credentials / HowTo Add Rcone_SFTP Credentials
/ product / Mitto / Credentials / HowTo Add Zwaf Extract Credentials
/ product / Mitto / Credentials / HowTo Add Amazon Advertising Credentials
/ product / Mitto / Credentials / HowTo Use Credentials
/ product / Mitto / Credentials / HowTo Encrypt/Decrypt Credentials
/ product / Mitto / Credentials / HowTo Troubleshoot Credentials

/ product / Mitto / Docker

/ product / Mitto / Docker / Examples
/ product / Mitto / Docker / Using Docker
/ product / Mitto / Docker / Troubleshooting Docker

/ product / Mitto / General Linux

/ product / Mitto / General Linux / HowTo SSH to a Mitto From Linux
/ product / Mitto / General Linux / HowTo Troubleshoot SSH
/ product / Mitto / General Linux / HowTo Redirect Command Line Output
/ product / Mitto / General Linux / HowTo Change Hostname
/ product / Mitto / General Linux / HowTo Use Datagrip On Linux
/ product / Mitto / General Linux / HowTo Backup Mitto Job Configs

/ product / Mitto / General Windows

/ product / Mitto / General Windows / HowTo SSH to a Mitto From Windows
/ product / Mitto / General Windows / HowTo Use Datagrip On Windows

/ product / Mitto / Oracle / HowTo Use Internal Oracle Server

/ product / Mitto / Postgres

/ product / Mitto / Postgres / Examples
/ product / Mitto / Postgres / Using Postgres
/ product / Mitto / Postgres / Using PyEnv
/ product / Mitto / Postgres / Troubleshooting Postgres
/ product / Mitto / Postgres / Updating FQDN
/ product / Mitto / Postgres / HowTo Rename Tables in Postgresql
/ product / Mitto / Postgres / HowTo Use SQL to Append File's Max Date
/ product / Mitto / Postgres / HowTo Union Tables Together

/ product / Mitto / Jobs

/ product / Mitto / Jobs / Using Jobs
/ product / Mitto / Jobs / HowTo Troubleshoot a Job

/ product / Mitto / Reference

/ product / Mitto / Auth API 
/ product / Mitto / Authentication
/ product / Mitto / Bash Shell Scripting 
/ product / Mitto / Connecting to a MariaDB Server
/ product / Mitto / Connecting to a Microsoft Access 
/ product / Mitto / Connecting to a Microsoft Azure SQL 
/ product / Mitto / Connecting to a Microsoft SQL Server
/ product / Mitto / Connecting to a MySQL Server
/ product / Mitto / Connecting to a Oracle Server
/ product / Mitto / Connecting to a Postgresql Server
/ product / Mitto / Credentials
/ product / Mitto / Credentials / Demo Credentials and Demo Instructions for Customer
/ product / Mitto / Credentials / (Do we want to put actual credentials here - depends on how we secure this?)
/ product / Mitto / Credentials / Types/Examples
/ product / Mitto / Credentials / Using Credentials
/ product / Mitto / Data Editor 
/ product / Mitto / Data Staging 
/ product / Mitto / Data Security 
/ product / Mitto / Demo Creds and Cred Instructions for Customer 
/ product / Mitto / Domo
/ product / Mitto / Network Security 
/ product / Mitto / Email (Incoming IMAP) 
/ product / Mitto / Email IMAP Customer Instructions
/ product / Mitto / Email (Outgoing Gmail) 
/ product / Mitto / General Automation 
/ product / Mitto / Graph
/ product / Mitto / Inputters
/ product / Mitto / Inputters / Examples
/ product / Mitto / Inputters / Examples / API
/ product / Mitto / Inputters / Examples / Database
/ product / Mitto / Inputters / Examples / Flat File
/ product / Mitto / Inputters / Using Inputters
/ product / Mitto / JDBC 
/ product / Mitto / Jobs / Job Actions
/ product / Mitto / Jobs / Job Details
/ product / Mitto / Jobs / Job Types
/ product / Mitto / Jobs / Job Types / Difference Between Query and SQL Jobs
/ product / Mitto / Jobs / CMD Job / Sample Configs
/ product / Mitto / Jobs / CMD Job / Base Vs Purchased
/ product / Mitto / Jobs / Generic Job / Sample Configs
/ product / Mitto / Jobs / SQL Job / Best Practices with Views
/ product / Mitto / Jobs / SQL Job / Data Spine 
/ product / Mitto / Jobs / SQL Job / Sample Configs
/ product / Mitto / Jobs / CSV Job / Sample Configs
/ product / Mitto / Jobs / Imap Job / Sample Configs
/ product / Mitto / Jobs / REST Extract Job / Sample Configs
/ product / Mitto / Jobs / Vizql Extract Job / Sample Configs
/ product / Mitto / Jobs / Excel Job / Sample Configs
/ product / Mitto / Jobs / Query Job / Sample Configs
/ product / Mitto / Jobs / Query Job / Streaming in a Query Job
/ product / Mitto / Jobs / Query Job / Database Connector Strings
/ product / Mitto / Jobs / Query Job / Sample Configs
/ product / Mitto / Jobs / Query Job / Streaming in a Query Job
/ product / Mitto / Jobs / Query Job / Database Connector Strings
/ product / Mitto / Jobs / Query Job / Sample Configs
/ product / Mitto / Jobs / File Download Job / Sample Configs
/ product / Mitto / Jobs / Rclone Job / Sample Configs
/ product / Mitto / Jobs / ADP Job  / Sample Configs
/ product / Mitto / Jobs / Amazon Selling Partner Job  / Sample Configs
/ product / Mitto / Jobs / Coupa Job  / Sample Configs
/ product / Mitto / Jobs / Coupa / Background
/ product / Mitto / Jobs / Coupa / Tutorial
/ product / Mitto / Jobs / Coupa / How-To
/ product / Mitto / Jobs / Coupa / Reference
/ product / Mitto / Jobs / Facebook Job  / Sample Configs
/ product / Mitto / Jobs / Google Ads Job  / Sample Configs
/ product / Mitto / Jobs / Google Analytics Job  / Sample Configs
/ product / Mitto / Jobs / Google Sheets Job  / Sample Configs
/ product / Mitto / Jobs / Hubspot Job  / Sample Configs
/ product / Mitto / Jobs / Jira Job  / Sample Configs
/ product / mitto / jobs / LeafLogix Job  / Sample Configs
/ product / Mitto / Jobs / LinkedIn Job  / Sample Configs
/ product / Mitto / Jobs / Mavenlink Job  / Sample Configs
/ product / Mitto / Jobs / MJ Freeway Job  / Sample Configs
/ product / Mitto / Jobs / Paycom Job  / Sample Configs
/ product / Mitto / Jobs / QuickBooks Job  / Sample Configs
/ product / Mitto / Jobs / RingCentral Job  / Sample Configs
/ product / Mitto / Jobs / Salesforce Job  / Sample Configs
/ product / Mitto / Jobs / SugarCRM Job  / Sample Configs
/ product / Mitto / Jobs / Terminus Job  / Sample Configs
/ product / Mitto / Jobs / Zendesk Job  / Sample Configs
/ product / Mitto / Licensing 
/ product / Mitto / Mitto Metadata
/ product / Mitto / Mitto Metadata / Specs and Requirements 
/ product / Mitto / Mitto Metadata / Information Schema Columns 
/ product / Mitto / Mitto Metadata / Profiling Columns Values 
/ product / Mitto / Mitto Metadata / Profiling Table Column and Rows 
/ product / Mitto / Mitto BigQuery 
/ product / Mitto / Mitto CLI 
/ product / Mitto / Mitto Redshift 
/ product / Mitto / Mitto Security 
/ product / Mitto / Mitto Store Input
/ product / Mitto / Mitto UI 
/ product / Mitto / On-Prem Mitto Hosting
/ product / Mitto / On-Prem Mitto Technical Specs
/ product / Mitto / On-Prem Mitto Hosting / Mitto Connection to Customer VPN
/ product / Mitto / On-Prem Mitto Hosting / Troubleshooting On-Prem Mitto Issues
/ product / Mitto / Outputters
/ product / Mitto / Outputters / Examples
/ product / Mitto / Outputters / Using Outputters
/ product / Mitto / Outputter Analytics Database 
/ product / Mitto / Outputter JSON 
/ product / Mitto / Outputter Flatfile 
/ product / Mitto / PostFix 
/ product / Mitto / Pre-Installation Questionaire
/ product / Mitto / Python Scripting 
/ product / Mitto / Regex
/ product / Mitto / Reset SFDC API Security Token
/ product / Mitto / SDL
/ product / Mitto / Snapshot Tables
/ product / Mitto / Snapshot Job Configs
/ product / Mitto / Snowflake
/ product / Mitto / SSH and SSL
/ product / Mitto / SSH and SSL / Troubleshooting SSH Issues
/ product / Mitto / SSH and SSL / Troubleshooting SSL Issues
/ product / Mitto / Specs and Requirements 
/ product / Mitto / Steps
/ product / Mitto / Stores
/ product / Mitto / Stores / Using Stores
/ product / Mitto / Stores / What Is A Store
/ product / Mitto / Swimlanes
/ product / Mitto / Transforms
/ product / Mitto / Transforms / Examples
/ product / Mitto / Transforms / Using Transforms
/ product / Mitto / Upsert 
/ product / Mitto / Webhooks 


/ product / Mitto / Plugins
===

/ product / Mitto / Plugins / NetSuite / Background
/ product / Mitto / Plugins / NetSuite / Tutorial
/ product / Mitto / Plugins / NetSuite / How-To
/ product / Mitto / Plugins / NetSuite / Reference
/ product / Mitto / Plugins / Salesforce / Background
/ product / Mitto / Plugins / Salesforce / Tutorial
/ product / Mitto / Plugins / Salesforce / How-To
/ product / Mitto / Plugins / Salesforce / Reference
/ product / Mitto / Plugins / Salesforce / Reference / Reset SFDC API Security Token
/ product / Mitto / Plugins / Google Analytics / Background
/ product / Mitto / Plugins / Google Analytics / Tutorial
/ product / Mitto / Plugins / Google Analytics / How-To
/ product / Mitto / Plugins / Google Analytics / Reference
/ product / Mitto / Plugins / Amazon Selling Partners / Background
/ product / Mitto / Plugins / Amazon Selling Partners / Tutorial
/ product / Mitto / Plugins / Amazon Selling Partners / How-To
/ product / Mitto / Plugins / Amazon Selling Partners / Reference
/ product / Mitto / Plugins / Hubspot / Background
/ product / Mitto / Plugins / Hubspot / Tutorial
/ product / Mitto / Plugins / Hubspot / How-To
/ product / Mitto / Plugins / Hubspot / Reference
/ product / Mitto / Plugins / Microsoft Dynamics 365 / Background
/ product / Mitto / Plugins / Microsoft Dynamics 365 / Tutorial
/ product / Mitto / Plugins / Microsoft Dynamics 365 / How-To
/ product / Mitto / Plugins / Microsoft Dynamics 365 / Reference
/ product / Mitto / Plugins / Shopify / Background
/ product / Mitto / Plugins / Shopify / Tutorial
/ product / Mitto / Plugins / Shopify / How-To
/ product / Mitto / Plugins / Shopify / Reference
/ product / Mitto / Plugins / Zendesk / Background
/ product / Mitto / Plugins / Zendesk / Tutorial
/ product / Mitto / Plugins / Zendesk / How-To
/ product / Mitto / Plugins / Zendesk / Reference
/ product / Mitto / Plugins / Google Ads / Background
/ product / Mitto / Plugins / Google Ads / Tutorial
/ product / Mitto / Plugins / Google Ads / How-To
/ product / Mitto / Plugins / Google Ads / Reference
/ product / Mitto / Plugins / Marketo / Background
/ product / Mitto / Plugins / Marketo / Tutorial
/ product / Mitto / Plugins / Marketo / How-To
/ product / Mitto / Plugins / Marketo / Reference
/ product / Mitto / Plugins / MJ Freeway / Background
/ product / Mitto / Plugins / MJ Freeway / Tutorial
/ product / Mitto / Plugins / MJ Freeway / How-To
/ product / Mitto / Plugins / MJ Freeway / Reference
/ product / Mitto / Plugins / LinkedIn / Background
/ product / Mitto / Plugins / LinkedIn / Tutorial
/ product / Mitto / Plugins / LinkedIn / How-To
/ product / Mitto / Plugins / LinkedIn / Reference
/ product / Mitto / Plugins / ADP / Background
/ product / Mitto / Plugins / ADP / Tutorial
/ product / Mitto / Plugins / ADP / How-To
/ product / Mitto / Plugins / ADP / Reference
/ product / Mitto / Plugins / Amazon Advertising / Background
/ product / Mitto / Plugins / Amazon Advertising / Tutorial
/ product / Mitto / Plugins / Amazon Advertising / How-To
/ product / Mitto / Plugins / Amazon Advertising / Reference
/ product / Mitto / Plugins / Amazon Marketplace / Background
/ product / Mitto / Plugins / Amazon Marketplace / Tutorial
/ product / Mitto / Plugins / Amazon Marketplace / How-To
/ product / Mitto / Plugins / Amazon Marketplace / Reference
/ product / Mitto / Plugins / AppDynamics / Background
/ product / Mitto / Plugins / AppDynamics / Tutorial
/ product / Mitto / Plugins / AppDynamics / How-To
/ product / Mitto / Plugins / AppDynamics / Reference
/ product / Mitto / Plugins / Enquire CRM / Background
/ product / Mitto / Plugins / Enquire CRM / Tutorial
/ product / Mitto / Plugins / Enquire CRM / How-To
/ product / Mitto / Plugins / Enquire CRM / Reference
/ product / Mitto / Plugins / Fullstory / Background
/ product / Mitto / Plugins / Fullstory / Tutorial
/ product / Mitto / Plugins / Fullstory / How-To
/ product / Mitto / Plugins / Fullstory / Reference
/ product / Mitto / Plugins / IRS Logics / Background
/ product / Mitto / Plugins / IRS Logics / Tutorial
/ product / Mitto / Plugins / IRS Logics / How-To
/ product / Mitto / Plugins / IRS Logics / Reference
/ product / Mitto / Plugins / Jenzabar / Background
/ product / Mitto / Plugins / Jenzabar / Tutorial
/ product / Mitto / Plugins / Jenzabar / How-To
/ product / Mitto / Plugins / Jenzabar / Reference
/ product / Mitto / Plugins / Jira / Background
/ product / Mitto / Plugins / Jira / Tutorial
/ product / Mitto / Plugins / Jira / How-To
/ product / Mitto / Plugins / Jira / Reference
/ product / Mitto / Plugins / Leaf Logix / Background
/ product / Mitto / Plugins / Leaf Logix / Tutorial
/ product / Mitto / Plugins / Leaf Logix / How-To
/ product / Mitto / Plugins / Leaf Logix / Reference
/ product / Mitto / Plugins / LMS Platform / Background
/ product / Mitto / Plugins / LMS Platform / Tutorial
/ product / Mitto / Plugins / LMS Platform / How-To
/ product / Mitto / Plugins / LMS Platform / Reference
/ product / Mitto / Plugins / Magaja / Background
/ product / Mitto / Plugins / Magaja / Tutorial
/ product / Mitto / Plugins / Magaja / How-To
/ product / Mitto / Plugins / Magaja / Reference
/ product / Mitto / Plugins / Mavenlink / Background
/ product / Mitto / Plugins / Mavenlink / Tutorial
/ product / Mitto / Plugins / Mavenlink / How-To
/ product / Mitto / Plugins / Mavenlink / Reference
/ product / Mitto / Plugins / Metrc / Background
/ product / Mitto / Plugins / Metrc / Tutorial
/ product / Mitto / Plugins / Metrc / How-To
/ product / Mitto / Plugins / Metrc / Reference
/ product / Mitto / Plugins / Mongo DB / Background
/ product / Mitto / Plugins / Mongo DB / Tutorial
/ product / Mitto / Plugins / Mongo DB / How-To
/ product / Mitto / Plugins / Mongo DB / Reference
/ product / Mitto / Plugins / OpenDrive / Background
/ product / Mitto / Plugins / OpenDrive / Tutorial
/ product / Mitto / Plugins / OpenDrive / How-To
/ product / Mitto / Plugins / OpenDrive / Reference
/ product / Mitto / Plugins / Paycom / Background
/ product / Mitto / Plugins / Paycom / Tutorial
/ product / Mitto / Plugins / Paycom / How-To
/ product / Mitto / Plugins / Paycom / Reference
/ product / Mitto / Plugins / Quickbooks Online / Background
/ product / Mitto / Plugins / Quickbooks Online / Tutorial
/ product / Mitto / Plugins / Quickbooks Online / How-To
/ product / Mitto / Plugins / Quickbooks Online / Reference
/ product / Mitto / Plugins / Ring Central / Background
/ product / Mitto / Plugins / Ring Central / Tutorial
/ product / Mitto / Plugins / Ring Central / How-To
/ product / Mitto / Plugins / Ring Central / Reference
/ product / Mitto / Plugins / ServiceNow / Background
/ product / Mitto / Plugins / ServiceNow / Tutorial
/ product / Mitto / Plugins / ServiceNow / How-To
/ product / Mitto / Plugins / ServiceNow / Reference
/ product / Mitto / Plugins / SolarWinds / Background
/ product / Mitto / Plugins / SolarWinds / Tutorial
/ product / Mitto / Plugins / SolarWinds / How-To
/ product / Mitto / Plugins / SolarWinds / Reference
/ product / Mitto / Plugins / Sugar CRM / Background
/ product / Mitto / Plugins / Sugar CRM / Tutorial
/ product / Mitto / Plugins / Sugar CRM / How-To
/ product / Mitto / Plugins / Sugar CRM / Reference
/ product / Mitto / Plugins / Tamarac / Background
/ product / Mitto / Plugins / Tamarac / Tutorial
/ product / Mitto / Plugins / Tamarac / How-To
/ product / Mitto / Plugins / Tamarac / Reference

/ product / Custom Portal
===

/ product / Custom Portal / Background

/ product / Custom Portal / Background / Introduction
/ product / Custom Portal / Background / Why Custom Portal

/ product / Custom Portal / Tutorial
/ product / Custom Portal / Tutorial / Installing
/ product / Custom Portal / Tutorial / Troubleshooting

/ product / Custom Portal / HowTo

/ product / Custom Portal / HowTo / Installing
/ product / Custom Portal / HowTo / Troubleshooting

/ product / Custom Portal / HowTo / Jobs / Installing
/ product / Custom Portal / HowTo / Jobs / Troubleshooting

/ product / Custom Portal / Reference

/ product / Rapid Portal
===

/ product / Rapid Portal / Background

/ product / Rapid Portal / Background / Introduction
/ product / Rapid Portal / Background / Why Rapid Portal

/ product / Rapid Portal / Tutorial
/ product / Rapid Portal / Tutorial / Installing
/ product / Rapid Portal / Tutorial / Troubleshooting

/ product / Rapid Portal / HowTo

/ product / Rapid Portal / HowTo / Installing
/ product / Rapid Portal / HowTo / Troubleshooting

/ product / Rapid Portal / HowTo / Jobs / Installing
/ product / Rapid Portal / HowTo / Jobs / Troubleshooting

/ product / Rapid Portal / Reference

/ product / Rapid Portal / Reference / Credentials

/ product / Zwaf
===

/ product / Zwaf / Background 

/ product / Zwaf / Background / Introduction
/ product / Zwaf / Background / Why Zwaf
/ product / Zwaf / Tutorial
/ product / Zwaf / Tutorial / Installing
/ product / Zwaf / Tutorial / Troubleshooting
/ product / Zwaf / HowTo
/ product / Zwaf / HowTo / Installing
/ product / Zwaf / HowTo / Troubleshooting
/ product / Zwaf / Reference

---

/ product / Zwaf / Background 
/ product / Zwaf / Tutorial 
/ product / Zwaf / HowTo 
/ product / Zwaf / Reference 

/ product / Tableau
==

/ product / Tableau / Background 
/ product / Tableau / Tutorial 
/ product / Tableau / HowTo 
/ product / Tableau / Reference 

/ admin / Background 
/ admin / Tutorials 
/ admin / How-To 
/ admin / Reference 

/ dev / Background 
/ dev / Tutorials 
/ dev / Tutorials / Whitelisting IPs
/ dev / Tutorials / Turning Off Server
/ dev / Tutorials / Requesting Mitto Trial
/ dev / Tutorials / Converting Trial to Customer
/ dev / How-To 
/ dev / Reference 

/ devops / Background 
/ devops / Tutorials 
/ devops / How-To 
/ devops / Reference 

/ sales / Background 
/ sales / Tutorials 
/ sales / How-To 
/ sales / Reference 

Alternate:

/ product / Mitto / Jobs
===

/ product / Mitto / Jobs / Generic Job / Background
/ product / Mitto / Jobs / Generic Job / Background / Why a Generic Job
/ product / Mitto / Jobs / Generic Job / Tutorial
/ product / Mitto / Jobs / Generic Job / Tutorial / Using a Generic Job
/ product / Mitto / Jobs / Generic Job / HowTo 
/ product / Mitto / Jobs / Generic Job / HowTo / HowTo Use a Generic Job
/ product / Mitto / Jobs / Generic Job / Reference 
/ product / Mitto / Jobs / Generic Job / Reference / Generic Job Alternate Configurations

/ product / Mitto / Jobs / CMD Job / Background
/ product / Mitto / Jobs / CMD Job / Background / Why a CMD Job
/ product / Mitto / Jobs / CMD Job / Tutorial
/ product / Mitto / Jobs / CMD Job / Tutorial / Using a CMD Job
/ product / Mitto / Jobs / CMD Job / HowTo 
/ product / Mitto / Jobs / CMD Job / HowTo / HowTo Use a CMD Job
/ product / Mitto / Jobs / CMD Job / Reference 
/ product / Mitto / Jobs / CMD Job / Reference / CMD Job Alternate Configurations

/ product / Mitto / Jobs / SQL Job / Background
/ product / Mitto / Jobs / SQL Job / Background / Why a SQL Job
/ product / Mitto / Jobs / SQL Job / Tutorial
/ product / Mitto / Jobs / SQL Job / Tutorial / Using a SQL Job
/ product / Mitto / Jobs / SQL Job / HowTo 
/ product / Mitto / Jobs / SQL Job / HowTo / HowTo Use a SQL Job
/ product / Mitto / Jobs / SQL Job / Reference 
/ product / Mitto / Jobs / SQL Job / Reference / SQL Job Alternate Configurations

--Add Remaining Job Types--

```

## Open Issues

* If documentation repos are separate from code, how to integrate documentation
  generated from code?
* Authentication / private docs.  ZWAF?  OAuth2? IDP?
* Versioning for product documentation.
* Metadata tags to control access to private docs?
* Zuar branding of theme
* Github custom domain for pages
* Ultimate destination of content.  Almost certainly need github workflow to publish to
  S3.
