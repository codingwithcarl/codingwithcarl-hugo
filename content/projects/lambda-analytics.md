---
title: "Lambda Analytics"
date: 2023-06-26T21:16:50-04:00
draft: false
---

*Automate SQL queries with a Python Lambda Function.*

[View Codebase »](https://github.com/codingwithcarl/lambda_sql_analytics)

<!-- ABOUT -->
## About

This is a lambda function which queries an RDS database, writes the results to an Excel file, and saves the file to an S3 bucket.

### Built With

* [Python](https://python.org/)
* [AWS Lambda](https://aws.amazon.com/lambda/)

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

1. An AWS account
2. An RDS database to run the queries against
3. Permissions for RDS, Lambda, S3, and EventBridge (CloudWatch Events)


### Installation

1. Clone the repo
2. Modify `lambda.py` to match your specific environment: database connection details, queries you want to run, name your Excel sheets, name the file, and specify the S3 bucket name.
3. If you wish to have this run on a schedule, add an EventBridge trigger and specify an interval number of days when this function is executed. 


<!-- USAGE EXAMPLES -->
## Usage

This function is very useful if you have a need to re-run the same SQL queries on a set schedule, like every week or two, or even every day. The Excel file generated could be useful to a business analyst to track any kind of change to your database: number of users, emails for a newsletter, telemetry, etc.  