import requests

response = requests.get('https://65bca57db51f9b29e931efdb.mockapi.io/api/k1/Task')

if response.status_code == 200:
    print(str(response) + 'The API endpoint is working.')
else:
    print(str(response) +'The API endpoint is not working.')
