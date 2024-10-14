import boto3, pprint, os
import requests
from requests.auth import HTTPBasicAuth
import json

pp = pprint.PrettyPrinter(indent=4)
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

def Publish():


    url = f"https://{os.getenv("DOMAIN")}/wiki/api/v2/pages"
    auth = HTTPBasicAuth(os.getenv("EMAIL"), os.getenv("ATLASSIAN_TOKEN"))

    headers = {
    "Accept": "application/json",
    "Content-Type": "application/json"
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

### space ID
    # spaceID = requests.request("GET", "https://{os.getenv("DOMAIN")}/wiki/api/v2/spaces/", data=payload, headers=headers, auth=auth)
    # pp.pprint(spaceID.text)

    response = requests.request(
    "POST",
    url,
    data=payload,
    headers=headers,
    auth=auth
    )

    print(json.dumps(json.loads(response.text), sort_keys=True, indent=4, separators=(",", ": ")))

Publish()