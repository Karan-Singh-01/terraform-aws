**Overview:**

This repository contains the Terraform configuration code referenced in my Medium blog post: https://medium.com/@karansingh1550/deploy-serverless-with-terraform-conquer-common-api-gateway-lambda-challenges-e4375a2169eb . This involves creating several AWS resources using Terraform to ensure seamless integration and deployment. Accessing the API's invoke URL will display the response from the lambda function. 

**Project Details:**

![image](https://github.com/Karan-Singh-01/terraform-aws/assets/157451190/89503e2c-b22d-40ae-bcb0-6ba6c13b26a1)


The two main resources created are the API Gateway and the Lambda function. The rest of the resources handle the necessary configurations, integrations, and permissions to ensure seamless operation and secure access.

Resources Created:
1. API Gateway - REST API: Defines the main API structure.
2. Lambda Function: Python-based backend logic executed when the API is called.
3. API Gateway Resource: Defines the URL path for the API.
4. API Gateway Method: Specifies interaction methods for clients.
5. API Gateway Integration: Connects API Gateway to the Lambda function.
6. API Gateway Method Response: Specifies expected responses from API methods.
7. API Gateway Integration Response: Manages integration responses back to the API.
8. Lambda Permission: Grants API Gateway permission to invoke the Lambda function.
9. API Gateway Deployment: Deploys the API to specified stages.
10. API Gateway Stage: Defines deployment stages like testing or production.
11. IAM Role and Policy: Manages permissions for secure resource interaction.
12. IAM Role Policy Attachment: Attaches policies for necessary permissions.

**NOTE:** If you are using API proxy integration with Lambda then you need to make a few changes in the code, check out my medium blog post for the same:  

**Troubleshooting:**

For any issues encountered during deployment or configuration, please refer to my blog post for troubleshooting tips and best practices.

**Feedback:**

Feel free to open an issue or reach out with any feedback or questions!

**Let's connect:**

LinkedIn: https://www.linkedin.com/in/karan7678/

Email: karansingh1550@gmail.com
