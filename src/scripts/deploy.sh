#!/bin/bash
# Deployment script for Jenkins automation
set -e

echo 'Starting deployment process...'
echo 'Environment: \${ENVIRONMENT:-staging}'

# Install dependencies
npm ci --only=production

# Build application
npm run build:prod

# Deploy to S3
aws s3 sync ./dist/ s3://\${S3_BUCKET}/

echo 'Deployment completed successfully!'
