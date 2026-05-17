from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def assert_http_200(response):
    """
    Asserts that the response has a successful 200 HTTP response
    """
    assert response.status_code == 200

def test_base_page():
    """
    Asserts that the base page of / redirects to /health and has 
    HTTP 200 response
    """
    response = client.get("/")
    assert_http_200(response)
    test_health_check()


def test_health_check():
    """
    Asserts that /health page has a 200 HTTP response, provides that 
    status is healthy,
    service is Service Health API
    """
    response = client.get("/health")
    data = response.json()

    assert_http_200(response)
    assert data['status'] == 'healthy'
    assert data['service'] == 'Service Health API'

def test_metadata():
    """
    Asserts that /metadata page has a 200 HTTP response, provides that 
    service is called Service Health API, 
    environment is local,
    version is 0.0.1
    """
    response = client.get("/metadata")
    data = response.json()

    assert_http_200(response)
    assert data['service'] == 'Service Health API'
    assert data['environment'] == 'local'
    assert data['version'] == '0.0.1'


