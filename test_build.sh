
#!/bin/bash

echo "🔍 Starting Ansible Docker image build test..."

docker build -t ansible-local .

if [ $? -eq 0 ]; then
    echo "✅ Build completed successfully!"
else
    echo "❌ Build failed."
    exit 1
fi
