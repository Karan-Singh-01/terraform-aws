**Overview:**

This repository contains the Terraform configuration code referenced in my Medium blog post titled "Troubleshooting API Gateway and Lambda Deployment with Terraform". The project demonstrates setting up an API Gateway REST API connected to an AWS Lambda function. Accessing the API's invoke URL will display the contents of the lambda.py file.

**Project Details:**

<img width="1705" alt="Screenshot 2024-05-27 at 4 24 32 PM" src="https://github.com/Karan-Singh-01/terraform-aws/assets/157451190/fedbd7e9-c97f-4de2-81d4-45ca561dda6b">

The two main resources created are the API Gateway and the Lambda function. The rest of the resources handle the necessary configurations, integrations, and permissions to ensure seamless operation and secure access.

Resources Created:
1. API Gateway - REST API: Defines the main API structure.
2. Lambda Function: Backend logic executed when the API is called.
3. API Gateway Resource: Defines the URL path for the API.
4. AWS API Gateway Method: Specifies interaction methods for clients.
5. API Gateway Integration: Connects API Gateway to the Lambda function.
6. API Gateway Method Response: Specifies expected responses from API methods.
7. API Gateway Integration Response: Manages integration responses back to the API.
8. Lambda Permission: Grants API Gateway permission to invoke the Lambda function.
9. API Gateway Deployment: Deploys the API to specified stages.
10. AWS API Gateway Stage: Defines deployment stages like testing or production.
11. IAM Role and Policy: Manages permissions for secure resource interaction.
12. IAM Role Policy Attachment: Attaches policies for necessary permissions.

**Result:**

After successfully deploying the infrastructure using Terraform, accessing the API's invoke URL will return the following JSON response, depending on your browser:
![image](https://github.com/Karan-Singh-01/terraform-aws/assets/157451190/41665155-513a-49d0-9b47-e6c335e90dfd)

**Troubleshooting:**

For any issues encountered during deployment or configuration, refer to the blog post for troubleshooting tips and best practices.

**Feedback:**

Feel free to open an issue or reach out with any feedback or questions!

**Let's connect:**

LinkedIn: https://www.linkedin.com/in/karan7678/

Email: karansingh1550@gmail.com
