import unittest
from app import app

class FlaskTestCase(unittest.TestCase):
    def setUp(self):
        app.config['TESTING'] = True
        self.client = app.test_client()

    def test_home(self):
        response = self.client.get('/')
        self.assertEqual(response.status_code, 200)

    def test_login_page(self):
        response = self.client.get('/login')
        self.assertEqual(response.status_code, 200)

    def test_invalid_login(self):
        response = self.client.post('/login', data=dict(username="wrong", password="wrong"))
        self.assertIn(b'Invalid login', response.data)

if __name__ == '__main__':
    unittest.main()
