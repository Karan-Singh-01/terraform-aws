def lambda_handler(event, context):
    
    return 'statusCode: 200, Hello from Lambda!'



##################################################################################################

# For API Gateway proxy integration with Lambda, use the following code; check out my medium blog to learn more:
# https://medium.com/@karansingh1550/deploy-serverless-with-terraform-conquer-common-api-gateway-lambda-challenges-e4375a2169eb

# Remove the hash marks (#) from the below code:

#import json

#def lambda_handler(event, context):
#    message = {'message': 'Hello From Lambda!'}
#    return {
#        'statusCode': 200,
#        'headers': {'Content-Type': 'application/json'},
#        'body': json.dumps(message),
#    }
