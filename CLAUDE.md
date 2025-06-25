# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Development Commands

### Build and Test
- `crystal build src/bento_client.cr` - Build the project
- `crystal spec` - Run all tests
- `crystal spec spec/bento/client_spec.cr` - Run specific test file
- `shards install` - Install dependencies
- `crystal run src/bento_client.cr` - Run the main file

### Development Setup
- Requires Crystal compiler (~> 1.16.3) and shards package manager
- Environment variables needed: `BENTO_PUBLISHABLE_KEY`, `BENTO_SECRET_KEY`, `BENTO_SITE_UUID`

## Architecture Overview

This is a Crystal language wrapper for the Bento API (email marketing platform). The codebase follows a simple modular structure:

### Core Structure
- `src/bento_client.cr` - Main entry point, defines BentoClient module and version
- `src/bento/client.cr` - HTTP client with authentication for Bento API
- `src/bento/create_event.cr` - Event creation functionality for batch processing
- `spec/` - Test specifications using Crystal's built-in spec framework

### Key Components
- **Bento::Client** - Handles HTTP client setup with basic auth using publishable/secret keys
- **Bento::Event** - Provides `create_event` class method for sending batch events to Bento API
- Authentication uses Base64-encoded basic auth with publishable_key:secret_key format
- All API calls go through `app.bentonow.com` over HTTPS

### API Integration
The library primarily implements the Bento batch events API endpoint (`/api/v1/batch/events`) for:
- Adding users and user information
- Adding tags to existing users  
- Adding custom fields to existing users
- Processing purchase events with cart details

### Module Namespacing
Note: There's an inconsistency in the codebase - `Bento::Event` references `Bentonow::Client` instead of `Bento::Client` in create_event.cr:6. This should be corrected when making changes.