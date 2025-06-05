# CI/CD Pipeline Documentation

## Overview
This document describes the Continuous Integration and Continuous Deployment (CI/CD) pipeline for the TMDash project. The pipeline is implemented using GitHub Actions and automates the build, test, and deployment processes.

## Pipeline Triggers

The pipeline runs in the following scenarios:
- **On Push**: Any push to the `main` branch
- **Pull Requests**: Any pull request targeting the `main` branch
- **Manual Trigger**: Can be manually triggered from the GitHub Actions tab

## Workflow Jobs

### 1. Build and Test
- **Purpose**: Build the application and run tests
- **Runs On**: Ubuntu latest
- **Steps**:
  1. Checkout code
  2. Set up MoonBit environment
  3. Cache dependencies
  4. Install dependencies
  5. Build the project
  6. Run tests
  7. Upload build artifacts

### 2. Deploy (Production)
- **Purpose**: Deploy the application to production
- **Trigger**: Only runs on successful completion of the Build and Test job for the `main` branch
- **Environment**: Production
- **Steps**:
  1. Download build artifacts
  2. Deploy to production environment
  3. Send deployment notification

## Environment Variables

| Variable | Description | Required | Default |
|----------|-------------|----------|---------|
| `DEPLOY_ENV` | Deployment environment name | No | `production` |
| `SLACK_WEBHOOK_URL` | Slack webhook URL for notifications | No | - |

## Manual Deployment

To manually trigger a deployment:
1. Go to the GitHub Actions tab
2. Select the "CI/CD Pipeline" workflow
3. Click "Run workflow"
4. Select the branch to deploy from
5. Click "Run workflow"

## Artifacts

Build artifacts are uploaded at the end of the Build and Test job and include:
- Compiled WebAssembly files
- Any other files in the `dist/` directory (excluding test files)

## Notifications

Deployment status notifications are sent to Slack when configured. To set up notifications:
1. Create a Slack incoming webhook
2. Add the webhook URL as a repository secret named `SLACK_WEBHOOK_URL`

## Security Considerations

- Never store sensitive information in the repository
- Use GitHub Secrets for all credentials and API keys
- Review GitHub Actions permissions regularly
- Keep actions and dependencies up to date

## Troubleshooting

Common issues and solutions:

1. **Build Fails**
   - Check the build logs for specific error messages
   - Verify all dependencies are correctly specified in `moon.mod.json`

2. **Deployment Fails**
   - Verify deployment credentials have the correct permissions
   - Check network connectivity to the deployment target

3. **Cache Issues**
   - The pipeline caches MoonBit packages to speed up builds
   - If you encounter dependency issues, try clearing the cache by updating the cache key in the workflow file
