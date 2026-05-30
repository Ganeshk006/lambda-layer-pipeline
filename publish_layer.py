import boto3
import os

client = boto3.client('lambda', region_name=os.environ['AWS_REGION'])

with open('layer.zip', 'rb') as f:
    zip_bytes = f.read()

response = client.publish_layer_version(
    LayerName=os.environ['LAYER_NAME'],
    Description='Sample Lambda Layer with requests library',
    Content={'ZipFile': zip_bytes},
    CompatibleRuntimes=['python3.11'],
)

print(f"Layer published: {response['LayerVersionArn']}")