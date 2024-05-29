def lambda_handler(event, context):
    
    return 'statusCode: 200, Hello from Lambda!'



##################################################################################################

# In case you are using API Gateway proxy integration with Lambda then use this code, check out my medium blog to learn more:
# 
    
#import json

#def lambda_handler(event, context):
#    message = {'message': 'Hello From Lambda!'}
#    return {
#        'statusCode': 200,
#        'headers': {'Content-Type': 'application/json'},
#        'body': json.dumps(message),
#    }
