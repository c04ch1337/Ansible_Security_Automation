
#!/bin/bash

echo "🔧 Starting Docker Semaphore (Ansible UI) setup..."
docker compose -f semaphore/docker-compose.yml up -d

echo "✅ Semaphore UI is now running."
echo "🌐 Access the UI at: http://localhost:3000"
echo "👤 Login with:"
echo "   Username: admin"
echo "   Password: admin"
