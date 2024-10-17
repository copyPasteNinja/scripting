import os, json, base64, urllib3, boto3

client = boto3.client('s3')

def getBuckets():
    response = client.list_buckets()
    return response['Buckets']

def getBucketTags(bucket):
    try:
        response = client.get_bucket_tagging(
            Bucket=bucket,
        )
        if response:
            tag_list = [f"{tags['Key']} : {tags['Value']}" for tags in response['TagSet']]
            return tag_list
    except:
        return "No Tags"


TableRow="""
<tr>
    <th>Bucket Name</th>
    <th>CreatedAt</th>
    <th>Tags</th>
</tr>
"""

buckets = getBuckets()
for bucket in buckets:
    bucket_tags = getBucketTags(bucket['Name'])
    bucket_name = bucket['Name']
    bucket_creation = bucket['CreationDate']
    html_tags = ""
    if bucket_tags == "No Tags":
        html_tags += f"<li>No Tags</li>"
    else:
        for tag in bucket_tags:
            html_tags += f"<li>{tag}</li>"

    TableRow += f"""<tr>
    <td>{bucket_name}</td>
    <td>{bucket_creation}</td>
    <td>
        <ul>
        {html_tags}
        </ul>
    </td>
</tr>"""



# Initialize a PoolManager for the connection
http = urllib3.PoolManager()

# Get credentials from environment variables
email = os.getenv("EMAIL")
token = os.getenv("ATLASSIAN_TOKEN")
domain = os.getenv('DOMAIN')

# Encode the email and token for basic auth
auth_string = f"{email}:{token}"
auth_bytes = auth_string.encode("ascii")
auth_base64 = base64.b64encode(auth_bytes).decode("ascii")

# Define the URL, payload, and headers
url = f"https://{domain}/wiki/api/v2/pages"
headers = {
    "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": f"Basic {auth_base64}"
}

payload = json.dumps({
    "spaceId": "1672347650",
    "title": "S3 Buckets HTML",
    "body": {
        "representation": "storage",
        "value": f"""
<h1>Dynamic S3 Bucket Table</h1>
<p>This is a cool project.</p>
<br>
<h2>Tags:</h2>
<br>
<table>
    {TableRow}
</table>
"""
    }
    })

try:
    response = http.request(
        "POST",
        url,
        body=payload, 
        headers=headers
    )

    # Check the response status and data
    print(f"Response Status: {response.status}")
    print(f"Response Data: {response.data.decode('utf-8')}")

except:
    print({
        "status": "failed", 
        "error": "Something went wrong."
        })
