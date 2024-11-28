from app import app

def test_status():
    response = app.test_client().get('/')
    assert response.status_code == 200
    
def test_data():
    response = app.test_client().get('/')
    assert b'<h1><strong>Welcome to Gym Management System</strong></h1>6' in response.data 